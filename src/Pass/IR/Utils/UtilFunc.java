package Pass.IR.Utils;

import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.Instructions.BrInst;
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
}
