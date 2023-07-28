package Backend.process;

import Backend.component.ObjBlock;
import Backend.component.ObjFunction;
import Backend.component.ObjModule;
import Backend.instruction.*;
import Backend.operand.*;
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

import static Backend.operand.ObjPhyReg.AllRegs;
import static Backend.operand.ObjPhyReg.SP;

public class RegAllo {
	private final ObjModule objModule;

	private final int K = 19;
	//t0-t6 && s0-s11 一共19个能分配的
	private boolean printLiveVar=false;

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
	 * 从一个节点到与该节点相关的 mov 指令之间的映射
	 */
	private HashMap<ObjOperand, HashSet<ObjMove>> moveList = new HashMap<>();
	private HashSet<ObjOperand> simplifyWorklist = new HashSet<>();
	/**
	 * 低度数的，传送有关的节点表
	 */
	private HashSet<ObjOperand> freezeWorklist = new HashSet<>();
	/**
	 * 高度数的节点表
	 */
	private HashSet<ObjOperand> spillWorklist = new HashSet<>();
	/**
	 * 当一条传送指令 (u,v) 被合并，且 v 已经被放入 coalescedNodes 中，alias(v) = u
	 */
	private HashMap<ObjOperand, ObjOperand> alias = new HashMap<>();
	/**
	 * 本轮中要被溢出的节点的集合
	 */
	private HashSet<ObjOperand> spilledNodes = new HashSet<>();
	private HashSet<ObjOperand> coloredNodes = new HashSet<>();
	/**
	 * 已合并的节点的集合，比如将 u 合并到 v，那么将 u 加入这里，然后 v 加入其他集合
	 */
	private HashSet<ObjOperand> coalescedNodes = new HashSet<>();
	/**
	 * 包含删除的点
	 */
	private Stack<ObjOperand> selectStack = new Stack<>();
	/**
	 * 有可能合并的传送指令集合
	 */
	private HashSet<ObjMove> worklistMoves = new HashSet<>();
	/**
	 * 还未做好合并准备的传送指令集合
	 */
	private HashSet<ObjMove> activeMoves = new HashSet<>();
	/**
	 * 已经合并的传送指令集合
	 */
	private HashSet<ObjInstr> coalescedMoves = new HashSet<>();
	/**
	 * 源操作数和目标操作数冲突的传送指令集合
	 */
	private HashSet<ObjMove> constrainedMoves = new HashSet<>();
	/**
	 * 不考虑合并的传送指令集合
	 */
	private HashSet<ObjMove> frozenMoves = new HashSet<>();
	/**
	 * 节点的度
	 */
	private HashMap<ObjOperand, Integer> degree = new HashMap<>();
	private HashMap<ObjOperand, Integer> color = new HashMap<>();
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

	private void init() {
		initials = new HashSet<>();
		adjList = new HashMap<>();
		adjSet = new HashSet<>();
		moveList = new HashMap<>();
		simplifyWorklist = new HashSet<>();
		freezeWorklist = new HashSet<>();
		spillWorklist = new HashSet<>();
		spilledNodes = new HashSet<>();
		coloredNodes = new HashSet<>();
		coalescedNodes = new HashSet<>();
		selectStack = new Stack<>();
		worklistMoves = new HashSet<>();
		activeMoves = new HashSet<>();
		coalescedMoves = new HashSet<>();
		constrainedMoves = new HashSet<>();
		frozenMoves = new HashSet<>();
		degree = new HashMap<>();
		color = new HashMap<>();
		alias = new HashMap<>();
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
						if (r instanceof  ObjVirReg)
							//if (!r.isPrecolored())
						{
							initials.add(r);
							loopDepths.put(r, 0);
							degree.put(r, 0);
							adjList.put(r, new HashSet<>());
							moveList.put(r, new HashSet<>());
						}

						if (!bb.getValue().Use.contains(r) &&r instanceof  ObjVirReg) {//
							bb.getValue().Use.add(r);
						}
					}
					for (ObjReg r : inst.getValue().regDef) {
						if (r instanceof  ObjVirReg) {
							initials.add(r);
							loopDepths.put(r, 0);
							degree.put(r, 0);
							adjList.put(r, new HashSet<>());
							moveList.put(r, new HashSet<>());
						}
						if (!bb.getValue().Use.contains(r) && !bb.getValue().Def.contains(r) && r instanceof  ObjVirReg) {
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
						//只有双方都不是物理寄存器的，才放move里
						if (((ObjMove) tmpinst.getValue()).getDst() instanceof ObjVirReg && ((ObjMove) tmpinst.getValue()).getSrc()  instanceof ObjVirReg) {
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

					}
					if (tmpinst.getPrev() == null) break;
					ArrayList<ObjReg> tmpin = new ArrayList<>();
					ObjInstr ins = tmpinst.getValue();
					tmpin.addAll(tmpout);
					tmpin.removeIf(ins.regDef::contains);
					//tmpin.addAll(ins.regUse);
					for (ObjReg x : ins.regUse) {
						if (x instanceof  ObjVirReg)
							tmpin.add(x);
					}
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
						AddEdge(ins.get(i), ins.get(j));
					}
				}
				for (ArrayList<ObjReg> x : bb.getValue().LocalInterfere) {
					int len1 = x.size();
					for (int i = 0; i < len1; i++) {
						for (int j = i + 1; j < len1; j++) {
							AddEdge(x.get(i), x.get(j));
						}
					}
				}
			}
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
		for (ObjOperand o : initials) {
			if (degree.get(o) >= K) {
				//高度数节点，潜在溢出，先删了
				spillWorklist.add(o);
			} else if (MoveRelated(o)) {
				//低度数传送有关，等着被freeze
				freezeWorklist.add(o);
			} else {
				//低度数传送无关，等着被simplify
				simplifyWorklist.add(o);
			}
		}
	}

	private HashSet<ObjOperand> Adjacent(ObjOperand x) {
		//冲突图中的相邻的点

		HashSet<ObjOperand> ret = new HashSet<>(adjList.get(x));
		for (ObjOperand i : selectStack)
		//启发式图着色过程中暂时删掉的点的栈
		{
			ret.remove(i);
		}
		for (ObjOperand i : coalescedNodes)
		//已经合并的寄存器集合，如把u-<v合并到一体，就把v放入这里
		{
			ret.remove(i);
		}
		return ret;

	}

	private HashSet<ObjMove> NodeMoves(ObjOperand x) {
		HashSet<ObjMove> ret = new HashSet<>(moveList.get(x));
		ret.removeIf(i -> !activeMoves.contains(i) && !worklistMoves.contains(i));
		return ret;
	}

	private boolean MoveRelated(ObjOperand x) {
		return NodeMoves(x).size() != 0;
	}

	public void process() {
		init();
		LivenessAnalysis();
		if(printLiveVar)
		for (ObjFunction func : objModule.getFunctions()) {
			for (IList.INode<ObjBlock, ObjFunction> bb : func.getObjBlocks()) {
				bb.getValue().printBbDetail();
			}
		}
		Build();
		MakeWorkList();
		while (!(simplifyWorklist.isEmpty() && worklistMoves.isEmpty() && freezeWorklist.isEmpty() && spillWorklist.isEmpty())) {
			if (!simplifyWorklist.isEmpty()) Simplify();
			else if (!worklistMoves.isEmpty()) Coalesce();
			else if (!freezeWorklist.isEmpty()) Freeze();
			else if (!spillWorklist.isEmpty()) SelectSpill();
		}
		AssignColors();
		if (spilledNodes.size() != 0) {
			System.out.println("**REAL SPILL**");
			RewriteProgram();
			process();
		}
	}

	public void allocate() {
		for (HashMap.Entry<ObjOperand, Integer> entry : color.entrySet()) {
			ObjOperand key = entry.getKey();
			int val = entry.getValue();
			key.color = val;
			System.out.println(key + " -> "+ ObjPhyReg.indexToName.get(color.get(key)) );
		}
		for (ObjFunction func : objModule.getFunctions()) {

			for (IList.INode<ObjBlock, ObjFunction> bb : func.getObjBlocks()) {
				for (IList.INode<ObjInstr, ObjBlock> inst : bb.getValue().getInstrs()) {
					for (HashMap.Entry<ObjOperand, Integer> entry : color.entrySet()) {
						ObjOperand key = entry.getKey();
						int val = entry.getValue();
						key.color = val;
						inst.getValue().replaceReg(key, AllRegs.get(val));
					}
				}
			}
		}
		ArrayList<ObjInstr> toberemoved= new ArrayList<>();
		for (ObjFunction func : objModule.getFunctions()) {
			for (IList.INode<ObjBlock, ObjFunction> bb : func.getObjBlocks()) {
				for (IList.INode<ObjInstr, ObjBlock> inst : bb.getValue().getInstrs()) {
					if(inst.getValue() instanceof  ObjMove && ((ObjMove) inst.getValue()).getDst().equals(((ObjMove) inst.getValue()).getSrc()))
					{
						toberemoved.add(inst.getValue());
					}
				}
			}
		}
		for(ObjInstr i : toberemoved)
		{
			i.getNode().removeFromList();
		}
	}

	private void RewriteProgram() {
		for (ObjFunction func : objModule.getFunctions()) {
			int nowoffset = func.getStackSize();
			HashSet<ObjInstr> needrewrite = new HashSet<>();
			for (IList.INode<ObjBlock, ObjFunction> bb : func.getObjBlocks()) {
				for (IList.INode<ObjInstr, ObjBlock> inst : bb.getValue().getInstrs()) {
					ArrayList<ObjOperand> tmp = new ArrayList<>(inst.getValue().regUse);
					tmp.addAll(inst.getValue().regDef);
					for (ObjOperand x : tmp) {
						if (spilledNodes.contains(x)) {
							needrewrite.add(inst.getValue());
							if (x.spillPlace == -1) {
								System.out.println("SPILL "+x);
								x.spillPlace = nowoffset;
								nowoffset += 4;
								func.addAllocaSize(4);
								ObjInstr spplus= func.getFirstBlock().getInstrs().getHead().getValue();
								ObjInstr spplus1= func.getBbExit().getInstrs().getTail().getPrev().getValue();
								assert spplus instanceof ObjBinary;
								assert spplus1 instanceof ObjBinary;
								((ObjBinary)spplus).setSrc2(new ObjImm12(-nowoffset));
								((ObjBinary)spplus1).setSrc2(new ObjImm12(nowoffset));
							}
						}
					}


				}

			}
			for (ObjInstr i : needrewrite) {
				for (ObjOperand x : i.regUse) {
					if (spilledNodes.contains(x)) {
						ObjLoad lw = new ObjLoad(x, SP, new ObjImm12(x.spillPlace), "ld");
						lw.getNode().insertBefore(i.getNode());
					}
				}
				for (ObjOperand x : i.regDef) {
					if (i.regUse.contains(x)) continue;
					if (spilledNodes.contains(x)) {
						ObjStore sw = new ObjStore(x, SP, new ObjImm12(x.spillPlace), "sd");
						sw.getNode().insertAfter(i.getNode());
					}
				}

			}
		}

		initials.clear();
		initials.addAll(coloredNodes);
		initials.addAll(coalescedNodes);
		initials.addAll(spilledNodes);
		spilledNodes.clear();
		coloredNodes.clear();
		coalescedNodes.clear();
		color.clear();

	}

	private void AssignColors() {
		while (!selectStack.empty()) {
			ObjOperand n = selectStack.pop();
			HashSet<Integer> okColors = new HashSet<>();
			for (int i = 5; i <=9; i++) {
				okColors.add(i);
			}
			for (int i = 18; i <=31; i++) {
				okColors.add(i);
			}
			for (ObjOperand w : adjList.get(n)) {
				if (GetAlias(w).isPrecolored() || coloredNodes.contains(GetAlias(w))) {
					okColors.remove(color.get(GetAlias(w)));
				}

			}
			if (okColors.isEmpty()) {
				spilledNodes.add(n);
			} else {
				coloredNodes.add(n);
				int c = okColors.iterator().next();
				okColors.remove(c);
				color.put(n, c);
			}
		}
		for (ObjOperand n : coalescedNodes) {
			color.put(n, color.get(GetAlias(n)));
		}
	}

	private void SelectSpill() {
		ObjOperand m = spillWorklist.iterator().next();
		simplifyWorklist.add(m);
		FreezeMoves(m);
		spillWorklist.remove(m);
	}

	private void Freeze() {
		ObjOperand u = freezeWorklist.iterator().next();
		freezeWorklist.remove(u);
		simplifyWorklist.add(u);
		FreezeMoves(u);
	}

	private void FreezeMoves(ObjOperand u) {
		for (ObjMove m : NodeMoves(u)) {
			ObjOperand v;
			ObjOperand x = GetAlias(m.getSrc());
			ObjOperand y = GetAlias(m.getDst());//
			if (GetAlias(y).equals(GetAlias(u))) {
				v = GetAlias(x);
			} else {
				v = GetAlias(y);
			}
			activeMoves.remove(m);
			frozenMoves.add(m);
			if (NodeMoves(v).size() == 0 && degree.get(v) < K) {
				freezeWorklist.remove(v);
				simplifyWorklist.add(v);
			}

		}
	}

	private void Coalesce() {
		HashSet <ObjMove> toberemoved= new HashSet<>();
		for (ObjMove m : worklistMoves) {

			ObjOperand x = GetAlias(m.getSrc());
			ObjOperand y = GetAlias(m.getDst());//
			ObjOperand u, v;
			if (y.isPrecolored()) {
				u = y;
				v = x;
			} else {
				u = x;
				v = y;
			}
//			worklistMoves.remove(m);
			toberemoved.add(m);
			if (u.equals(v)) {
				coalescedMoves.add(m);
				AddWorkList(u);
			} else if (v.isPrecolored() || adjSet.contains(new Pair<>(u, v))) {
				constrainedMoves.add(m);
				AddWorkList(u);
				AddWorkList(v);
			} else {//v一定没有预着色，u可能有预着色
				boolean ok = true;
				for (ObjOperand t : Adjacent(v)) {
					if (!OK(t, u)) ok = false;
				}
				HashSet<ObjOperand> tmp = new HashSet<>();
				if (!u.isPrecolored()) {
					tmp.addAll(Adjacent(u));
					tmp.addAll(Adjacent(v));
				}
				if (u.isPrecolored() && ok || !u.isPrecolored() && Conservative(tmp)) {
					coalescedMoves.add(m);
					Combine(u, v);
					AddWorkList(u);
				} else {
					activeMoves.add(m);
				}
			}

		}
		for(ObjMove m : toberemoved)
		{
			worklistMoves.remove(m);
		}

	}

	private void Combine(ObjOperand u, ObjOperand v) {
		if (freezeWorklist.contains(v)) {
			freezeWorklist.remove(v);
		} else {
			spillWorklist.remove(v);
		}
		coalescedNodes.add(v);
		alias.put(v, u);
		HashSet<ObjMove> tmp = new HashSet<>(moveList.get(u));
		tmp.addAll(moveList.get(v));
		moveList.put(u, tmp);
		HashSet<ObjOperand> tmpp = new HashSet<>();
		tmpp.add(v);
		EnableMoves(tmpp);
		for (ObjOperand t : Adjacent(v)) {
			AddEdge(t, u);
			DecrementDegree(t);
		}

		if (degree.get(u) >= K && freezeWorklist.contains(u)) {
			freezeWorklist.remove(u);
			spillWorklist.add(u);
		}

	}

	private boolean Conservative(HashSet<ObjOperand> nodes) {
		int k = 0;
		for (ObjOperand n : nodes) {
			if (degree.get(n) >= K) {
				k += 1;
			}
		}
		return k < K;
	}

	private boolean OK(ObjOperand t, ObjOperand r) {
		return degree.get(t) < K || t.isPrecolored() || adjSet.contains(new Pair<>(t, r));
	}

	private void AddWorkList(ObjOperand u) {
		if (!u.isPrecolored() && !(MoveRelated(u)) && degree.get(u) < K) {
			freezeWorklist.remove(u);
			simplifyWorklist.add(u);
		}
	}

	private ObjOperand GetAlias(ObjOperand n) {
		if (coalescedNodes.contains(n)) {
			return GetAlias(alias.get(n));
		} else return n;
	}

	private void Simplify() {
		//冲突图里全是低度数传送无关点，需要一个个放到栈里删掉

		ObjOperand n = simplifyWorklist.iterator().next();
		simplifyWorklist.remove(n);
		selectStack.push(n);
		for (ObjOperand m : Adjacent(n)) {
			DecrementDegree(m);
		}
	}

	private void DecrementDegree(ObjOperand m) {
		//每个临时寄存器有三个命运：
		// degree>=k被加入spillworklist
		//degree<k但是和传送有关，被加入freezelist
		//degree<k传送无关，被加入simplifylist

		//x in simplifylist=>和x有关的传送指令，没有在activemoves或者worklistmoves里的
		//x in freezeworklist=>和x有关的传送指令，有在activemoves或者worklistmoves里的

		//在冲突图中每去掉一个点，就需要改一下其他邻居的degree
		// 同时活跃-selectstack-coalesced
		// 可能和传送有关或者无关，可能高度数可能低度数，不知道
		//m是要删除的点的一个邻居，首先让他degree-1，
		int d = degree.get(m);
		degree.put(m, d - 1);

		if (d == K) {
			HashSet<ObjOperand> tmp = new HashSet<>(Adjacent(m));
			tmp.add(m);
			EnableMoves(tmp);
			spillWorklist.remove(m);
			if (MoveRelated(m)) {
				freezeWorklist.add(m);
			} else {
				simplifyWorklist.add(m);
			}
		}
	}

	private void EnableMoves(HashSet<ObjOperand> tmp) {
		for (ObjOperand n : tmp) {
			for (ObjMove m : NodeMoves(n)) {
				if (activeMoves.contains(m)) {
					activeMoves.remove(m);
					worklistMoves.add(m);
				}
			}
		}
	}


}
