package IR.Value.Instructions;

import IR.Type.Type;
import IR.Type.VoidType;
import IR.Value.BasicBlock;
import IR.Value.Value;

public class Move extends Instruction{
	public boolean hasname=true;
	public Move pair=null;
	public static void setpair(Move x, Move y)
	{
		x.pair=y;
		y.pair=x;
	}

	public Move(Value src ,Type type) {
		super("%" + (++Value.valNumber), type, OP.Move);
//		super(dest.getName(), type, OP.Move);
		addOperand(src);
	}
	@Override
	public boolean hasName(){
		return hasname;
	}



	@Override
	public String getInstString() {
		return getName()+" = move " + getOperand(0).getName();
	}
	@Override
	public String getInstString1() {
		return getName()+" = move " + getOperand(0).getName();
	}
}