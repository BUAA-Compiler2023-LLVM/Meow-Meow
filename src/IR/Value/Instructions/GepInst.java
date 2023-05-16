package IR.Value.Instructions;

import IR.Type.Type;
import IR.Value.BasicBlock;

public class GepInst extends Instruction{
    public GepInst(String name, Type type, BasicBlock basicBlock) {
        super(name, type, OP.GEP, basicBlock);
    }


}
