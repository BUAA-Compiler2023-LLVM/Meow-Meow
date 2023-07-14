package IR.Value.Instructions;

import IR.Type.Type;
import IR.Type.VoidType;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class BrInst extends Instruction{

    private final int type;
    private Value judVal;
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
        this.TrueBlock = trueBlock;
        this.FalseBlock = falseBlock;
        this.judVal = value;
        this.type = 2;
    }

    public Value getJudVal(){
        return judVal;
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
}
