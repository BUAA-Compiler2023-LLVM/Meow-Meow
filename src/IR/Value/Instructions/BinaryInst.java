package IR.Value.Instructions;

import IR.Type.IntegerType;
import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.ConstFloat;
import IR.Value.ConstInteger;
import IR.Value.Value;

public class BinaryInst extends Instruction {

    public BinaryInst(OP op, Value left, Value right, Type type) {
        super("%" + (++Value.valNumber), type, op);
        this.addOperand(left);
        this.addOperand(right);
    }

    public Value getLeftVal(){
        return getOperand(0);
    }

    public Value getRightVal(){
        return getOperand(1);
    }

    public boolean hasOneConst(){
        boolean isLeftConst = (getOperand(0) instanceof ConstInteger)
                || (getOperand(0) instanceof ConstFloat);
        boolean isRightConst = (getOperand(1) instanceof ConstInteger)
                || (getOperand(1) instanceof ConstFloat);
        if(isLeftConst && isRightConst) return false;
        return isLeftConst || isRightConst;
    }

    @Override
    public String getInstString(){
        String type_str;
        Type valueTy = getLeftVal().getType();
        if(valueTy == IntegerType.I32){
            type_str = "i32";
        }
        else if(valueTy == IntegerType.I1){
            type_str = "i1";
        }
        else type_str = "float";
        return getName() + " = " +
                getOp() + " " + type_str + " " +
                getLeftVal().getName() + ", " +
                getRightVal().getName();
    }
    @Override
    public String getInstString1(){
        String type_str;
        Type valueTy = getLeftVal().getType();
        if(valueTy == IntegerType.I32){
            type_str = "i32";
        }
        else if(valueTy == IntegerType.I1){
            type_str = "i1";
        }
        else type_str = "float";
        String a1,a2,a3;
        if(reg!=null) a1=reg.toString();else a1=getName();
        if(getLeftVal().reg!=null) a2=getLeftVal().reg.toString();else a2=getLeftVal().getName();
        if(getRightVal().reg!=null) a3=getRightVal().reg.toString();else a3=getRightVal().getName();
        return a1 + " = " +
                getOp() + " " + type_str + " " +
                a2+ ", " +
                a3;
    }
}
