package IR.Value.Instructions;

import IR.Type.Type;
import IR.Type.VoidType;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class BrInst extends Instruction{

    private int type;
    private BasicBlock TrueBlock;
    private BasicBlock FalseBlock;
    private BasicBlock JumpBlock;

    public BrInst(BasicBlock jumpBb, BasicBlock bb) {
        super("", VoidType.voidType, OP.Br, bb);
        this.JumpBlock = jumpBb;
        this.type = 1;
    }

    public BrInst(Value value, BasicBlock trueBlock, BasicBlock falseBlock, BasicBlock bb){
        super("", VoidType.voidType, OP.Br, bb);
        addOperand(value);
        this.TrueBlock = trueBlock;
        this.FalseBlock = falseBlock;
        this.type = 2;
    }

    //  将br指令转换为jump指令
    public void turnToJump(BasicBlock jumpBlock){
        this.type = 1;
        this.JumpBlock = jumpBlock;
        this.TrueBlock = null;
        this.FalseBlock = null;
        this.removeUseFromOperands();
    }

    public Value getJudVal(){
        return getOperand(0);
    }

    public BasicBlock getTrueBlock(){
        return TrueBlock;
    }

    public BasicBlock getFalseBlock(){
        return FalseBlock;
    }

    public BasicBlock getJumpBlock(){
        return JumpBlock;
    }

    public void setJumpBlock(BasicBlock jumpBlock){
        this.JumpBlock = jumpBlock;
    }

    public void setTrueBlock(BasicBlock trueBlock){
        this.TrueBlock = trueBlock;
    }

    public void setFalseBlock(BasicBlock falseBlock){
        this.FalseBlock = falseBlock;
    }

    public boolean isJump(){
        return type == 1;
    }

    @Override
    public boolean hasName(){
        return false;
    }

    @Override
    public String getInstString(){
        StringBuilder sb = new StringBuilder();
        if(type == 2) {
            sb.append("br ");
            sb.append(getJudVal()).append(", ");
            sb.append("label %").append(getTrueBlock().getName()).append(", ");
            sb.append("label %").append(getFalseBlock().getName());
        }
        //  直接跳转
        else {
            sb.append("br label %");
            sb.append(getJumpBlock().getName());
        }
        return sb.toString();
    }
    @Override
    public String getInstString1(){
        StringBuilder sb = new StringBuilder();
        if(type == 2) {
            sb.append("br ");
            if(getJudVal().reg!=null)
            sb.append(getJudVal().reg.toString()).append(", ");
            else sb.append(getJudVal()).append(", ");
            sb.append("label %").append(getTrueBlock().getName()).append(", ");
            sb.append("label %").append(getFalseBlock().getName());
        }
        //  直接跳转
        else {
            sb.append("br label ");
            sb.append(getJumpBlock());
        }
        return sb.toString();
    }
}
