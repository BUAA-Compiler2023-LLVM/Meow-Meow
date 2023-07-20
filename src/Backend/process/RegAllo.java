package Backend.process;

import Backend.component.ObjBlock;
import Backend.component.ObjFunction;
import Backend.component.ObjModule;
import Backend.instruction.ObjInstr;
import Backend.instruction.ObjMove;
import Backend.operand.ObjOperand;
import Backend.operand.ObjPhyReg;
import Backend.operand.ObjReg;
import Backend.operand.ObjVirReg;
import IR.Value.BasicBlock;
import IR.Value.Const;
import IR.Value.Function;
import IR.Value.Instructions.Instruction;
import IR.Value.Value;
import Utils.DataStruct.IList;
import Utils.DataStruct.Pair;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Stack;

public class RegAllo{
	private final ObjModule objModule;

	private final int K = 32;
	public HashMap< ObjOperand,Value> operandMap1;


	/**
	 ����һ���ڵ��ѯ��֮��صĽڵ���
	 **/
	private HashMap<ObjOperand, HashSet<ObjOperand>> adjList;
	/**
	 * �ߵļ���
	 */
	private HashSet<Pair<ObjOperand, ObjOperand>> adjSet;
	/**
	 * ��һ������ָ�� (u,v) ���ϲ����� v �Ѿ������� coalescedNodes �У�alias(v) = u
	 */
	private HashMap<ObjOperand, ObjOperand> alias;
	/**
	 * ��һ���ڵ㵽��ýڵ���ص� mov ָ��֮���ӳ��
	 */
	private HashMap<ObjOperand, HashSet<ObjMove>> moveList;
	private HashSet<ObjOperand> simplifyWorklist;
	/**
	 * �Ͷ����ģ������йصĽڵ��
	 */
	private HashSet<ObjOperand> freezeWorklist;
	/**
	 * �߶����Ľڵ��
	 */
	private HashSet<ObjOperand> spillWorklist;
	/**
	 * ������Ҫ������Ľڵ�ļ���
	 */
	private HashSet<ObjOperand> spilledNodes;
	/**
	 * �Ѻϲ��Ľڵ�ļ��ϣ����罫 u �ϲ��� v����ô�� u �������Ȼ�� v ������������
	 */
	private HashSet<ObjOperand> coalescedNodes;
	/**
	 * ����ɾ���ĵ�
	 */
	private Stack<ObjOperand> selectStack;
	/**
	 * �п��ܺϲ��Ĵ���ָ���
	 */
	private HashSet<ObjMove> worklistMoves;
	/**
	 * ��δ���úϲ�׼���Ĵ���ָ���
	 */
	private HashSet<ObjMove> activeMoves;
	/**
	 * �Ѿ��ϲ��Ĵ���ָ���
	 */
	private HashSet<ObjInstr> coalescedMoves;
	/**
	 *Դ��������Ŀ���������ͻ�Ĵ���ָ���
	 */
	private HashSet<ObjMove> constrainedMoves;
	/**
	 * �����Ǻϲ��Ĵ���ָ���
	 */
	private HashSet<ObjMove> frozenMoves;
	/**
	 * �ڵ�Ķ�
	 */
	private HashMap<ObjOperand, Integer> degree;
	/**
	 * �µ�����Ĵ�������������������ʱ������µ�����Ĵ���
	 */
	ObjVirReg vReg = null;
	/**
	 * �洢�����������ڵĻ������Ӧ��ѭ�����
	 */
	HashMap<ObjOperand, Integer> loopDepths = new HashMap<>();


	public RegAllo(ObjModule objModule)
	{
		this.objModule = objModule;
	}
	private void GetDefUse() {
		for(ObjFunction func : objModule.getFunctions())
			for(IList.INode<ObjBlock,ObjFunction> bb : func.getObjBlocks()) {
				bb.getValue().Use.clear();
				bb.getValue().Def.clear();
				bb.getValue().liveIns.clear();
				bb.getValue().liveOuts.clear();
				bb.getValue().LocalInterfere.clear();
				for (IList.INode<ObjInstr, ObjBlock> inst : bb.getValue().getInstrs()) {
//					System.out.println(inst.getValue());
//					System.out.print("IRUSE:\t[");
//					for(ObjReg r : inst.getValue().regUse)
//					{
//						System.out.print(operandMap1.get(r)+" ");
//					}
//					System.out.println("] ");
//					System.out.print("USE:\t");
//					System.out.println(inst.getValue().regUse);
//					System.out.print("IRDEF:\t[");
//					for(ObjReg r : inst.getValue().regDef)
//					{
//						System.out.print(operandMap1.get(r)+" ");
//					}
//					System.out.println("] ");
//					System.out.print("DEF:\t");
//					System.out.println(inst.getValue().regDef);
					for(ObjReg r : inst.getValue().regUse)
					{
						if(!bb.getValue().Use.contains(r))
						{
							bb.getValue().Use.add(r);
						}
					}
					for(ObjReg r : inst.getValue().regDef)
					{
						if(!bb.getValue().Use.contains(r) && !bb.getValue().Def.contains(r))
						{
							bb.getValue().Def.add(r);
						}
					}

			}
		}
	}

	private void LivenessAnalysis()
	{
		GetDefUse();
	}
	public void process()
	{
		LivenessAnalysis();
//		for(ObjFunction func : objModule.getFunctions())
//		{
//			for(IList.INode<ObjBlock,ObjFunction> ob : func.getObjBlocks())
//			{
//
//			}
//		}
	}

}
