package IR.Value.Instructions;

import IR.Type.PointerType;
import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class LoadInst extends Instruction{
    Value pointer;

    public LoadInst(Value pointer, Type type, BasicBlock basicBlock) {
        super("%" + (++Value.valNumber), type, OP.Load, basicBlock);
        this.addOperand(pointer);
        this.pointer = pointer;
    }

    public Value getPointer(){
        return pointer;
    }

    @Override
    public String getInstString(){
        return getName() + " = " + "load " + pointer.getType() + " " + pointer.getName();
    }
}
