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
	 根据一个节点查询与之相关的节点组
	 **/
	private HashMap<ObjOperand, HashSet<ObjOperand>> adjList;
	/**
	 * 边的集合
	 */
	private HashSet<Pair<ObjOperand, ObjOperand>> adjSet;
	/**
	 * 当一条传送指令 (u,v) 被合并，且 v 已经被放入 coalescedNodes 中，alias(v) = u
	 */
	private HashMap<ObjOperand, ObjOperand> alias;
	/**
	 * 从一个节点到与该节点相关的 mov 指令之间的映射
	 */
	private HashMap<ObjOperand, HashSet<ObjMove>> moveList;
	private HashSet<ObjOperand> simplifyWorklist;
	/**
	 * 低度数的，传送有关的节点表
	 */
	private HashSet<ObjOperand> freezeWorklist;
	/**
	 * 高度数的节点表
	 */
	private HashSet<ObjOperand> spillWorklist;
	/**
	 * 本轮中要被溢出的节点的集合
	 */
	private HashSet<ObjOperand> spilledNodes;
	/**
	 * 已合并的节点的集合，比如将 u 合并到 v，那么将 u 加入这里，然后 v 加入其他集合
	 */
	private HashSet<ObjOperand> coalescedNodes;
	/**
	 * 包含删除的点
	 */
	private Stack<ObjOperand> selectStack;
	/**
	 * 有可能合并的传送指令集合
	 */
	private HashSet<ObjMove> worklistMoves;
	/**
	 * 还未做好合并准备的传送指令集合
	 */
	private HashSet<ObjMove> activeMoves;
	/**
	 * 已经合并的传送指令集合
	 */
	private HashSet<ObjInstr> coalescedMoves;
	/**
	 *源操作数和目标操作数冲突的传送指令集合
	 */
	private HashSet<ObjMove> constrainedMoves;
	/**
	 * 不考虑合并的传送指令集合
	 */
	private HashSet<ObjMove> frozenMoves;
	/**
	 * 节点的度
	 */
	private HashMap<ObjOperand, Integer> degree;
	/**
	 * 新的虚拟寄存器，用来处理溢出解决时引入的新的虚拟寄存器
	 */
	ObjVirReg vReg = null;
	/**
	 * 存储操作数和所在的基本块对应的循环深度
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
