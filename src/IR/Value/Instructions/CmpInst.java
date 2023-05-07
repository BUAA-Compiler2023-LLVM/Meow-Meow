package IR.Value.Instructions;

import IR.Type.IntegerType;
import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class CmpInst extends BinaryInst{

    public CmpInst(OP op, Value left, Value right, BasicBlock basicBlock) {
        super(op, left, right, IntegerType.I1, basicBlock);
    }
}
