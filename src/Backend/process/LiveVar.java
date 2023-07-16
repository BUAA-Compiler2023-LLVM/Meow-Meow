package Backend.process;

import Backend.Registers;
import IR.IRModule;
import IR.Value.*;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.LoadInst;
import IR.Value.Instructions.StoreInst;
import Utils.DataStruct.IList;
import jdk.swing.interop.SwingInterOpUtils;

import java.util.*;


public class LiveVar {
	private final ArrayList<Value> Vars1 = new ArrayList<>();
	private final ArrayList<Value> Vars2 = new ArrayList<>();
	private int[][] GlobalIG;

	private void GetDefUse() {
		for (Function func : module.getFunctions()) {
			for (IList.INode<BasicBlock, Function> bb : func.getBbs()) {
				bb.getValue().Use.clear();
				bb.getValue().Def.clear();
				bb.getValue().liveIns.clear();
				bb.getValue().liveOuts.clear();
				bb.getValue().LocalInterfere.clear();
				for (IList.INode<Instruction, BasicBlock> inst : bb.getValue().getInsts()) {
					if (inst.getValue().hasName()) {
						bb.getValue().Def.add(inst.getValue());
						Vars2.add(inst.getValue());

					}
					for (Value a : inst.getValue().getOperands()) {
						if (a.spill) {
							if (!bb.getValue().Def.contains(a)) bb.getValue().Def.add(a);
							bb.getValue().Use.remove(a);
							continue;
						}
						if (!bb.getValue().Def.contains(a)&& !bb.getValue().Use.contains(a) && !(a instanceof Const)) {
							if (!a.spill) {
								bb.getValue().Use.add(a);
							} else {
								System.out.println("WHEN GETDEFUSE MEET SPILLLLLLLLLLLL");
								if (!bb.getValue().Def.contains(a)) bb.getValue().Def.add(a);
							}

						}

					}


				}
			}
		}
	}

	private int GetInOut(BasicBlock bb) {

		//changed return 1
		ArrayList<Value> InBackup = new ArrayList<>(bb.liveIns);
		bb.liveOuts.clear();
		for (BasicBlock bbb : bb.getNxtBlocks()) {
			for (Value v : bbb.liveIns) {
				if (!bb.liveOuts.contains(v)) {
					bb.liveOuts.add(v);
				}
			}
		}
		bb.liveIns.clear();
		bb.liveIns.addAll(bb.Use);
		for (Value v : bb.liveOuts) {
			if (!bb.liveIns.contains(v))
				bb.liveIns.add(v);
		}
		bb.liveIns.removeIf(bb.Def::contains);
		if (InBackup.equals(bb.liveIns)) {
			return 0;
		} else return 1;
	}

	private ArrayList<BasicBlock> hasbeendfs = new ArrayList<>();
	private ArrayList<ArrayList<Value>> GlobalInterfere = new ArrayList<>();

	private int dfs(BasicBlock bb) {
		//changed return 1
		if (hasbeendfs.contains(bb)) {
			return 0;
		}
		hasbeendfs.add(bb);
		int changed = GetInOut(bb);
		for (BasicBlock bbb : bb.getPreBlocks()) {
			if (dfs(bbb) == 1)
				changed = 1;
		}
		return changed;
	}

	private void DSFGetBBInOut() {
		for (Function func : module.getFunctions()) {
			//对每个bb分析inout，保存需要分配给全局寄存器的跨基本块活跃变量到Vars1
			BasicBlock tail = func.getBbExit();
//			System.out.println("EXIT:\t" + tail.getName());
			int changed = 1;
			while (changed == 1) {
				hasbeendfs.clear();
				changed = dfs(tail);
			}
			for (IList.INode<BasicBlock, Function> bb : func.getBbs()) {
//				bb.getValue().printBbDetail();
				GlobalInterfere.add(bb.getValue().liveIns);
				for (Value i : bb.getValue().liveIns) {
					if (!Vars1.contains(i))
						Vars1.add(i);
					Vars2.remove(i);
				}
			}
		}

	}

	private void GetInstInOut() {
		for (Function func : module.getFunctions()) {
			for (IList.INode<BasicBlock, Function> bb : func.getBbs()) {
				//进行指令级的inout分析，保存需要分配给局部寄存器的基本块内活跃变量到Vars2
				IList.INode<Instruction, BasicBlock> tmpinst = bb.getValue().getInsts().getTail();
				ArrayList<Value> tmpout = bb.getValue().liveOuts;

				while (tmpinst.getPrev() != null) {
					ArrayList<Value> tmpin = new ArrayList<>();
					//System.out.println(tmpinst.getValue().getInstString());
					Instruction ins = tmpinst.getValue();
					if (ins.hasName() && ins.spill == true) {
						ArrayList<Value> tmpin1 = new ArrayList<>();
						tmpin1.add(ins);
						tmpin1.addAll(tmpout);
						bb.getValue().LocalInterfere.add(tmpin1);
						tmpout = tmpin1;
					}
					ArrayList<Value> tmpdef = new ArrayList<>();
					if (ins.hasName()) tmpdef.add(ins);
					ArrayList<Value> tmpuse = new ArrayList<>();
					for (Value v : ins.getOperands()) {
						if (!(v instanceof Const) && !tmpdef.contains(v))
							tmpuse.add(v);
					}
					tmpin.addAll(tmpuse);
					for (Value v : tmpout) {
						if (!(v instanceof Const) && !tmpdef.contains(v) && !tmpin.contains(v))
							tmpin.add(v);
					}
//					System.out.print("[");
//					for(Value v : tmpin)
//					{
//						System.out.print(v.getName()+" ");
//
//					}
//					System.out.println("] ");
					bb.getValue().LocalInterfere.add(new ArrayList<>(tmpin));

					tmpout = tmpin;
					for (Value v : ins.getOperands()) {
						if (v.spill == Boolean.TRUE)//def:v,use:null
						{
							ArrayList<Value> xx = new ArrayList<>();
							xx.addAll(tmpout);
							xx.remove(v);
							bb.getValue().LocalInterfere.add(xx);
							tmpout = xx;
						}
					}
					tmpinst = tmpinst.getPrev();
				}
			}
		}

	}


	private int[][] BuildGlobalIG() {
		int len = Vars1.size();
		int[][] IG = new int[len][len];
		for (ArrayList<Value> i : GlobalInterfere) {
			int len1 = i.size();
			for (int ii = 0; ii < len1; ii++) {
				for (int jj = ii + 1; jj < len1; jj++) {
					IG[Vars1.indexOf(i.get(ii))][Vars1.indexOf(i.get(jj))] = 1;
					IG[Vars1.indexOf(i.get(jj))][Vars1.indexOf(i.get(ii))] = 1;
				}
			}
		}
		for (Function func : module.getFunctions()) {
			for (IList.INode<BasicBlock, Function> bb : func.getBbs()) {
				ArrayList<ArrayList<Value>> LocalInterf = bb.getValue().LocalInterfere;
				for (ArrayList<Value> a : LocalInterf) {
					for (Value vv : a) {
						if (Vars1.contains(vv)) {
							for (Value vvv : a) {
								if (!vvv.equals(vv) && Vars1.contains(vvv)) {
									IG[Vars1.indexOf(vvv)][Vars1.indexOf(vv)] = 1;
									IG[Vars1.indexOf(vv)][Vars1.indexOf(vvv)] = 1;
								}
							}
						}
					}

				}
			}
		}
		GlobalIG = IG;
		return IG;
	}

	private int[][] BuildLocalIG(BasicBlock bb) {
		ArrayList<Value> vars = new ArrayList<>();
		vars.addAll(bb.Def);
		vars.addAll(bb.Use);
		vars.removeIf(Vars1::contains);
		int len = vars.size();
		int[][] IG = new int[len][len];

		ArrayList<ArrayList<Value>> LocalInterf = bb.LocalInterfere;
		for (ArrayList<Value> a : LocalInterf) {

			int len1 = a.size();
			for (int ii = 0; ii < len1; ii++) {
				for (int jj = ii + 1; jj < len1; jj++) {
					if (vars.contains(a.get(ii)) && vars.contains(a.get(jj))) {
						IG[vars.indexOf(a.get(ii))][vars.indexOf(a.get(jj))] = 1;
						IG[vars.indexOf(a.get(jj))][vars.indexOf(a.get(ii))] = 1;
					}
				}
			}
		}
		return IG;
	}


	private IRModule module;

	public LiveVar(IRModule i) {
		this.module = i;
	}

	private int AllocaSReg() {
		int RegLimit = 12;
		int Gsize = GlobalIG.length;
//		System.out.println("GSIZE: " + Gsize);
//		for (int ii = 0; ii < Gsize; ii++) {
//			for (int jj = 0; jj < Gsize; jj++) {
//				System.out.print(GlobalIG[ii][jj] + " ");
//			}
//			System.out.println(" ");
//		}
		int Gtmp[][] = new int[Gsize][Gsize];
		for (int ii = 0; ii < Gsize; ii++) {
			for (int jj = 0; jj < Gsize; jj++) {
				Gtmp[ii][jj] = GlobalIG[ii][jj];
			}
		}
		int[] degrees = new int[Gsize];
		int getout = -1;
		Stack<Integer> spill = new Stack<>();
		for (int ii = 0; ii < Gsize; ii++) {
			degrees[ii] = Arrays.stream(Gtmp[ii]).sum();
			if (degrees[ii] < RegLimit) {
				getout = ii;

				break;
			}
		}
		while (getout != -1) {
			spill.push(getout);
			for (int ii = 0; ii < Gsize; ii++) {
				Gtmp[getout][ii] = 0;
				Gtmp[ii][getout] = 0;
			}
			getout = -1;
			for (int ii = 0; ii < Gsize; ii++) {
				degrees[ii] = Arrays.stream(Gtmp[ii]).sum();
				if (degrees[ii] < RegLimit && !spill.contains(ii)) {
					getout = ii;
					break;
				}
			}
		}
		//剩下的全是度>=k的了
		if (spill.size() < Vars1.size()) {
			//还有度>=k的节点，得从中根据溢出优先级溢出一个，此处简化为随便溢出一个
			Value WillSpill = null;
			for (int ii = 0; ii < Gsize; ii++) {
				if (degrees[ii] >= RegLimit) {
					//就决定溢出它
					WillSpill = Vars1.get(ii);
					WillSpill.spill = true;
					System.out.println("SPILL: " + WillSpill.getName());

					break;
				}
			}
			//对willsplit加好了load store指令，重新进行活跃变量分析
//			for (Function func : module.getFunctions()) {
//
//				for (IList.INode<BasicBlock, Function> bb : func.getBbs()) {
//int needjump=0;
//					for (IList.INode<Instruction, BasicBlock> inst : bb.getValue().getInsts()) {
//						if(needjump==1)
//						{
//							needjump=0;
//							continue;
//						}
////						System.out.print("WATCHING ");
////						System.out.println(inst.getValue());
//						if (inst.getValue().hasName() && inst.getValue().equals(WillSpill)) {
//							StoreInst tmp = new StoreInst(WillSpill, const0_32, bb.getValue());
//							tmp.insertAfter(inst.getValue());
//							//System.out.println("--insert sth after it");
//							needjump=1;
//
//						}
//						if (inst.getValue().getOperands().contains(WillSpill)) {
//
//							LoadInst tmp = new LoadInst(const0_32, I32, bb.getValue());
//							tmp.insertBefore(inst.getValue());
//							//System.out.println("--insert sth before it");
//						}
//					}
//				}
//			}
			return -1;
		} else {
//
			//不用spill，可以直接分配寄存器

			int[] AvailableRegs = new int[RegLimit];//-1代表这个颜色被隔壁占了
			int[] TempAllo = new int[Gsize];//现在是咋分配的
			Arrays.fill(AvailableRegs, 0);
			Arrays.fill(TempAllo, -1);
			while (!spill.empty()) {
				Arrays.fill(AvailableRegs, 0);//对现在pop的这个来说，有哪些是能用的
				int index = spill.pop();

				for (int ii = 0; ii < Gsize; ii++) {
					if (GlobalIG[ii][index] == 1 && TempAllo[ii] != -1) {
						AvailableRegs[TempAllo[ii]] = -1;
					}

				}
				for (int ii = 0; ii < RegLimit; ii++) {
					if (AvailableRegs[ii] != -1) {
						TempAllo[index] = ii;
						// System.out.println("allocate $"+ii+"-->"+index);
						break;
					}
				}

			}
			for (int ii = 0; ii < Gsize; ii++) {
				Vars1.get(ii).reg = Registers.getReg("s", TempAllo[ii]);
			}
			return 0;
		}

	}

	private int AllocaTReg(BasicBlock b) {
		int RegLimit = 7;
		int[][] LocalIG = BuildLocalIG(b);
		int Gsize = LocalIG.length;
		int LocalIGBackup[][] = new int[Gsize][Gsize];
		for (int ii = 0; ii < Gsize; ii++) {
			for (int jj = 0; jj < Gsize; jj++) {
				LocalIGBackup[ii][jj] = LocalIG[ii][jj];
			}
		}
		int[] degree = new int[Gsize];
		int getout = -1;
		Stack<Integer> spill = new Stack<>();
		for (int ii = 0; ii < Gsize; ii++) {
			degree[ii] = Arrays.stream(LocalIGBackup[ii]).sum();
			if (degree[ii] < RegLimit) {
				getout = ii;
				break;
			}
		}
		ArrayList<Value> vars = new ArrayList<>();
		vars.addAll(b.Def);
		vars.addAll(b.Use);
		vars.removeIf(Vars1::contains);
		while (getout != -1) {
			spill.push(getout);
			for (int ii = 0; ii < Gsize; ii++) {
				LocalIGBackup[getout][ii] = 0;
				LocalIGBackup[ii][getout] = 0;
			}
			getout = -1;
			for (int ii = 0; ii < Gsize; ii++) {
				degree[ii] = Arrays.stream(LocalIGBackup[ii]).sum();
				if (degree[ii] < RegLimit && !spill.contains(ii)) {
					getout = ii;
					break;
				}
			}
		}
		//剩下的全是度>=k的了
		if (spill.size() < LocalIG.length) {
			System.out.println("MUST SPILL");
			//还有度>=k的节点，得从中根据溢出优先级溢出一个，此处简化为随便溢出一个
			Value WillSpill = null;
			for (int ii = 0; ii < Gsize; ii++) {
				if (degree[ii] >= RegLimit) {
					//就决定溢出它
					WillSpill = vars.get(ii);
					WillSpill.spill = Boolean.TRUE;
					break;
				}
			}
			//对willsplit加好了load store指令，重新进行活跃变量分析
			//后来发现不应该加 加了会破坏SSA

//			for (IList.INode<Instruction, BasicBlock> inst : b.getInsts()) {
//				if (inst.getValue().hasName() && inst.getValue().equals(WillSpill)) {
//					StoreInst tmp = new StoreInst(WillSpill, const0_32, b);
//					tmp.insertAfter(inst.getValue());
//				}
//				if (inst.getValue().getOperands().contains(WillSpill)) {
//
//					LoadInst tmp = new LoadInst(const0_32, I32, b);
//					tmp.insertBefore(inst.getValue());
//				}
//			}
			return -1;
		} else {
			//不用spill，可以直接分配寄存器
			int[] AvailableRegs = new int[RegLimit];//-1代表这个颜色被隔壁占了
			int[] TempAllo = new int[Gsize];
			Arrays.fill(TempAllo, -1);
			while (!spill.empty()) {
				Arrays.fill(AvailableRegs, 0);
				int index = spill.pop();
				for (int ii = 0; ii < Gsize; ii++) {
					if (LocalIG[ii][index] == 1 && TempAllo[ii] != -1) {
						AvailableRegs[TempAllo[ii]] = -1;
					}

				}
				for (int ii = 0; ii < RegLimit; ii++) {
					if (AvailableRegs[ii] != -1) {
						TempAllo[index] = ii;
						break;
					}
				}

			}
			for (int ii = 0; ii < Gsize; ii++) {
				vars.get(ii).reg = Registers.getReg("t", TempAllo[ii]);
			}
		}
		return 0;
	}

	public static void Analysis(IRModule i) {
		LiveVar pass = new LiveVar(i);
		pass.GetDefUse();//对整个module分析defuse

		pass.DSFGetBBInOut();//对每个bb分析inout，保存需要分配给全局寄存器的跨基本块活跃变量到Vars1


		pass.GetInstInOut();//进行指令级的inout分析，保存需要分配给局部寄存器的基本块内活跃变量到Vars2

		//第一次构造干涉图
		pass.BuildGlobalIG();//Vars1里面的变量分配全局寄存器，干涉图在GIG
		int meow = 0;
		while (pass.AllocaSReg() != 0)//如果会有spill导致分配不成功，会修改module，再试试
		{
//			for (Function func : pass.module.getFunctions()) {
//				for (IList.INode<BasicBlock, Function> bb : func.getBbs()) {
//					bb.getValue().printBbDetail();
//				}
//			}
//			meow++;
//			if (meow == 2) return;
			pass = new LiveVar(i);
			pass.GetDefUse();
			pass.DSFGetBBInOut();
			pass.GetInstInOut();
			pass.BuildGlobalIG();
		}
		for (Function func : pass.module.getFunctions()) {
			for (IList.INode<BasicBlock, Function> bb : func.getBbs()) {
				while (pass.AllocaTReg(bb.getValue()) != 0)//如果会有spill导致分配不成功，会修改module，再试试
				{

					pass.GetDefUse();
					pass.DSFGetBBInOut();
					pass.GetInstInOut();
					pass.AllocaTReg(bb.getValue());
				}
//				System.out.println("==========");
//				for (ArrayList<Value> h : bb.getValue().LocalInterfere) {
//					for (Value v : h) {
//						System.out.print(v.getName() + " ");
//					}
//					System.out.println("interferes");
//				}
			}
		}
		for (Function func : pass.module.getFunctions()) {
			for (IList.INode<BasicBlock, Function> bb : func.getBbs()) {
				bb.getValue().printBbDetail();
			}
		}

	}
}
