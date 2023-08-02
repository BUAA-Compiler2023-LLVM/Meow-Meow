package Pass.IR;

import IR.IRModule;
import IR.Use;
import IR.Value.*;
import IR.Value.Instructions.GepInst;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.LoadInst;
import IR.Value.Instructions.StoreInst;
import Pass.IR.Utils.AliasAnalysis;
import Pass.Pass;
import Utils.DataStruct.IList;

import java.util.ArrayList;
import java.util.HashSet;

public class ConstArrayFold implements Pass.IRPass {

    HashSet<GlobalVar> globalArrs;

    @Override
    public void run(IRModule module) {
        initConstArray(module);
        foldConstArray(module);
    }

    private void initConstArray(IRModule module){
        globalArrs.addAll(module.getGlobalVars());
        //  除去所有被store过的全局数组
        for(Function function : module.getFunctions()) {
            for (IList.INode<BasicBlock, Function> bbNode : function.getBbs()) {
                BasicBlock bb = bbNode.getValue();
                for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                    Instruction inst = instNode.getValue();
                    if(inst instanceof StoreInst storeInst){
                        Value pointer = storeInst.getPointer();
                        Value root = AliasAnalysis.getRoot(pointer);
                        if(root instanceof GlobalVar globalVar && globalVar.isArray()){
                            globalArrs.remove(globalVar);
                        }
                    }
                }
            }
        }
    }

    private void foldConstArray(IRModule module){
        for(Function function : module.getFunctions()) {
            for (IList.INode<BasicBlock, Function> bbNode : function.getBbs()) {
                BasicBlock bb = bbNode.getValue();
                for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                    Instruction inst = instNode.getValue();
                    if(inst instanceof GepInst gepInst){
                        Value ptr = gepInst.getTarget();
                        if(ptr instanceof GlobalVar globalVar && globalArrs.contains(globalVar)){
                            ArrayList<Value> indexs = gepInst.getIndexs();
                            boolean allConst = true;
                            for(Value value : indexs){
                                if(!(value instanceof ConstInteger)){
                                    allConst = false;
                                    break;
                                }
                            }
                            if(allConst){
                                ArrayList<Integer> intIndexs = new ArrayList<>();
                                for(int i = 1; i < indexs.size(); i++){
                                    intIndexs.add(((ConstInteger) indexs.get(i)).getValue());
                                }

                                Value retValue = getGlobalArrValue(globalVar, intIndexs);
                                if(retValue != null){
                                    for(Use use : globalVar.getUseList()){
                                        User user = use.getUser();
                                        if(user instanceof LoadInst loadInst){
                                            loadInst.replaceUsedWith(retValue);
                                        }
                                    }
                                }

                            }

                        }
                    }
                }
            }
        }
    }

    private Value getGlobalArrValue(GlobalVar globalVar, ArrayList<Integer> indexs){

        return null;
    }

    @Override
    public String getName() {
        return "ConstArrayFold";
    }
}
