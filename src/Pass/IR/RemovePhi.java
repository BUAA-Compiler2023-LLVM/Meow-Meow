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
						Value new1 = new Value("%" + (++Value.valNumber), IntegerType.I32);
						i.getValue().setName(new1.getName());
						for (int ii = 0; ii < i.getValue().getOperands().size(); ii++) {
							Value val = i.getValue().getOperands().get(ii);
							BasicBlock src = curbb.getPreBlocks().get(ii);
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
									Move mv=new Move(val, new1, src);
									mv.getNode().insertBefore(tmp.getLastInst().getNode());
								}else
								{
									BasicBlock new2 = new BasicBlock(function);
									new2.meow=true;
									//这是一个bb的标志位，true代表这个标志位是为了removephi而生的
									new2.addInst(new Move(val, new1, new2));
									new2.addInst(new BrInst(curbb, new2));
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

								Move mv=new Move(val, new1, src);

								mv.getNode().insertBefore(src.getLastInst().getNode());


							}
						}

					}
				}
				//删除所有phi
				for (IList.INode<Instruction, BasicBlock> i : curbb.getInsts())
					if (i.getPrev()!=null && i.getPrev().getValue() instanceof Phi)//因为不能删除自己，所以打赌phi不会是最后一句
					{
						i.getPrev().removeFromList();
					}

			}
		}


	}


}
