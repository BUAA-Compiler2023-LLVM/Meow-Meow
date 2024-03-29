package Backend.process;

import Backend.component.ObjBlock;
import Backend.component.ObjFunction;
import Backend.component.ObjGlobalVariable;
import Backend.component.ObjModule;
import Backend.instruction.*;
import Backend.operand.*;
import Frontend.AST;
import IR.IRModule;
import IR.Type.*;
import IR.Value.*;
import IR.Value.Instructions.*;
import IR.Visitor;
import Utils.DataStruct.IList;

import java.awt.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Optional;

import static Backend.operand.ObjPhyReg.*;

public class IrParser {
	private IRModule irModule;
	private ObjModule objModule;
	private HashMap<Function, ObjFunction> fMap;
	private HashMap<BasicBlock, ObjBlock> bMap;
	private HashMap<GlobalVar, ObjGlobalVariable> gMap;
	private HashMap<Value, ObjOperand> operandMap;
	public HashMap<ObjOperand, Value> operandMap1;

	private final static ObjFunction PrintFunc = new ObjFunction("@putint", true);
	private final static ObjFunction InputFunc = new ObjFunction("@getint", true);
	private final static ObjFunction PrintChFunc = new ObjFunction("@putch", true);
	private final static ObjFunction InputChFunc = new ObjFunction("@getch", true);
	private final static ObjFunction PrintArrFunc = new ObjFunction("@putarray", true);
	private final static ObjFunction InputArrFunc = new ObjFunction("@getarray", true);
	private final static ObjFunction PrintFloatFunc = new ObjFunction("@putfloat", true);
	private final static ObjFunction InputFloatFunc = new ObjFunction("@getfloat", true);
	private final static ObjFunction PrintFArrFunc = new ObjFunction("@putfarray", true);
	private final static ObjFunction InputFArrFunc = new ObjFunction("@getfarray", true);
	private final static ObjFunction MemsetFunc = new ObjFunction("@memset", true);
	private final static ObjFunction StartTimeFunc = new ObjFunction("@starttime", true);
	private final static ObjFunction StopTimeFunc = new ObjFunction("@stoptime", true);

	private HashMap<String, ObjFunction> Library_functions;

	public IrParser(IRModule irModule) {
		this.irModule = irModule;
		objModule = new ObjModule();
		fMap = new HashMap<>();
		bMap = new HashMap<>();
		gMap = new HashMap<>();
		operandMap = new HashMap<>();
		operandMap1 = new HashMap<>();
		Library_functions = new HashMap<>();

		Library_functions.put("@putint", PrintFunc);
		Library_functions.put("@getint", InputFunc);
		Library_functions.put("@putch", PrintChFunc);
		Library_functions.put("@getch", InputChFunc);
		Library_functions.put("@putarray", PrintArrFunc);
		Library_functions.put("@getarray", InputArrFunc);
		Library_functions.put("@putfloat", PrintFloatFunc);
		Library_functions.put("@getfloat", InputFloatFunc);
		Library_functions.put("@putfarray", PrintFArrFunc);
		Library_functions.put("@getfarray", InputFArrFunc);
		Library_functions.put("@memset", MemsetFunc);
		Library_functions.put("@starttime", StartTimeFunc);
		Library_functions.put("@stoptime", StopTimeFunc);

		SP.notNeedsColor();
		RA.notNeedsColor();
		for (int i = 0; i < 8; i++)
			A.get(0).notNeedsColor();
	}

	public ObjModule parseModule() {
		parseGlobalVariables();
		parseFunctions();
		changeFunctionNames();
		return objModule;
	}

	private void changeFunctionNames() {
		for (ObjFunction func : objModule.getFunctions()) {
			for (IList.INode<ObjBlock, ObjFunction> bb : func.getObjBlocks()) {
				bb.getValue().setName(func.getName() + "_" + bb.getValue().getName());
			}
		}

	}

	private void parseGlobalVariables() {
		for (GlobalVar g : irModule.getGlobalVars()) {
			ObjGlobalVariable objGlobalVariable = parseGlobalVariable(g);
			objModule.addGlobalVariable(objGlobalVariable);

			gMap.put(g, objGlobalVariable);
		}
	}

	private ObjGlobalVariable parseGlobalVariable(GlobalVar g) {

		Type type = ((PointerType) g.getType()).getEleType();
		ArrayList<Integer> elements = new ArrayList<>();
		ArrayList<Value> init = g.getValues();

		if (type instanceof IntegerType) {
			Value initValue = g.getValue();
			if (initValue != null) {
				int intValue = ((ConstInteger) initValue).getValue();
				elements.add(intValue);
			}

		} else if (type instanceof FloatType) {
			Value initValue = g.getValue();
			if (initValue != null) {
				float floatValue = ((ConstFloat) initValue).getValue();
				int intValue = Float.floatToRawIntBits(floatValue);
				elements.add(intValue);
			}
		} else if (type instanceof ArrayType) {
			for (Value value : init) {
				int intValue = 0;
				if (value.getType() instanceof IntegerType)
					intValue = ((ConstInteger) value).getValue();
				else if (value.getType() instanceof FloatType) {
					float floatValue = ((ConstFloat) value).getValue();
					intValue = Float.floatToRawIntBits(floatValue);
				}
				elements.add(intValue);
			}
		}

		if (elements.isEmpty()) {
			int totSize = 4;
			if (type instanceof ArrayType)
				totSize = 4 * ((ArrayType) type).getTotalSize();
			ObjGlobalVariable objGlobalVariable = new ObjGlobalVariable(g.getName(), totSize);
			return objGlobalVariable;
		} else {
			ObjGlobalVariable objGlobalVariable = new ObjGlobalVariable(g.getName(), elements);
			return objGlobalVariable;
		}

	}

	private void iMap() {

		for (Function f : irModule.getFunctions()) {
			ObjFunction objFunction = new ObjFunction(f.getName(), f.isLibFunction());
			objModule.addFunction(objFunction);
			fMap.put(f, objFunction);

			for (IList.INode<BasicBlock, Function> b : f.getBbs()) {
				BasicBlock irBlock = b.getValue();
				ObjBlock objBlock = new ObjBlock(irBlock.getName());
				bMap.put(irBlock, objBlock);

				objFunction.addBlocks(objBlock);
			}
		}

		for (Function f : irModule.getFunctions())
			for (IList.INode<BasicBlock, Function> b : f.getBbs()) {
				BasicBlock irBlock = b.getValue();
				ObjBlock objBlock = bMap.get(irBlock);
//				System.out.println(irBlock.getLoopDepth());
				objBlock.depth=irBlock.getLoopDepth();
				ArrayList<BasicBlock> preBlocks = irBlock.getPreBlocks();
				for (BasicBlock preB : preBlocks)
					objBlock.addPreBlock(bMap.get(preB));
				ArrayList<BasicBlock> nxtBlocks = irBlock.getNxtBlocks();
				for (BasicBlock nxtB : nxtBlocks)
					objBlock.addNxtBlock(bMap.get(nxtB));
			}
	}

	private void parseFunctions() {
		iMap();
		for (Function f : irModule.getFunctions())
			if (!f.isLibFunction())
				parseFunction(f);
	}

	private void parseFunction(Function f) {
		ObjFunction objF = fMap.get(f);

		for (IList.INode<BasicBlock, Function> b : f.getBbs()) {
			BasicBlock irBlock = b.getValue();
			for (IList.INode<Instruction, BasicBlock> inst : irBlock.getInsts()) {
				Instruction irInst = inst.getValue();
				if (irInst instanceof CallInst) {
					ArrayList<Value> operands = irInst.getOperands();
					int arg_nums = operands.size();
					objF.setArgsSize((arg_nums - 8) * 4);
					objF.setRsize();
				}
			}
		}

		for (IList.INode<BasicBlock, Function> b : f.getBbs()) {
			BasicBlock irBlock = b.getValue();
			parseBlock(irBlock, f);
		}


		ObjBlock tmpb = bMap.get(f.getBbExit());
		objF.setBbExit(tmpb);
		BasicBlock b = f.getBbs().getHead().getValue();

		ArrayList<Argument> args = f.getArgs();
		int args_num = args.size();
		int num_A = args_num;
		if (num_A > 8)
			num_A = 8;
		for (int i = 0; i < num_A; i++) {
			Value arg = args.get(i);
			ObjOperand operand = parseOperand(arg, 0, f, b);
			if (arg.getType() instanceof FloatType) {
				//ObjConversion objCon = ObjConversion.getItof(operand, A.get(i));
				ObjMove objMove = new ObjMove(operand, ObjFPhyReg.A.get(i));
				objF.getFirstBlock().addInstrHead(objMove);
			} else {
				ObjMove objMove = new ObjMove(operand, ObjPhyReg.A.get(i));
				objF.getFirstBlock().addInstrHead(objMove);
			}

		}
		int off = objF.getStackSize();
		for (int i = 8; i < args_num; i++) {
			Value arg = args.get(i);
			ObjOperand operand = parseOperand(arg, 0, f, b);
//			if (arg.getType() instanceof FloatType) {
//				ObjImm12 Imm = new ObjImm12(off + (i - 8) * 4);
//				ObjLoad objLoad = new ObjLoad(operand, SP, Imm, "flw");
//				objF.getFirstBlock().addInstrHead(objLoad);
//			} else {
//				ObjImm12 Imm = new ObjImm12(off + (i - 8) * 4);
//				ObjLoad objLoad = new ObjLoad(operand, SP, Imm, "lw");
//				objF.getFirstBlock().addInstrHead(objLoad);
//			}

			String ty = "lw";
			if (arg.getType() instanceof FloatType)
				ty = "flw";
			int immediate = off + (i - 8) * 4;
			getLoad(operand, SP, immediate, ty, false, objF, objF.getFirstBlock().getInstrs().getHead().getValue());
		}


		if (objF.getRsize() > 0) {
			// ObjImm12 Imm = new ObjImm12(objF.getStackSize() - 8);
			// ObjStore objStore = new ObjStore(RA, SP, Imm, "sd");
			// objF.getFirstBlock().addInstrHead(objStore);
			getStore(RA, SP, objF.getStackSize() - 8, "sd", false,
					objF, objF.getFirstBlock().getInstrs().getHeadValue());

			// ObjLoad objLoad = new ObjLoad(RA, SP, Imm, "ld");
			// objLoad.getNode().insertBefore(objF.getBbExit().getInstrs().getTail());
			getLoad(RA, SP, objF.getStackSize() - 8, "ld", false,
					objF, objF.getBbExit().getInstrs().getTail().getValue());
		}

		ObjOperand alloc = parseConstIntOperand(-objF.getStackSize(), 12, f, b);
		ObjBinary add = ObjBinary.getAdd(ObjPhyReg.SP, ObjPhyReg.SP, alloc);
		objF.getFirstBlock().addInstrHead(add);


		ObjOperand alloc1 = parseConstIntOperand(objF.getStackSize(), 12, f, b);
		ObjBinary add1 = ObjBinary.getAdd(ObjPhyReg.SP, ObjPhyReg.SP, alloc1);
		add1.getNode().insertBefore(objF.getBbExit().getInstrs().getTail());

	}

	private void parseBlock(BasicBlock b, Function f) {
		for (IList.INode<Instruction, BasicBlock> inst : b.getInsts()) {
			Instruction irInst = inst.getValue();
			parseInstruction(irInst, b, f);
		}
	}

	private void parseInstruction(Instruction irInst, BasicBlock irBlock, Function irFunction) {

		// System.out.println(irInst instanceof  CmpInst);
		if (irInst instanceof RetInst)
			parseRet((RetInst) irInst, irBlock, irFunction);
		else if (irInst instanceof AllocInst)
			parseAlloca((AllocInst) irInst, irBlock, irFunction);
		else if (irInst instanceof LoadInst)
			parseLoad((LoadInst) irInst, irBlock, irFunction);
		else if (irInst instanceof StoreInst)
			parseStore((StoreInst) irInst, irBlock, irFunction);
		else if (irInst instanceof CmpInst)
			parseCmp((CmpInst) irInst, irBlock, irFunction);

		else if (irInst instanceof BinaryInst) {
			if (irInst.getOp() == OP.Add)
				parseAdd((BinaryInst) irInst, irBlock, irFunction);
			if (irInst.getOp() == OP.Fadd)
				parseFAdd((BinaryInst) irInst, irBlock, irFunction);

			if (irInst.getOp() == OP.Mul)
				parseMul((BinaryInst) irInst, irBlock, irFunction);
			if (irInst.getOp() == OP.Fmul)
				parseFMul((BinaryInst) irInst, irBlock, irFunction);

			if (irInst.getOp() == OP.Sub)
				parseSub((BinaryInst) irInst, irBlock, irFunction);
			if (irInst.getOp() == OP.Fsub)
				parseFSub((BinaryInst) irInst, irBlock, irFunction);

			if (irInst.getOp() == OP.Div)
				parseDiv((BinaryInst) irInst, irBlock, irFunction);
			if (irInst.getOp() == OP.Fdiv)
				parseFDiv((BinaryInst) irInst, irBlock, irFunction);

			if (irInst.getOp() == OP.Mod)
				parseMod((BinaryInst) irInst, irBlock, irFunction);


			if (irInst.getOp() == OP.And)
				parseAnd((BinaryInst) irInst, irBlock, irFunction);
			if (irInst.getOp() == OP.Or)
				parseOr((BinaryInst) irInst, irBlock, irFunction);
			if (irInst.getOp() == OP.Xor)
				parseXor((BinaryInst) irInst, irBlock, irFunction);

			if (irInst.getOp() == OP.Shl)
				parseShl((BinaryInst) irInst, irBlock, irFunction);
			if (irInst.getOp() == OP.Shr)
				parseShr((BinaryInst) irInst, irBlock, irFunction);
		} else if (irInst instanceof BrInst)
			parseBr((BrInst) irInst, irBlock, irFunction);
		else if (irInst instanceof CallInst)
			parseCall((CallInst) irInst, irBlock, irFunction);
		else if (irInst instanceof GepInst)
			parseGep((GepInst) irInst, irBlock, irFunction);
		else if (irInst instanceof Move)
			parseMove((Move) irInst, irBlock, irFunction);
		else if (irInst instanceof ConversionInst)
			parseConversionInst((ConversionInst) irInst, irBlock, irFunction);

	}

	private void parseConversionInst(ConversionInst inst, BasicBlock irBlock, Function irFunction) {
//		System.out.println(inst);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);
		ObjOperand src = parseOperand(inst.getOperand(0), 0, irFunction, irBlock);
		ObjBlock objBlock = bMap.get(irBlock);
		if (inst.getOp() == OP.Ftoi) { // float to I32
			ObjConversion Ftoi = ObjConversion.getFtoi(dst, src);
//			System.out.println(Ftoi);
			objBlock.addInstr(Ftoi);
		} else if (inst.getOp() == OP.Itof) { // I32 to float
			ObjConversion Itof = ObjConversion.getItof(dst, src);
			objBlock.addInstr(Itof);
		} else if (inst.getOp() == OP.Zext) { // I1 to I32
			ObjMove objMove = new ObjMove(dst, src);
			objBlock.addInstr(objMove);
		} else if (inst.getOp() == OP.BitCast) { // to I32*

		}
	}

	private void parseMove(Move inst, BasicBlock irBlock, Function irFunction) {

		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src = parseOperand(inst.getOperand(0), 12, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);
		ObjMove objMove = new ObjMove(dst, src);
		objBlock.addInstr(objMove);
	}

	private void parseGep(GepInst inst, BasicBlock irBlock, Function irFunction) {
		ObjFunction objFunction = fMap.get(irFunction);
		ObjBlock objBlock = bMap.get(irBlock);



		ArrayList<Value> values = inst.getUseValues();
		ArrayList<Value> indexs = inst.getIndexs();

		ObjOperand baseOperand = parseOperand(values.get(0), 0, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		ObjMove objMove = new ObjMove(dst, baseOperand);
		objBlock.addInstr(objMove);

		PointerType imsb = (PointerType)(values.get(0).getType());
		ArrayList<Integer> dims=new ArrayList<>();
		ArrayList<Integer> sizes=new ArrayList<>();
		if(imsb.getEleType().isArrayType())//��ά
		{
			ArrayType imsb1 =(ArrayType)(imsb.getEleType());
			int dim=imsb1.getDim();
			dims.add(1);
			for(int i=0;i<dim-1;i++)
			{
//				System.out.println(imsb1);
				dims.add(imsb1.getNum());
				imsb1=(ArrayType)(imsb1.getEleType());
			}
			dims.add(imsb1.getNum());


			for(int i=dim;i>=0;i--)
			{
				if(sizes.isEmpty()) sizes.add(4);
				else
				{
					sizes.add(0,sizes.get(0)*dims.get(i+1));
				}
			}

		}
//		if(indexs.size()>1)
//			indexs.remove(0);


		if(sizes.isEmpty())
			sizes.add(4);
//		System.out.println(inst.getInstString());
//		System.out.println("ԭ����ά�ȣ�"+dims.size());
//		System.out.println("ԭ�����ά����"+dims);
//		System.out.println("ԭ�����ά��С"+sizes);
//		System.out.println("��Ҫȡ��ά�ȣ�"+(indexs.size()));
//		System.out.println("��Ҫȡ���±꣺"+indexs);
		assert sizes.size()==indexs.size();
		for(int i=indexs.size()-1;i>=0;i--)
		{
			if(indexs.get(i) instanceof  ConstInteger)//����±��ǳ���
			{
				int offset=sizes.get(i) * ((ConstInteger)(indexs.get(i))).getValue();
				if(offset == 0)
					continue ;
//				if(offset == 2048)
//					System.out.println(offset);
				ObjOperand offset_operand = parseConstIntOperand(offset, 12, irFunction, irBlock);
				ObjBinary bin= ObjBinary.getAdd(dst,dst,offset_operand);
				// System.out.println(bin);
				objBlock.addInstr(bin);
			}else
			{
				ObjOperand mul1 = parseOperand(indexs.get(i),0,irFunction,irBlock);
				ObjOperand mul2 = parseConstIntOperand(sizes.get(i),0,irFunction,irBlock);
//				ObjOperand tmpconst=genTmpReg(irFunction);
//				ObjMove mv= new ObjMove(tmpconst,mul2);  // li t0,114514
//				objBlock.addInstr(mv);
				ObjOperand tmp=genTmpReg(irFunction);
				ObjBinary bin= ObjBinary.getMul(tmp,mul1,mul2);
				objBlock.addInstr(bin);
				ObjBinary bin1= ObjBinary.getAdd(dst,dst,tmp);
				objBlock.addInstr(bin1);
			}

		}

	}

	private void parseCall(CallInst inst, BasicBlock irBlock, Function irFunction) {
		ObjFunction objFunction = fMap.get(irFunction);
		ObjBlock objBlock = bMap.get(irBlock);
		// System.out.println(inst.getFunction().getName());
//        if(inst.getFunction().getName() == "@putint")
//            return ;
//        if(inst.getFunction().getName() == "@memset")
//            return ;

		ObjFunction tarFunction = fMap.get(inst.getFunction());
		if (Library_functions.containsKey(inst.getFunction().getName()))
			tarFunction = Library_functions.get(inst.getFunction().getName());

		ArrayList<Value> operands = inst.getOperands();
		int arg_nums = operands.size();
		int num_A = arg_nums;
		if (num_A > 8)
			num_A = 8;

		for (int i = 0; i < num_A; i++) {
			Value arg = operands.get(i);
			ObjOperand objOperand = parseOperand(arg, 12, irFunction, irBlock);
			if (arg.getType() instanceof FloatType) {
				ObjMove objMove = new ObjMove(ObjFPhyReg.A.get(i), objOperand);
				objBlock.addInstr(objMove);
			} else {
				ObjMove objMove = new ObjMove(ObjPhyReg.A.get(i), objOperand);
				objBlock.addInstr(objMove);
			}

		}
		for (int i = 8; i < arg_nums; i++) {
			Value arg = operands.get(i);
			ObjOperand objOperand = parseOperand(arg, 12, irFunction, irBlock);
			if(objOperand instanceof ObjImm12)
			{
				ObjOperand tmp=null;
				if(arg.getType().isFloatTy())
				{
					tmp=genFTmpReg(irFunction);
				}else tmp=genTmpReg(irFunction);
				ObjMove mv=new ObjMove(tmp,objOperand);
				objBlock.addInstr(mv);
				objOperand=tmp;
			}

//			ObjImm12 offset = new ObjImm12((i - 8) * 4);
//			if (arg.getType() instanceof FloatType) {
//				ObjStore objStore = new ObjStore(objOperand, SP, offset, "fsw");
//				objBlock.addInstr(objStore);
//			} else {
//				ObjStore objStore = new ObjStore(objOperand, SP, offset, "sw");
//				objBlock.addInstr(objStore);
//			}
			int immediate = (i - 8) * 4;
			if (arg.getType() instanceof FloatType)
				getStore(objOperand, SP, immediate, "fsw", true, objFunction,
						objBlock.getInstrs().getTailValue());
			else
				getStore(objOperand, SP, immediate, "sw", true, objFunction,
						objBlock.getInstrs().getTailValue());
		}

		ObjCall objCall = new ObjCall(tarFunction);
		objBlock.addInstr(objCall);

		if (!(inst.getType() instanceof VoidType)) {
			ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);
			if (inst.getType() instanceof IntegerType) {
				ObjMove objMove = new ObjMove(dst, ObjPhyReg.A.get(0));
				objBlock.addInstr(objMove);
			} else if (inst.getType() instanceof FloatType) {
//				ObjConversion objCov = ObjConversion.getItof(dst,ObjFPhyReg. A.get(0));
//				objBlock.addInstr(objCov);
				ObjMove objMove = new ObjMove(dst, ObjFPhyReg.A.get(0));
				objBlock.addInstr(objMove);
			}
		}
	}

	private void parseCmp(CmpInst inst, BasicBlock irBlock, Function irFunction) {
		OP op = inst.getOp();
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);
		Value left = inst.getLeftVal(), right = inst.getRightVal();
		ObjBlock objBlock = bMap.get(irBlock);
		ObjFunction objFunction = fMap.get(irFunction);


		// ne eq lt le gt ge
		if (op == OP.Ne) {
			ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 12, irFunction, irBlock);
			ObjVirReg tmpReg = new ObjVirReg();
			objFunction.addUsedVirReg(tmpReg);

			ObjBinary objBinary;
			if (objRight instanceof ObjImm12)
				objBinary = ObjBinary.getXor(tmpReg, objLeft, objRight);
			else
				objBinary = ObjBinary.getXor(tmpReg, objLeft, objRight);
			objBlock.addInstr(objBinary);

			ObjBinary objBinary2 = ObjBinary.getSltu(dst, ZERO, tmpReg);
			objBlock.addInstr(objBinary2);
		} else if (op == OP.FNe) {
			ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 0, irFunction, irBlock);
			ObjOperand tmpReg = genTmpReg(irFunction);

			ObjBinary Feq = ObjBinary.getFeq(tmpReg, objLeft, objRight);
			objBlock.addInstr(Feq);
			ObjBinary objBinary = ObjBinary.getSltu(dst, ZERO, tmpReg);
			objBlock.addInstr(objBinary);
		} else if (op == OP.Eq) { // ( a xor b == 0 )
			ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 12, irFunction, irBlock);
			ObjVirReg tmpReg = new ObjVirReg();
			objFunction.addUsedVirReg(tmpReg);

			ObjBinary objBinary;
			if (objRight instanceof ObjImm12)
				objBinary = ObjBinary.getXor(tmpReg, objLeft, objRight);
			else
				objBinary = ObjBinary.getXor(tmpReg, objLeft, objRight);
			objBlock.addInstr(objBinary);

			ObjVirReg tmpReg2 = new ObjVirReg();
			objFunction.addUsedVirReg(tmpReg2);
			ObjBinary objBinary2 = ObjBinary.getSltu(tmpReg2, ZERO, tmpReg);
			objBlock.addInstr(objBinary2);

			ObjBinary objBinary3 = ObjBinary.getXor(dst, tmpReg2, new ObjImm12(1));
			objBlock.addInstr(objBinary3);
		} else if (op == OP.FEq) {
			ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 0, irFunction, irBlock);

			ObjBinary Feq = ObjBinary.getFeq(dst, objLeft, objRight);
			objBlock.addInstr(Feq);
		} else if (op == OP.Lt) {
			ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 12, irFunction, irBlock);

			ObjBinary objBinary;
			if (objRight instanceof ObjImm12)
				objBinary = ObjBinary.getSlti(dst, objLeft, objRight);
			else
				objBinary = ObjBinary.getSlt(dst, objLeft, objRight);
			objBlock.addInstr(objBinary);
		} else if (op == OP.FLt) {
			ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 0, irFunction, irBlock);
			ObjBinary Flt = ObjBinary.getFlt(dst, objLeft, objRight);
			objBlock.addInstr(Flt);
		} else if (op == OP.Le) { // left <= Right    !( Right < left )
			ObjOperand objLeft = parseOperand(left, 12, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 0, irFunction, irBlock);
			ObjVirReg tmpReg = new ObjVirReg();
			objFunction.addUsedVirReg(tmpReg);

			ObjBinary objBinary;
			if (objLeft instanceof ObjImm12)
				objBinary = ObjBinary.getSlti(tmpReg, objRight, objLeft);
			else
				objBinary = ObjBinary.getSlt(tmpReg, objRight, objLeft);
			objBlock.addInstr(objBinary);

			ObjBinary objBinary2 = ObjBinary.getXor(dst, tmpReg, new ObjImm12(1));
			objBlock.addInstr(objBinary2);
		} else if (op == OP.FLe) {
			ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 0, irFunction, irBlock);
			ObjBinary Fle = ObjBinary.getFle(dst, objLeft, objRight);
			objBlock.addInstr(Fle);
		} else if (op == OP.Gt) { // (left > Right)
			ObjOperand objLeft = parseOperand(left, 12, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 0, irFunction, irBlock);
			ObjBinary objBinary;
			if (objLeft instanceof ObjImm12)
				objBinary = ObjBinary.getSlti(dst, objRight, objLeft);
			else
				objBinary = ObjBinary.getSlt(dst, objRight, objLeft);
			objBlock.addInstr(objBinary);
		} else if (op == OP.FGt) {
			ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 0, irFunction, irBlock);
			ObjBinary Fgt = ObjBinary.getFGt(dst, objLeft, objRight);
			objBlock.addInstr(Fgt);
		} else if (op == OP.Ge) { // left >= Right    ! ( left < Right )
			ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 12, irFunction, irBlock);
			ObjVirReg tmpReg = new ObjVirReg();
			objFunction.addUsedVirReg(tmpReg);

			ObjBinary objBinary;
			if (objRight instanceof ObjImm12)
				objBinary = ObjBinary.getSlti(tmpReg, objLeft, objRight);
			else
				objBinary = ObjBinary.getSlt(tmpReg, objLeft, objRight);
			objBlock.addInstr(objBinary);

			ObjBinary objBinary2 = ObjBinary.getXor(dst, tmpReg, new ObjImm12(1));
			objBlock.addInstr(objBinary2);
		} else if (op == OP.FGe) {
			ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
			ObjOperand objRight = parseOperand(right, 0, irFunction, irBlock);
			ObjBinary Fge = ObjBinary.getFGe(dst, objLeft, objRight);
			objBlock.addInstr(Fge);
		}
	}


	private void parseBr(BrInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);

		if (!inst.isJump()) {
			Value irCondition = inst.getJudVal();
			BasicBlock irTrueBlock = inst.getTrueBlock();
			BasicBlock irFalseBlock = inst.getFalseBlock();

			if (irCondition instanceof ConstInteger) {
				int condImm = ((ConstInteger) irCondition).getValue();
				if (condImm != 0) {
					ObjBranch objBranch = new ObjBranch(bMap.get(irTrueBlock));
					objBlock.addInstr(objBranch);
					objBlock.setTrueBlock(bMap.get(irTrueBlock));
				} else {
					ObjBranch objBranch = new ObjBranch(bMap.get(irFalseBlock));
					objBlock.addInstr(objBranch);
					objBlock.setTrueBlock(bMap.get(irFalseBlock));
				}
			} else if (irCondition instanceof CmpInst) {
				CmpInst condition = (CmpInst) irCondition;
				ObjOperand cond = operandMap.get(condition);

				ObjBlock objTrueBlock = bMap.get(irTrueBlock);
				ObjBlock objFalseBlock = bMap.get(irFalseBlock);

				ObjBranch objBranch = new ObjBranch(false, cond, objTrueBlock);
				objBlock.addInstr(objBranch);
				ObjBranch objBranch1 = new ObjBranch(objFalseBlock);
				objBlock.addInstr(objBranch1);

				objBlock.setTrueBlock(bMap.get(irTrueBlock));
				objBlock.setFalseBlock(bMap.get(irFalseBlock));
			}
		} else {
			ObjBlock objTargetBlock = bMap.get(inst.getJumpBlock());
			ObjBranch objBranch = new ObjBranch(objTargetBlock);
			objBlock.addInstr(objBranch);
			objBlock.setTrueBlock(objTargetBlock);
		}
	}

	private void parseAnd(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 12, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 12, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		if ((src1 instanceof ObjImm12) && (src2 instanceof ObjImm12)) {
			int ans = ((ObjImm12) src1).getImmediate12() & ((ObjImm12) src2).getImmediate12();
			ObjMove objMove = new ObjMove(dst, parseConstIntOperand(ans, 32, irFunction, irBlock));
			objBlock.addInstr(objMove);
		} else if (src1 instanceof ObjImm12) {
			ObjBinary objAddi = ObjBinary.getAdd(dst, src2, src1);
			objBlock.addInstr(objAddi);
		} else if (src2 instanceof ObjImm12) {
			ObjBinary objAddi = ObjBinary.getAdd(dst, src1, src2);
			objBlock.addInstr(objAddi);
		} else {
			ObjBinary objAnd = ObjBinary.getAnd(dst, src1, src2);
			objBlock.addInstr(objAnd);
		}
	}

	private void parseOr(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 12, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 12, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		if ((src1 instanceof ObjImm12) && (src2 instanceof ObjImm12)) {
			int ans = ((ObjImm12) src1).getImmediate12() | ((ObjImm12) src2).getImmediate12();
			ObjMove objMove = new ObjMove(dst, parseConstIntOperand(ans, 32, irFunction, irBlock));
			objBlock.addInstr(objMove);
		} else if (src1 instanceof ObjImm12) {
			ObjBinary objOri = ObjBinary.getOr(dst, src2, src1);
			objBlock.addInstr(objOri);
		} else if (src2 instanceof ObjImm12) {
			ObjBinary objOri = ObjBinary.getOr(dst, src1, src2);
			objBlock.addInstr(objOri);
		} else {
			ObjBinary objOr = ObjBinary.getOr(dst, src1, src2);
			objBlock.addInstr(objOr);
		}
	}

	private void parseXor(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 12, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 12, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		if ((src1 instanceof ObjImm12) && (src2 instanceof ObjImm12)) {
			int ans = ((ObjImm12) src1).getImmediate12() ^ ((ObjImm12) src2).getImmediate12();
			ObjMove objMove = new ObjMove(dst, parseConstIntOperand(ans, 32, irFunction, irBlock));
			objBlock.addInstr(objMove);
		} else if (src1 instanceof ObjImm12) {
			ObjBinary objXori = ObjBinary.getXor(dst, src2, src1);
			objBlock.addInstr(objXori);
		} else if (src2 instanceof ObjImm12) {
			ObjBinary objXori = ObjBinary.getXor(dst, src1, src2);
			objBlock.addInstr(objXori);
		} else {
			ObjBinary objXor = ObjBinary.getXor(dst, src1, src2);
			objBlock.addInstr(objXor);
		}
	}

	private void parseShl(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 12, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 12, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		if ((src1 instanceof ObjImm12) && (src2 instanceof ObjImm12)) {
			int ans = ((ObjImm12) src1).getImmediate12() << ((ObjImm12) src2).getImmediate12();
			ObjMove objMove = new ObjMove(dst, parseConstIntOperand(ans, 32, irFunction, irBlock));
			objBlock.addInstr(objMove);
		} else if (src2 instanceof ObjImm12) {
			ObjBinary objSlli = ObjBinary.getSll(dst, src1, src2);
			objBlock.addInstr(objSlli);
		} else {
			ObjBinary objSll = ObjBinary.getSll(dst, src1, src2);
			objBlock.addInstr(objSll);
		}
	}

	private void parseShr(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 12, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 12, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		if ((src1 instanceof ObjImm12) && (src2 instanceof ObjImm12)) {
			int ans = ((ObjImm12) src1).getImmediate12() >>> ((ObjImm12) src2).getImmediate12();
			ObjMove objMove = new ObjMove(dst, parseConstIntOperand(ans, 32, irFunction, irBlock));
			objBlock.addInstr(objMove);
		} else if (src2 instanceof ObjImm12) {
			ObjBinary objSrli = ObjBinary.getSrl(dst, src1, src2);
			objBlock.addInstr(objSrli);
		} else {
			ObjBinary objSrl = ObjBinary.getSrl(dst, src1, src2);
			objBlock.addInstr(objSrl);
		}
	}

	private void parseMod(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 0, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 0, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		ObjBinary objRem = ObjBinary.getRem(dst, src1, src2);
		objBlock.addInstr(objRem);
	}

	private void parseMul(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 0, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 0, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		ObjBinary objMul = ObjBinary.getMul(dst, src1, src2);
		objBlock.addInstr(objMul);
	}

	private void parseFMul(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 0, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 0, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		ObjBinary objMul = ObjBinary.getFMul(dst, src1, src2);
		objBlock.addInstr(objMul);
	}

	private void parseDiv(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 0, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 0, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		ObjBinary objDiv = ObjBinary.getDiv(dst, src1, src2);
		objBlock.addInstr(objDiv);
	}

	private void parseFDiv(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 0, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 0, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		ObjBinary objFDiv = ObjBinary.getFDiv(dst, src1, src2);
		objBlock.addInstr(objFDiv);
	}

	private void parseSub(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		boolean isOp1Const = inst.getLeftVal() instanceof ConstInteger;
		boolean isOp2Const = inst.getRightVal() instanceof ConstInteger;
		ObjOperand src1, src2;
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		if (isOp1Const && isOp2Const) {
			int op1Imm = ((ConstInteger) inst.getLeftVal()).getValue();
			int op2Imm = ((ConstInteger) inst.getRightVal()).getValue();
			ObjMove objMove = new ObjMove(dst, new ObjImm(op1Imm - op2Imm));
			objBlock.addInstr(objMove);
		} else {
			src1 = parseOperand(inst.getLeftVal(), 0, irFunction, irBlock);
			src2 = parseOperand(inst.getRightVal(), 12, irFunction, irBlock);
			ObjBinary objSub = ObjBinary.getSub(dst, src1, src2);
			objBlock.addInstr(objSub);
		}
	}

	private void parseFSub(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 0, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 0, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		ObjBinary objFSub = ObjBinary.getFSub(dst, src1, src2);
		objBlock.addInstr(objFSub);
	}

	private void parseAdd(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		boolean isOp1Const = inst.getLeftVal() instanceof ConstInteger;
		boolean isOp2Const = inst.getRightVal() instanceof ConstInteger;
		ObjOperand src1, src2;
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);
		if (isOp1Const && isOp2Const) {
			int op1Imm = ((ConstInteger) inst.getLeftVal()).getValue();
			int op2Imm = ((ConstInteger) inst.getRightVal()).getValue();
			ObjMove objMove = new ObjMove(dst, new ObjImm(op1Imm + op2Imm));
			objBlock.addInstr(objMove);
		} else if (isOp1Const) {
			src1 = parseOperand(inst.getRightVal(), 0, irFunction, irBlock);
			src2 = parseOperand(inst.getLeftVal(), 12, irFunction, irBlock);
			ObjBinary objAdd = ObjBinary.getAdd(dst, src1, src2);
			objBlock.addInstr(objAdd);
		} else {
			src1 = parseOperand(inst.getLeftVal(), 0, irFunction, irBlock);
			src2 = parseOperand(inst.getRightVal(), 12, irFunction, irBlock);
			ObjBinary objAdd = ObjBinary.getAdd(dst, src1, src2);
			objBlock.addInstr(objAdd);
		}
	}

	private void parseFAdd(BinaryInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjOperand src1 = parseOperand(inst.getLeftVal(), 0, irFunction, irBlock);
		ObjOperand src2 = parseOperand(inst.getRightVal(), 0, irFunction, irBlock);
		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);

		ObjBinary objFAdd = ObjBinary.getFAdd(dst, src1, src2);
		objBlock.addInstr(objFAdd);
	}

	private void parseStore(StoreInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
//store float 1.0, float* %16
		Value irAddr = inst.getPointer();
		if (irAddr instanceof GlobalVar) {//TODO
			ObjOperand tmp =genTmpReg(irFunction);
			ObjOperand addr = parseOperand(irAddr, 0, irFunction, irBlock);
			String type="lw";
			ObjLoad objLoad = new ObjLoad(tmp, addr, type);//la
			objBlock.addInstr(objLoad);

			ObjOperand src = parseOperand(inst.getValue(), 0, irFunction, irBlock);
			ObjOperand offset = new ObjImm12(0);
			String type1="sw";
			if(src instanceof ObjFVirReg) type1="fsw";
			ObjStore objStore = new ObjStore(src, tmp, offset, type1);
			objBlock.addInstr(objStore);
		} else {
			ObjOperand src = parseOperand(inst.getValue(), 0, irFunction, irBlock);

			ObjOperand addr = parseOperand(irAddr, 0, irFunction, irBlock);
			ObjOperand offset = new ObjImm12(0);
			String type="sw";
			if(src instanceof ObjFVirReg) type="fsw";

			ObjStore objStore = new ObjStore(src, addr, offset, type);
			objBlock.addInstr(objStore);
		}

	}

	private void getStore(ObjOperand src, ObjOperand addr, int immediate, String ty,
						  boolean insertpos, ObjFunction objFunction, ObjInstr instr) {
		// insertpos false: ???????, true: ???????
		if (immediate >= -2048 && immediate <= 2047) {
			ObjImm12 Imm = new ObjImm12(immediate);
			ObjStore objStore = new ObjStore(src, addr, Imm, ty);
			if (insertpos)
				objStore.getNode().insertAfter(instr.getNode());
			else
				objStore.getNode().insertBefore(instr.getNode());
		}
		else {
			ObjOperand tmp = genTmpReg(objFunction);
			ObjImm tmpimm = new ObjImm(immediate);
			ObjMove objMove = new ObjMove(tmp, tmpimm);

			ObjOperand addr2 = genTmpReg(objFunction);
			ObjBinary objAdd = ObjBinary.getAdd(addr2, addr, tmp);

			ObjStore objStore = new ObjStore(src, addr2, new ObjImm12(0), ty);
			if(insertpos) {
				objMove.getNode().insertAfter(instr.getNode());
				objAdd.getNode().insertAfter(objMove.getNode());
				objStore.getNode().insertAfter(objAdd.getNode());
			}
			else {
				objStore.getNode().insertBefore(instr.getNode());
				objAdd.getNode().insertBefore(objStore.getNode());
				objMove.getNode().insertBefore(objAdd.getNode());
			}
		}

	}

	private void getLoad(ObjOperand dst, ObjOperand addr, int immediate, String ty,
						 boolean insertpos, ObjFunction objFunction, ObjInstr instr) {

		// insertpos false: ???????, true: ???????
		if (immediate >= -2048 && immediate <= 2047) {
			ObjImm12 Imm = new ObjImm12(immediate);
			ObjLoad objLoad = new ObjLoad(dst, addr, Imm, ty);
			if(insertpos)
				objLoad.getNode().insertAfter(instr.getNode());
			else
				objLoad.getNode().insertBefore(instr.getNode());
		}
		else {
			ObjOperand tmp = genTmpReg(objFunction);
			ObjImm tmpimm = new ObjImm(immediate);
			ObjMove objMove = new ObjMove(tmp, tmpimm);

			ObjOperand addr2 = genTmpReg(objFunction);
			ObjBinary objAdd = ObjBinary.getAdd(addr2, addr, tmp);

			ObjLoad objLoad = new ObjLoad(dst, addr2, new ObjImm12(0), ty);

			if(insertpos) {
//				instr.getNode().insertAfter(objMove.getNode());
//				objMove.getNode().insertAfter(objAdd.getNode());
//				objAdd.getNode().insertAfter(objLoad.getNode());
				objMove.getNode().insertAfter(instr.getNode());
				objAdd.getNode().insertAfter(objMove.getNode());
				objLoad.getNode().insertAfter(objAdd.getNode());
			}
			else {
//				instr.getNode().insertBefore(objLoad.getNode());
//				objLoad.getNode().insertBefore(objAdd.getNode());
//				objAdd.getNode().insertBefore(objMove.getNode());
				objLoad.getNode().insertBefore(instr.getNode());
				objAdd.getNode().insertBefore(objLoad.getNode());
				objMove.getNode().insertBefore(objAdd.getNode());
			}
		}
	}

	private void parseLoad(LoadInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
//%4 = load float, float* @g       la s0,g     ;  lw s1,0(s0)
//dst                    addr
		Value irAddr = inst.getPointer();
		if (irAddr instanceof GlobalVar) {
			ObjOperand tmp =genTmpReg(irFunction);
			ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);
			ObjOperand addr = parseOperand(irAddr, 0, irFunction, irBlock);
			String type="lw";
			ObjLoad objLoad = new ObjLoad(tmp, addr, type);//la:tmp??????
			objBlock.addInstr(objLoad);
			String type1="lw";
			if(dst instanceof ObjFVirReg) type1="flw";

			ObjOperand offset = new ObjImm12(0);
			ObjLoad objLoad1 = new ObjLoad(dst, tmp, offset, type1);
			objBlock.addInstr(objLoad1);
		} else {
			ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);
			ObjOperand addr = parseOperand(irAddr, 0, irFunction, irBlock);
			ObjOperand offset = new ObjImm12(0);
			String type="lw";
			if(dst instanceof ObjFVirReg) type="flw";
			ObjLoad objLoad = new ObjLoad(dst, addr, offset, type);
			objBlock.addInstr(objLoad);
		}

	}

	private void parseAlloca(AllocInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjFunction objFunction = fMap.get(irFunction);

		Type pointeeType = ((PointerType) inst.getType()).getEleType();
		int off = objFunction.getArgsSize() + objFunction.getAllocaSize();
		ObjOperand offset = parseConstIntOperand(off, 12, irFunction, irBlock);

		if (pointeeType.isArrayType())
			objFunction.addAllocaSize(4 * ((ArrayType) pointeeType).getTotalSize());
		else
			objFunction.addAllocaSize(4);

		ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);
		ObjBinary objAdd = ObjBinary.getAdd(dst, ObjPhyReg.SP, offset);
		objBlock.addInstr(objAdd);
	}

	private void parseRet(RetInst inst, BasicBlock irBlock, Function irFunction) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjFunction objFunction = fMap.get(irFunction);
		Value irRetValue = inst.getValue();
		if (irRetValue != null) {
			if (irFunction.getType().isFloatTy()) {
				ObjOperand objRet = parseOperand(irRetValue, 32, irFunction, irBlock);
				ObjMove objMove = new ObjMove(ObjFPhyReg.A.get(0), objRet);
				objBlock.addInstr(objMove);
			} else {
				ObjOperand objRet = parseOperand(irRetValue, 32, irFunction, irBlock);
				ObjMove objMove = new ObjMove(ObjPhyReg.A.get(0), objRet);
				objBlock.addInstr(objMove);
			}

		}
		objBlock.addInstr(new ObjRet());
	}

	private ObjOperand genTmpReg(Function irFunction) {
		ObjFunction objFunction = fMap.get(irFunction);
		ObjVirReg tmpReg = new ObjVirReg();
		objFunction.addUsedVirReg(tmpReg);
		return tmpReg;
	}

	private ObjOperand genTmpReg(ObjFunction objFunction) {
		ObjVirReg tmpReg = new ObjVirReg();
		objFunction.addUsedVirReg(tmpReg);
		return tmpReg;
	}

	private ObjOperand genFTmpReg(Function irFunction) {
		ObjFunction objFunction = fMap.get(irFunction);
		ObjFVirReg tmpReg = new ObjFVirReg();
		objFunction.addUsedVirReg(tmpReg);
		return tmpReg;
	}
	private ObjOperand genDstOperand(Value irValue, Function irFunction) {
		ObjFunction objFunction = fMap.get(irFunction);

		if (irValue.getType() instanceof FloatType) {
			ObjFVirReg dstReg = new ObjFVirReg();
			objFunction.addUsedVirReg(dstReg);
			operandMap.put(irValue, dstReg);
			operandMap1.put(dstReg, irValue);
			return dstReg;
		} else {
			ObjVirReg dstReg = new ObjVirReg();
			objFunction.addUsedVirReg(dstReg);
			operandMap.put(irValue, dstReg);
			operandMap1.put(dstReg, irValue);
			return dstReg;
		}
	}

	private ObjOperand parseOperand(Value irValue, int canImm, Function irFunction, BasicBlock irBlock) {
		if (operandMap.containsKey(irValue)) {
			ObjOperand objOperand = operandMap.get(irValue);
			if (((objOperand instanceof ObjImm) && canImm < 32)
					|| ((objOperand instanceof ObjImm12) && canImm < 12)) {

				if (((ObjImm) objOperand).getImmediate() == 0)
					return ZERO;
				else {
					ObjOperand tmp = genTmpReg(irFunction);
					ObjMove objMove = new ObjMove(tmp, objOperand);
					bMap.get(irBlock).addInstr(objMove);
					return tmp;
				}
			}
			return objOperand;
		}


		if ((irValue instanceof Move) && (((Move) irValue).pair.size() != 0)) {
			boolean contains = false;
			Value ir = null;
			for (Move x : ((Move) irValue).pair) {
				if (operandMap.containsKey(x)) {
					contains = true;
					ir = x;
					break;
				}

			}
			if (contains) {
				ObjOperand objOperand = operandMap.get(ir);
				if (((objOperand instanceof ObjImm) && canImm < 32)
						|| ((objOperand instanceof ObjImm12) && canImm < 12)) {

					if (((ObjImm) objOperand).getImmediate() == 0)
						return ZERO;
					else {
						ObjOperand tmp = genTmpReg(irFunction);
						ObjMove objMove = new ObjMove(tmp, objOperand);
						bMap.get(irBlock).addInstr(objMove);
						return tmp;
					}
				}
				return objOperand;
			}

		}
		if (irValue instanceof ConstInteger)
			return parseConstIntOperand(((ConstInteger) irValue).getValue(), canImm, irFunction, irBlock);

		if (irValue instanceof ConstFloat) {
			float floatValue = ((ConstFloat) irValue).getValue();
			int intValue = Float.floatToRawIntBits(floatValue);
			String hexString = Integer.toHexString(intValue);

//			System.out.println(floatValue);
//			System.out.println(intValue);
//			System.out.println(hexString);

			ObjOperand src = genDstOperand(irValue, irFunction);

			ObjOperand initValue = parseConstFloatOperand(intValue, 32, irFunction, irBlock);
			ObjOperand tmp=genTmpReg(irFunction);
			ObjLoad l1= new ObjLoad(tmp,initValue,"la");
			bMap.get(irBlock).addInstr(l1);
			ObjLoad objMove = new ObjLoad(src, tmp,new ObjImm12(0),"flw");

			bMap.get(irBlock).addInstr(objMove);
			return src;
		}

		if (irValue instanceof GlobalVar)
			return parseGlobalOperand((GlobalVar) irValue, irFunction, irBlock);

		return genDstOperand(irValue, irFunction);
	}

	private ObjOperand parseGlobalOperand(GlobalVar g, Function irFunction, BasicBlock irBlock) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjGlobalVariable objG = gMap.get(g);

		ObjLabel label = new ObjLabel(objG.getName());
		return label;
	}

	private ObjOperand parseConstFloatOperand(int immediate, int canImm, Function irFunction, BasicBlock irBlock) {
		ObjBlock objBlock = bMap.get(irBlock);
		ObjGlobalVariable objGlobalVariable = new ObjGlobalVariable(immediate);
		objModule.addGlobalVariable(objGlobalVariable);
		ObjLabel label = new ObjLabel(objGlobalVariable.getName());
		return label;
	}

	private ObjOperand parseConstIntOperand(int immediate, int canImm, Function irFunction, BasicBlock irBlock) {
		ObjImm imm = new ObjImm(immediate);
		ObjImm12 imm12 = new ObjImm12(immediate);
		if (canImm == 32)
			return imm;
		else if (canImm == 12 && (immediate >= -2048 && immediate <= 2047))
			return imm12;
		else {
			ObjBlock objBlock = bMap.get(irBlock);
			ObjFunction objFunction = fMap.get(irFunction);
			ObjVirReg dst = new ObjVirReg();
			objFunction.addUsedVirReg(dst);
			ObjMove objMove = new ObjMove(dst, imm);
			objBlock.addInstr(objMove);
			return dst;
		}
	}
}
