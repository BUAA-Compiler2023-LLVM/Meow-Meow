package Pass.IR;

import IR.IRModule;
import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.*;
import IR.Value.Value;
//import Pass.IR.Utils.AliasAnalysis;
//import Pass.IR.Utils.InterproceduralAnalysis;
import Pass.IR.Utils.AliasAnalysis;
import Pass.IR.Utils.InterproceduralAnalysis;
import Pass.Pass;
import Utils.DataStruct.IList;

import java.util.ArrayList;
import java.util.HashSet;

public class DCE implements Pass.IRPass {

    @Override
    public String getName() {
        return "DCE";
    }

    private HashSet<Instruction> usefulInsts;
    @Override
    public void run(IRModule module) {
        ArrayList<Function> uselessFuncs = new ArrayList<>();
        InterproceduralAnalysis.run(module);
        for(Function function : module.getFunctions()){
            usefulInsts = new HashSet<>();
            if(function.getCallerList().isEmpty() && !function.getName().equals("@main")){
                uselessFuncs.add(function);
            }
            else if(!function.isLibFunction()) {
                runDCE(function);
            }
        }
        for(Function uselessFunc : uselessFuncs){
            module.getFunctions().remove(uselessFunc);
        }
    }

    private void runDCE(Function function){
        ArrayList<Instruction> deletedInsts = new ArrayList<>();
//        removeUselessStore(function);
        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();
            for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                Instruction inst = instNode.getValue();
                if(isUseful(inst)){
                    findUsefulClosure(inst);
                }
            }
        }

        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();
            for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                Instruction inst = instNode.getValue();
                if(!usefulInsts.contains(inst)){
                    deletedInsts.add(inst);
                }
            }
        }

        for(Instruction deleteInst : deletedInsts){
            deleteInst.removeSelf();
        }
    }

    private void findUsefulClosure(Instruction inst){
        if(usefulInsts.contains(inst)){
            return ;
        }
        usefulInsts.add(inst);
        for(Value value : inst.getOperands()){
            if(value instanceof Instruction){
                findUsefulClosure((Instruction) value);
            }
        }
    }

    /*
    * 判断一个指令是否有副作用：
    * 1. Br, Ret, Store
    * 2. Call lib_func/有副作用的func
    *
    * */
    private boolean isUseful(Instruction inst){
        OP op = inst.getOp();
        //  Q: 为什么store也是有用的?
        if(op == OP.Br || op == OP.Ret || op == OP.Store){
            return true;
        }
        else if(op == OP.Call){
            Function callFunc = ((CallInst) inst).getFunction();
            if(callFunc.isLibFunction()) return true;
            return callFunc.isHasSideEffect();
        }
        return false;
    }

    //  removeUselessStore删除一系列store相同指针构成的指令集中前面无用的store
    //  只保留最后一个store指令
    //  遇到load, call等则停止搜索store
    private void removeUselessStore(Function function){
        ArrayList<Instruction> deletedInsts = new ArrayList<>();
        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();

            IList<Instruction, BasicBlock> insts = bb.getInsts();
            IList.INode<Instruction, BasicBlock> curNode = insts.getHead();
            while (curNode != null){
                Instruction curInst = curNode.getValue();
                if(curInst instanceof StoreInst curStoreInst){
                    Value pointer = AliasAnalysis.getArrRoot(curStoreInst);
                    IList.INode<Instruction, BasicBlock> nxtNode = curNode.getNext();
                    while (nxtNode != null){
                        Instruction nxtInst = nxtNode.getValue();
                        if(nxtInst instanceof StoreInst nxtStoreInst){
                            if(curStoreInst.getPointer() == nxtStoreInst.getPointer()){
                                deletedInsts.add(curStoreInst);
                                break;
                            }
                        }
                        else if(nxtInst instanceof LoadInst loadInst){
                            Value nxtPointer = AliasAnalysis.getArrRoot(loadInst.getPointer());
                            //  TODO 完成别名分析相关接口
                            break;
                        }
                        else if(nxtInst instanceof CallInst){
                            //  TODO 完成别名分析相关接口
                            break;
                        }
                        nxtNode = nxtNode.getNext();
                    }
                }
                curNode = curNode.getNext();
            }
        }
        for(Instruction deleteInst : deletedInsts){
            deleteInst.removeSelf();
        }
    }
}

