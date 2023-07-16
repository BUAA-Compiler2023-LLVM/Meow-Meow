package IR.Value.Instructions;

import IR.Type.PointerType;
import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class LoadInst extends Instruction{

    public LoadInst(Value pointer, Type type, BasicBlock basicBlock) {
        super("%" + (++Value.valNumber), type, OP.Load, basicBlock);
        this.addOperand(pointer);
    }

    public Value getPointer(){
        return getOperand(0);
    }

    @Override
    public String getInstString(){
        Value pointer = getPointer();
        Type type = ((PointerType) pointer.getType()).getEleType();
        return getName() + " = " + "load " + type + ", "
                + pointer.getType() + " " + pointer.getName();
    }
}
