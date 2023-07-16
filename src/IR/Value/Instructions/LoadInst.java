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
        try{
            Type type = ((PointerType) pointer.getType()).getEleType();
            return getName() + " = " + "load " + type + ", "
                    + pointer.getType() + " " + pointer.getName();
        }
       catch (Exception e )
       {
           return getName() + " = " + "load " + ", "
                   + pointer.getType() + " " + pointer.getName();
       }
    }
    @Override
    public String getInstString1(){
        Type type = ((PointerType) pointer.getType()).getEleType();
        String a1,a2;
        if(reg!=null) a1=reg.toString();else a1= getName();
        if(pointer.reg!=null) a2=pointer.reg.toString();else a2= pointer.getName();
        return a1 + " = " + "load " + type + ", "
                + pointer.getType() + " " +a2;
    }
}
