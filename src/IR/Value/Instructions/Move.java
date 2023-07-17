package IR.Value.Instructions;

import IR.Type.Type;
import IR.Type.VoidType;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class Move extends Instruction{
	public Move(Value src,Value dst, BasicBlock basicBlock) {
		super("", VoidType.voidType, OP.Move, basicBlock);
		addOperand(src);
		addOperand(dst);
	}

	@Override
	public boolean hasName() {
		return false;
	}

	@Override
	public String getInstString() {
		return "move " + getOperands().get(0).getName()+" --> "+getOperands().get(1).getName();
	}
	@Override
	public String getInstString1() {
		return "move " + getOperands().get(0).getName()+" --> "+getOperands().get(1).getName();
	}
}
