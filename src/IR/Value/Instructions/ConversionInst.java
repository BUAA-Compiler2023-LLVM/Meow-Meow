package IR.Value.Instructions;

import IR.Type.IntegerType;
import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class ConversionInst extends Instruction{

    public ConversionInst(Value value, Type type, OP op, BasicBlock basicBlock) {
        super("%" + (++Value.valNumber), type, op, basicBlock);
        addOperand(value);
    }

    public Value getValue(){
        return getOperand(0);
    }

    @Override
    public String getInstString(){
        String to = null;
        if(getOp() == OP.Ftoi){
            to = "to i32";
        }
        else if(getOp() == OP.Itof){
            to = "to float";
        }
        else if(getOp() == OP.Zext){
            to = "to i32";
        }
        else if(getOp() == OP.BitCast){
            to = "to i32*";
        }
        return getName() + " = " + getOp() + " " +
                getValue() + " " + to;
    }
    @Override
    public String getInstString1(){
        String to = null;
        if(getOp() == OP.Ftoi){
            to = "to i32";
        }
        else if(getOp() == OP.Itof){
            to = "to float";
        }
        else if(getOp() == OP.Zext){
            to = "to i32";
        }
        String a1,a2;
        if(reg!=null) a1=reg.toString();else a1= getName();
        if(getValue().reg!=null) a2=getValue().reg.toString();else a2= getValue().getName();
        return a1+ " = " + getOp() + " " +
                a2 + " " + to;
    }
}
