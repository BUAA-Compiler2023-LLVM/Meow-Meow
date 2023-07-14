package IR.Value.Instructions;

import IR.Type.PointerType;
import IR.Type.Type;
import IR.Type.VoidType;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class StoreInst extends Instruction{

    public StoreInst(Value value, Value pointer,BasicBlock basicBlock) {
        super("%" + (++Value.valNumber), VoidType.voidType, OP.Store, basicBlock);
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
}
