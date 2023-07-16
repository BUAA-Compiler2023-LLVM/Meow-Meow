package IR.Value.Instructions;

import IR.Type.PointerType;
import IR.Type.Type;
import IR.Type.VoidType;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class StoreInst extends Instruction{

    private final Value value;
    private final Value pointer;

    public StoreInst(Value value, Value pointer,BasicBlock basicBlock) {
        super("%" + (++Value.valNumber), VoidType.voidType, OP.Store, basicBlock);
        this.addOperand(value);
        this.addOperand(pointer);
        this.value = value;
        this.pointer = pointer;
    }

    public Value getValue(){
        return value;
    }

    public Value getPointer(){
        return pointer;
    }

    @Override
    public boolean hasName(){
        return false;
    }

    @Override
    public String getInstString(){
        return "store " + value + ", " + pointer;
    }
    @Override
    public String getInstString1(){

        String a1,a2;
        if(value.reg!=null) a1=value.reg.toString();else a1= value.getName();
        if(pointer.reg!=null) a2=pointer.reg.toString();else a2= pointer.getName();
        return "store " + a1+ ", " +a2;
    }
}
