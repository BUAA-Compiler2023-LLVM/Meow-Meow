package IR.Value.Instructions;

import IR.Type.PointerType;
import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.Value;

import java.awt.*;

public class AllocInst extends Instruction{

    public AllocInst(Type type, BasicBlock basicBlock) {
        super("%" + (++Value.valNumber), type, OP.Alloca, basicBlock);
    }

    public Type getAllocType(){
        return ((PointerType) getType()).getEleType();
    }

    @Override
    public String getInstString(){
        Type EleType = ((PointerType) getType()).getEleType();
        return getName() + " = " + "alloca " + EleType.toString();
    }
}
