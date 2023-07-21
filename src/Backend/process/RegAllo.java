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

public class RegAllo {
	private final ObjModule objModule;

	private final int K = 32;

	private HashSet<ObjOperand> initials = new HashSet<>();
	/**
	 * 根据一个节点查询与之相关的节点组
	 **/
	private HashMap<ObjOperand, HashSet<ObjOperand>> adjList = new HashMap<>();
	/**
	 * 边的集合
	 */
	private HashSet<Pair<ObjOperand, ObjOperand>> adjSet = new HashSet<>();
	/**
	 * 当一条传送指令 (u,v) 被合并，且 v 已经被放入 coalescedNodes 中，alias(v) = u
	 */
	private HashMap<ObjOperand, ObjOperand> alias;
	/**
	 * 从一个节点到与该节点相关的 mov 指令之间的映射
	 */
	private HashMap<ObjOperand, HashSet<ObjMove>> moveList = new HashMap<>();
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
	private HashSet<ObjMove> worklistMoves = new HashSet<>();
	/**
	 * 还未做好合并准备的传送指令集合
	 */
	private HashSet<ObjMove> activeMoves;
	/**
	 * 已经合并的传送指令集合
	 */
	private HashSet<ObjInstr> coalescedMoves;
	/**
	 * 源操作数和目标操作数冲突的传送指令集合
	 */
	private HashSet<ObjMove> constrainedMoves;
	/**
	 * 不考虑合并的传送指令集合
	 */
	private HashSet<ObjMove> frozenMoves;
	/**
	 * 节点的度
	 */
	private HashMap<ObjOperand, Integer> degree = new HashMap<>();
	/**
	 * 新的虚拟寄存器，用来处理溢出解决时引入的新的虚拟寄存器
	 */
	ObjVirReg vReg = null;
	/**
	 * 存储操作数和所在的基本块对应的循环深度
	 */
	HashMap<ObjOperand, Integer> loopDepths = new HashMap<>();


	public RegAllo(ObjModule objModule) {
		this.objModule = objModule;
	}

	private void GetDefUse() {
		for (ObjFunction func : objModule.getFunctions())
			for (IList.INode<ObjBlock, ObjFunction> bb : func.getObjBlocks()) {
				bb.getValue().Use.clear();
				bb.getValue().Def.clear();
				bb.getValue().liveIns.clear();
				bb.getValue().liveOuts.clear();
				bb.getValue().LocalInterfere.clear();
				for (IList.INode<ObjInstr, ObjBlock> inst : bb.getValue().getInstrs()) {
					for (ObjReg r : inst.getValue().regUse) {
						if (!r.isPrecolored()) {
							initials.add(r);
							loopDepths.put(r, 0);
							degree.put(r, 0);
							adjList.put(r, new HashSet<>());
							moveList.put(r, new HashSet<>());
						}

						if (!bb.getValue().Use.contains(r)) {
							bb.getValue().Use.add(r);
						}
					}
					for (ObjReg r : inst.getValue().regDef) {
						if (!r.isPrecolored()) {
							initials.add(r);
							loopDepths.put(r, 0);
							degree.put(r, 0);
							adjList.put(r, new HashSet<>());
							moveList.put(r, new HashSet<>());
						}
						if (!bb.getValue().Use.contains(r) && !bb.getValue().Def.contains(r)) {
							bb.getValue().Def.add(r);
						}
					}

				}
			}
	}

	private int GetInOut(ObjBlock bb) {

		//changed return 1
		ArrayList<ObjReg> InBackup = new ArrayList<>(bb.liveIns);
		bb.liveOuts.clear();
		for (ObjBlock bbb : bb.getNxtBlocks()) {
			for (ObjReg v : bbb.liveIns) {
				if (!bb.liveOuts.contains(v)) {
					bb.liveOuts.add(v);
				}
			}
		}
		bb.liveIns.clear();
		bb.liveIns.addAll(bb.Use);
		for (ObjReg v : bb.liveOuts) {
			if (!bb.liveIns.contains(v))
				bb.liveIns.add(v);
		}
		bb.liveIns.removeIf(bb.Def::contains);
		if (InBackup.equals(bb.liveIns)) {
			return 0;
		} else return 1;
	}

	private ArrayList<ObjBlock> hasbeendfs = new ArrayList<>();

	private int dfs(ObjBlock bb) {
		//changed return 1
		if (hasbeendfs.contains(bb)) {
			return 0;
		}
		hasbeendfs.add(bb);
		int changed = GetInOut(bb);
		for (ObjBlock bbb : bb.getPreBlocks()) {
			if (dfs(bbb) == 1)
				changed = 1;
		}
		return changed;
	}

	private void DSFGetBBInOut() {
		for (ObjFunction func : objModule.getFunctions()) {
			ObjBlock tail = func.getBbExit();
			int changed = 1;
			while (changed == 1) {
				hasbeendfs.clear();
				changed = dfs(tail);
			}
		}

	}

	private void GetInstInOut() {
		for (ObjFunction func : objModule.getFunctions()) {
			for (IList.INode<ObjBlock, ObjFunction> bb : func.getObjBlocks()) {
				IList.INode<ObjInstr, ObjBlock> tmpinst = bb.getValue().getInstrs().getTail();
				ArrayList<ObjReg> tmpout = bb.getValue().liveOuts;
				while (tmpinst != null) {
					if (tmpinst.getValue() instanceof ObjMove) {
						worklistMoves.add((ObjMove) tmpinst.getValue());
						for (ObjReg o : tmpinst.getValue().regDef) {
							if (!moveList.containsKey(o)) moveList.put(o, new HashSet<>());
							moveList.get(o).add((ObjMove) tmpinst.getValue());
						}
						for (ObjReg o : tmpinst.getValue().regUse) {
							if (!moveList.containsKey(o)) moveList.put(o, new HashSet<>());
							moveList.get(o).add((ObjMove) tmpinst.getValue());
						}
					}
					if (tmpinst.getPrev() == null) break;
					ArrayList<ObjReg> tmpin = new ArrayList<>();
					ObjInstr ins = tmpinst.getValue();
					tmpin.addAll(tmpout);
					tmpin.removeIf(ins.regDef::contains);
					tmpin.addAll(ins.regUse);
					bb.getValue().LocalInterfere.add(tmpin);
					tmpout = tmpin;
					tmpinst = tmpinst.getPrev();

				}
			}
		}

	}

	private void LivenessAnalysis() {
		GetDefUse();
		DSFGetBBInOut();
		GetInstInOut();
	}

	private void Build() {
		for (ObjFunction func : objModule.getFunctions()) {
			for (IList.INode<ObjBlock, ObjFunction> bb : func.getObjBlocks()) {
				ArrayList<ObjReg> ins = bb.getValue().liveIns;
				int len = ins.size();
				for (int i = 0; i < len; i++) {
					for (int j = i + 1; j < len; j++) {
						AddEdge(ins.get(i),ins.get(j));
					}
				}
				for (ArrayList<ObjReg> x : bb.getValue().LocalInterfere) {
					int len1 = x.size();
					for (int i = 0; i < len1; i++) {
						for (int j = i + 1; j < len; j++) {
							AddEdge(x.get(i), x.get(j));
						}
					}
				}
			}
		}
	}

	private void CalculateDegree() {
		for (ObjOperand o : initials) {
			degree.put(o, adjList.get(o).size());
		}
	}

	private void AddEdge(ObjOperand x, ObjOperand y) {
		if (!adjSet.contains(new Pair<>(x, y)) && !x.equals(y)) {
			adjSet.add(new Pair<>(x, y));
			adjSet.add(new Pair<>(y, x));
			if (!x.isPrecolored()) {
				adjList.putIfAbsent(x, new HashSet<>());
				adjList.get(x).add(y);
				degree.compute(x, (key, value) -> value == null ? 0 : value + 1);

			}
			if (!y.isPrecolored()) {
				adjList.putIfAbsent(y, new HashSet<>());
				adjList.get(y).add(x);
				degree.compute(y, (key, value) -> value == null ? 0 : value + 1);
			}
		}

	}

	private void MakeWorkList() {
		CalculateDegree();
		for (ObjOperand o : initials) {
			if (degree.get(o) >= K) {
				spillWorklist.add(o);
			} else if (moveList.get(o).size() != 0)//isMoveRelated
			{
				freezeWorklist.add(o);
			} else {
				simplifyWorklist.add(o);
			}
		}
	}

	public void process() {
		LivenessAnalysis();
		Build();
		MakeWorkList();
		while(!(simplifyWorklist.isEmpty() && worklistMoves.isEmpty() && freezeWorklist.isEmpty() && spillWorklist.isEmpty()))
		{
			if(!simplifyWorklist.isEmpty()) Simplify();
			else if (! worklistMoves.isEmpty()) Coalesce();
			else if (! freezeWorklist.isEmpty()) Freeze();
			else if (! spillWorklist.isEmpty()) SelectSpill();
		}
	}

	private void SelectSpill() {
	}

	private void Freeze() {
	}

	private void Coalesce() {
	}

	private void Simplify() {
	}


}
