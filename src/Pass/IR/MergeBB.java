package Pass.IR;

import IR.IRModule;
import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.Instructions.BrInst;
import IR.Value.Instructions.Instruction;
import Pass.Pass;
import Utils.DataStruct.IList;

import java.util.ArrayList;

import static Pass.IR.Utils.UtilFunc.initCFG;

/*
*   MergeBB将只有一条跳转指令的非入口基本块删除
*   并修改与之相关的pre,nxt信息
*
* */
public class MergeBB implements Pass.IRPass {

    @Override
    public String getName() {
        return "MergeBB";
    }

    @Override
    public void run(IRModule module) {
        for(Function function : module.getFunctions()){
            initCFG(function);

            ArrayList<BasicBlock> deleteBbs = new ArrayList<>();
            for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
                BasicBlock bb = bbNode.getValue();
                if(bb.equals(function.getBbEntry())){
                    continue;
                }
                Instruction firstInst = bb.getFirstInst();
                Instruction lastInst = bb.getLastInst();
                if(firstInst.equals(lastInst)
                        && lastInst instanceof BrInst brInst
                        && brInst.isJump()){
                    deleteBbs.add(bb);
                }
            }

            for(BasicBlock deleteBb : deleteBbs){
                BasicBlock targetBb = ((BrInst) deleteBb.getLastInst()).getJumpBlock();
                for(BasicBlock preBb : deleteBb.getPreBlocks()){
                    preBb.turnBrBlock(deleteBb, targetBb);
                }
                deleteBb.removeSelf();
            }
        }
    }
}
