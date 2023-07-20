package Pass.IR;

import IR.IRModule;
import IR.Type.IntegerType;
import IR.Type.Type;
import IR.Value.*;
import IR.Value.Instructions.*;
import Pass.IR.Utils.DomAnalysis;
import Pass.Pass;
import Utils.DataStruct.IList;
import Utils.DataStruct.Pair;

import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

public class RemovePhi implements Pass.IRPass {
	@Override
	public String getName() {
		return "RemovePhi";
	}

	@Override
	public void run(IRModule module)  {
		for (Function function : module.getFunctions()) {
			for (IList.INode<BasicBlock, Function> b : function.getBbs()) {
				BasicBlock curbb = b.getValue();
				for (IList.INode<Instruction, BasicBlock> i : curbb.getInsts()) {
					if (i.getValue() instanceof Phi) {

						ArrayList<Move> pairlist=new ArrayList<>();
						//new1：前面的基本块中的这个phi的变量的别名
						for (int ii = 0; ii < i.getValue().getOperands().size(); ii++) {
							Value val = i.getValue().getOperand(ii);//%x1
							BasicBlock src = curbb.getPreBlocks().get(ii);//%b1
							Move mv=new Move(val,IntegerType.I32);//目标：new1=val1 new1=val2
							pairlist.add(mv);
							if (src.getNxtBlocks().size() > 1) {
								BasicBlock tmp= null;
								for (BasicBlock bb : src.getNxtBlocks())
								{
									if(curbb.getPreBlocks().contains(bb) && bb.meow)
									{
										tmp=bb;
									}
								}
								if(tmp!=null)
								{

									mv.getNode().insertBefore(tmp.getLastInst().getNode());
								}else
								{
									BasicBlock new2 = new BasicBlock(function);
									new2.meow=true;
									new2.addInst(mv);
									new2.addInst(new BrInst(curbb));
									new2.insertAfter(src);
									src.setNxtBlock(new2);
									new2.setPreBlock(src);
									new2.setNxtBlock(curbb);
									curbb.setPreBlock(new2);
									assert src.getLastInst() instanceof BrInst;
									BrInst last=(BrInst) src.getLastInst();
									if(last.getJumpBlock()!=null && last.getJumpBlock().equals(curbb))
									{
										last.setJumpBlock(new2);
									}
									if(last.getFalseBlock()!=null && last.getFalseBlock().equals(curbb))
									{
										last.setFalseBlock(new2);
									}
									if(last.getTrueBlock()!=null && last.getTrueBlock().equals(curbb))
									{
										last.setTrueBlock(new2);
									}
								}

							} else {

								mv.getNode().insertBefore(src.getLastInst().getNode());
							}

						}
						Move.setpair(pairlist.get(0),pairlist.get(1));
						Move x = new Move(pairlist.get(0),IntegerType.I32);
						x.getNode().insertBefore(i);
						i.getValue().replaceUsedWith(x);
					}
				}

				ArrayList<Instruction> tobeRemoved=new ArrayList<>();
				//删除所有phi
				for (IList.INode<Instruction, BasicBlock> i : curbb.getInsts())
					if ( i.getValue() instanceof Phi)
					{
						tobeRemoved.add(i.getValue());
					}
				for(Instruction deleteInst : tobeRemoved){
					deleteInst.getNode().removeFromList();
				}

			}
		}


	}


}