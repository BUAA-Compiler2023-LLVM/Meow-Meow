package IR.Value.Instructions;

import IR.Type.PointerType;
import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class AllocInst extends Instruction{

    public AllocInst(Type type) {
        super("%" + (++Value.valNumber), type, OP.Alloca);
    }

    public Type getAllocType(){
        return ((PointerType) getType()).getEleType();
    }

    @Override
    public String getInstString(){
        Type EleType = ((PointerType) getType()).getEleType();
        return getName() + " = " + "alloca " + EleType.toString();
    }
    @Override
    public String getInstString1(){
        Type EleType = ((PointerType) getType()).getEleType();
        if(reg!=null)
        return reg.toString() + " = " + "alloca " + EleType.toString();
         return getName() + " = " + "alloca " + EleType.toString();
    }
}
