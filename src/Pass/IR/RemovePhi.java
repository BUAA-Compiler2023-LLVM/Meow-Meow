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
						//�����������phi %x=phi [%x1,%b1], [%x2,%b2]
						//��ת��Ϊǰ�̻���������%x=%x1,%x=%x2��Ȼ��ɾ�����phi
						Value new1 = new Value(i.getValue().getName(), IntegerType.I32);
						for (int ii = 0; ii < i.getValue().getOperands().size(); ii++) {
							Value val = i.getValue().getOperands().get(ii);//%x1
							BasicBlock src = curbb.getPreBlocks().get(ii);//%b1
							if (src.getNxtBlocks().size() > 1) {//���b1 �ж�����
								BasicBlock tmp= null;//��һ���Ƿ���removephi�������Ѿ���curbb��b1�м���ӹ�������
								for (BasicBlock bb : src.getNxtBlocks())
								{
									if(curbb.getPreBlocks().contains(bb) && bb.meow)
									{
										tmp=bb;
									}
								}
								if(tmp!=null)//��Ȼb1�ж����̵��ǲ���Ҫ�½�������
								{
									Move mv=new Move(val, new1, src);
									mv.getNode().insertBefore(tmp.getLastInst().getNode());
								}else
								{
									BasicBlock new2 = new BasicBlock(function);
									new2.meow=true;
									//����һ��bb�ı�־λ��true���������־λ��Ϊ��removephi������
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
									//��b1ĩβ��br����Ŀ�ĵظĳ��½��Ļ�����
								}

							} else {
								Move mv=new Move(val, new1, src);
								mv.getNode().insertBefore(src.getLastInst().getNode());
							}
						}

					}
				}
				ArrayList<Instruction> toboRemoved=new ArrayList<>();
				//ɾ������phi
				for (IList.INode<Instruction, BasicBlock> i : curbb.getInsts())
					if ( i.getValue() instanceof Phi)
					{
						toboRemoved.add(i.getValue());
					}
				for(Instruction deleteInst : toboRemoved){
					deleteInst.removeSelf();
				}
			}
		}


	}


}
