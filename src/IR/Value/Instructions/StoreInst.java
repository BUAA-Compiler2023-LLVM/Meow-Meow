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
        super("%" + (++Value.valNumber), new VoidType(), OP.Store, basicBlock);
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
        return "store " + value + ", " + pointer.getName();
    }
}
