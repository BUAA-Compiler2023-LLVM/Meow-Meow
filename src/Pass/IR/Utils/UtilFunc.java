package Pass.IR.Utils;

import IR.IRModule;
import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.Instructions.BrInst;
import IR.Value.Instructions.CallInst;
import IR.Value.Instructions.Instruction;
import Utils.DataStruct.IList;

public class UtilFunc {
    public static void initCFG(Function function){
        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();
            for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                Instruction inst = instNode.getValue();
                if(inst instanceof BrInst brInst){
                    if(brInst.isJump()){
                        BasicBlock jumpBb = brInst.getJumpBlock();
                        bb.setNxtBlock(jumpBb);
                        jumpBb.setPreBlock(bb);
                    }
                    else{
                        BasicBlock left = brInst.getTrueBlock();
                        BasicBlock right = brInst.getFalseBlock();
                        bb.setNxtBlock(left);
                        bb.setNxtBlock(right);
                        left.setPreBlock(bb);
                        right.setPreBlock(bb);
                    }
                }
            }
        }
    }

    public static void buildCallRelation(IRModule module){
        for(Function function : module.getFunctions()){
            function.getCallerList().clear();
            function.getCalleeList().clear();
        }
        for(Function function : module.getFunctions()){
            for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
                BasicBlock bb = bbNode.getValue();
                for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                    Instruction inst = instNode.getValue();
                    if(inst instanceof CallInst callInst && !callInst.getFunction().isLibFunction()){
                        Function targetFunc = callInst.getFunction();
                        function.addCallee(targetFunc);
                        targetFunc.addCaller(function);
                    }
                }
            }
        }
    }
}
