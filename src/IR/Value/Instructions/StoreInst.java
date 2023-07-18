package IR.Value.Instructions;

import IR.Type.VoidType;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class StoreInst extends Instruction{

    public StoreInst(Value value, Value pointer) {
        super("", VoidType.voidType, OP.Store);
        this.addOperand(value);
        this.addOperand(pointer);
    }

    public Value getValue(){
        return getOperand(0);
    }

    public Value getPointer(){
        return getOperand(1);
    }

    @Override
    public boolean hasName(){
        return false;
    }

    @Override
    public String getInstString(){
        return "store " + getValue() + ", " + getPointer();
    }
    @Override
    public String getInstString1(){

        String a1,a2;
        if(getValue().reg!=null) a1=getValue().reg.toString();else a1= getValue().getName();
        if(getPointer().reg!=null) a2=getPointer().reg.toString();else a2= getPointer().getName();
        return "store " + a1+ ", " +a2;
    }
}
