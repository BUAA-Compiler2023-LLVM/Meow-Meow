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
	//t0-t6 && s0-s11 һ��19���ܷ����
	private boolean printLiveVar=false;

	private HashSet<ObjOperand> initials = new HashSet<>();
	/**
	 * ����һ���ڵ��ѯ��֮��صĽڵ���
	 **/
	private HashMap<ObjOperand, HashSet<ObjOperand>> adjList = new HashMap<>();
	/**
	 * �ߵļ���
	 */
	private HashSet<Pair<ObjOperand, ObjOperand>> adjSet = new HashSet<>();
	/**
	 * ��һ���ڵ㵽��ýڵ���ص� mov ָ��֮���ӳ��
	 */
	private HashMap<ObjOperand, HashSet<ObjMove>> moveList = new HashMap<>();
	private HashSet<ObjOperand> simplifyWorklist = new HashSet<>();
	/**
	 * �Ͷ����ģ������йصĽڵ��
	 */
	private HashSet<ObjOperand> freezeWorklist = new HashSet<>();
	/**
	 * �߶����Ľڵ��
	 */
	private HashSet<ObjOperand> spillWorklist = new HashSet<>();
	/**
	 * ��һ������ָ�� (u,v) ���ϲ����� v �Ѿ������� coalescedNodes �У�alias(v) = u
	 */
	private HashMap<ObjOperand, ObjOperand> alias = new HashMap<>();
	/**
	 * ������Ҫ������Ľڵ�ļ���
	 */
	private HashSet<ObjOperand> spilledNodes = new HashSet<>();
	private HashSet<ObjOperand> coloredNodes = new HashSet<>();
	/**
	 * �Ѻϲ��Ľڵ�ļ��ϣ����罫 u �ϲ��� v����ô�� u �������Ȼ�� v ������������
	 */
	private HashSet<ObjOperand> coalescedNodes = new HashSet<>();
	/**
	 * ����ɾ���ĵ�
	 */
	private Stack<ObjOperand> selectStack = new Stack<>();
	/**
	 * �п��ܺϲ��Ĵ���ָ���
	 */
	private HashSet<ObjMove> worklistMoves = new HashSet<>();
	/**
	 * ��δ���úϲ�׼���Ĵ���ָ���
	 */
	private HashSet<ObjMove> activeMoves = new HashSet<>();
	/**
	 * �Ѿ��ϲ��Ĵ���ָ���
	 */
	private HashSet<ObjInstr> coalescedMoves = new HashSet<>();
	/**
	 * Դ��������Ŀ���������ͻ�Ĵ���ָ���
	 */
	private HashSet<ObjMove> constrainedMoves = new HashSet<>();
	/**
	 * �����Ǻϲ��Ĵ���ָ���
	 */
	private HashSet<ObjMove> frozenMoves = new HashSet<>();
	/**
	 * �ڵ�Ķ�
	 */
	private HashMap<ObjOperand, Integer> degree = new HashMap<>();
	private HashMap<ObjOperand, Integer> color = new HashMap<>();
	/**
	 * �µ�����Ĵ�������������������ʱ������µ�����Ĵ���
	 */
	ObjVirReg vReg = null;
	/**
	 * �洢�����������ڵĻ������Ӧ��ѭ�����
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
						//ֻ��˫������������Ĵ����ģ��ŷ�move��
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
				//�߶����ڵ㣬Ǳ���������ɾ��
				spillWorklist.add(o);
			} else if (MoveRelated(o)) {
				//�Ͷ��������йأ����ű�freeze
				freezeWorklist.add(o);
			} else {
				//�Ͷ��������޹أ����ű�simplify
				simplifyWorklist.add(o);
			}
		}
	}

	private HashSet<ObjOperand> Adjacent(ObjOperand x) {
		//��ͻͼ�е����ڵĵ�

		HashSet<ObjOperand> ret = new HashSet<>(adjList.get(x));
		for (ObjOperand i : selectStack)
		//����ʽͼ��ɫ��������ʱɾ���ĵ��ջ
		{
			ret.remove(i);
		}
		for (ObjOperand i : coalescedNodes)
		//�Ѿ��ϲ��ļĴ������ϣ����u-<v�ϲ���һ�壬�Ͱ�v��������
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
			} else {//vһ��û��Ԥ��ɫ��u������Ԥ��ɫ
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
		//��ͻͼ��ȫ�ǵͶ��������޹ص㣬��Ҫһ�����ŵ�ջ��ɾ��

		ObjOperand n = simplifyWorklist.iterator().next();
		simplifyWorklist.remove(n);
		selectStack.push(n);
		for (ObjOperand m : Adjacent(n)) {
			DecrementDegree(m);
		}
	}

	private void DecrementDegree(ObjOperand m) {
		//ÿ����ʱ�Ĵ������������ˣ�
		// degree>=k������spillworklist
		//degree<k���Ǻʹ����йأ�������freezelist
		//degree<k�����޹أ�������simplifylist

		//x in simplifylist=>��x�йصĴ���ָ�û����activemoves����worklistmoves���
		//x in freezeworklist=>��x�йصĴ���ָ�����activemoves����worklistmoves���

		//�ڳ�ͻͼ��ÿȥ��һ���㣬����Ҫ��һ�������ھӵ�degree
		// ͬʱ��Ծ-selectstack-coalesced
		// ���ܺʹ����йػ����޹أ����ܸ߶������ܵͶ�������֪��
		//m��Ҫɾ���ĵ��һ���ھӣ���������degree-1��
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
