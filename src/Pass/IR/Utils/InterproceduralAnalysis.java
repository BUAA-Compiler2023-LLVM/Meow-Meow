package Pass.IR.Utils;

import IR.IRModule;
import IR.Type.PointerType;
import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.GlobalVar;
import IR.Value.Instructions.*;
import IR.Value.Value;
import Utils.DataStruct.IList;

//  过程间分析
//  计算函数是否有副作用，以及函数是否使用全局变量
//  同时设置函数的一些属性，如canGVN等等
public class InterproceduralAnalysis{

    public static void run(IRModule module){
        //  初始化默认所有函数无副作用
        for(Function function : module.getFunctions()){
            function.setHasSideEffect(false);
            function.setUseGV(false);
        }

        //  标记是否使用全局变量
        for(Function function : module.getFunctions()){
            for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
                BasicBlock bb = bbNode.getValue();
                for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                    Instruction inst = instNode.getValue();
                    if(inst instanceof LoadInst){
                        Value pointer = ((LoadInst) inst).getPointer();
                        if(pointer instanceof AllocInst && ((AllocInst) pointer).getAllocType().isIntegerTy()){
                            continue;
                        }

                        Value array = AliasAnalysis.getArrRoot(pointer);
                        if (AliasAnalysis.isGlobal(array)) {
                            function.setUseGV(true);
                            //  用load去处理一个数组，那eleType肯定是i32啊(不过为了以防bug先加上)
                            if (((PointerType) array.getType()).getEleType().isIntegerTy()) {
                                function.addLoadGV((GlobalVar) array);
                            }
                        }
                    }
                    else if(inst instanceof StoreInst) {
                        Value pointer = ((StoreInst) inst).getPointer();
                        if (pointer instanceof AllocInst && ((AllocInst) pointer).getAllocType().isIntegerTy()) {
                            continue;
                        }
                        Value array = AliasAnalysis.getArrRoot(pointer);
                        if (AliasAnalysis.isGlobal(array) || AliasAnalysis.isParam(array)) {
                            function.setHasSideEffect(true);
                            if (((PointerType) array.getType()).getEleType().isIntegerTy()) {
                                function.addStoreGV((GlobalVar) array);
                            }
                        }
                    }
                    else if(inst instanceof CallInst){
                        if(((CallInst) inst).getFunction().isLibFunction()){
                            function.setHasSideEffect(true);
                        }
                    }
                }
            }
        }

        // 递归标记
        for(Function function : module.getFunctions()) {
            if(function.isHasSideEffect()) {
                markSideEffect(function);
            }
            if (function.isUseGV()) {
                markUseGV(function);
            }
        }
    }

    private static void markSideEffect(Function function) {
        for (Function caller : function.getCallerList()) {
            caller.getStoreGVs().addAll(function.getStoreGVs());
            if (!caller.isHasSideEffect()) {
                caller.setHasSideEffect(true);
                markSideEffect(caller);
            }
        }
    }

    private static void markUseGV(Function function) {
        for (Function caller : function.getCallerList()) {
            caller.getLoadGVs().addAll(function.getLoadGVs());
            if (!caller.isUseGV()) {
                caller.setUseGV(true);
                markUseGV(caller);
            }
        }
    }
}

