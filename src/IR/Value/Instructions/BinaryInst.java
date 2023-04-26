package IR.Value.Instructions;

import IR.Type.IntegerType;
import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class BinaryInst extends Instruction {

    public BinaryInst(OP op, Value left, Value right, Type type, BasicBlock basicBlock) {
        super("%" + (++Value.valNumber), type, op, basicBlock);
        this.addOperand(left);
        this.addOperand(right);
    }

    public Value getLeftVal(){
        return getOperand(0);
    }

    public Value getRightVal(){
        return getOperand(1);
    }

    @Override
    public String getInstString(){
        return getName() + " = " +
                getOp() + " " +
                getLeftVal().getName() + " " +
                getRightVal().getName();
    }
}
