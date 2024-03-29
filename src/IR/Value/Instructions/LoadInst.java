package IR.Value.Instructions;

import IR.Type.PointerType;
import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class LoadInst extends Instruction{

    public LoadInst(Value pointer, Type type) {
        super("%" + (++Value.valNumber), type, OP.Load);
        this.addOperand(pointer);
    }

    public Value getPointer(){
        return getOperand(0);
    }

    @Override
    public String getInstString(){
        Value pointer = getPointer();

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
        Value pointer = getPointer();
        Type type = ((PointerType) pointer.getType()).getEleType();
        String a1,a2;
        if(reg!=null) a1=reg.toString();else a1= getName();
        if(pointer.reg!=null) a2=pointer.reg.toString();else a2= pointer.getName();
        return a1 + " = " + "load " + type + ", "
                + pointer.getType() + " " +a2;
    }
}
