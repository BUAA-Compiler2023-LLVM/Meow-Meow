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
        return getName() + " = " + getOp() + " " +
                getValue().getName() + " " + to;
    }
}
