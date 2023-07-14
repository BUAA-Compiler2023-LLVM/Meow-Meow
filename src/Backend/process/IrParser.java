package Backend.process;

import Backend.component.ObjBlock;
import Backend.component.ObjFunction;
import Backend.component.ObjGlobalVariable;
import Backend.component.ObjModule;
import Backend.instruction.*;
import Backend.operand.*;
import IR.IRModule;
import IR.Type.PointerType;
import IR.Type.Type;
import IR.Value.*;
import IR.Value.Instructions.*;
import Utils.DataStruct.IList;

import java.util.HashMap;
import java.util.Optional;

import static Backend.operand.ObjPhyReg.ZERO;

public class IrParser {
    private IRModule irModule;
    private ObjModule objModule;
    private HashMap<Function, ObjFunction> fMap;
    private HashMap<BasicBlock, ObjBlock> bMap;
    private HashMap<Value, ObjOperand> operandMap;

    public IrParser(IRModule irModule) {
        this.irModule = irModule;
        objModule = new ObjModule();
        fMap = new HashMap<>();
        bMap = new HashMap<>();
        operandMap = new HashMap<>();
    }

    public ObjModule parseModule() {
        parseGlobalVariables();
        parseFunctions();
        return objModule;
    }
    private void parseGlobalVariables() {
        for(GlobalVar g : irModule.getGlobalVars()) {
            ObjGlobalVariable objGlobalVariable = parseGlobalVariable(g);
            objModule.addGlobalVariable(objGlobalVariable);
        }
    }
    private ObjGlobalVariable parseGlobalVariable(GlobalVar g) {
        ObjGlobalVariable objGlobalVariable = new ObjGlobalVariable();
        return objGlobalVariable;
    }

    private void iMap() {
        for(Function f : irModule.getFunctions()) {
            ObjFunction objFunction = new ObjFunction(f.getName(), f.isLibFunction());
            objModule.addFunction(objFunction);
            fMap.put(f, objFunction);

            for(IList.INode<BasicBlock, Function> b : f.getBbs()) {
                BasicBlock irBlock = b.getValue();
                ObjBlock objBlock = new ObjBlock(irBlock.getName());
                bMap.put(irBlock, objBlock);

                objFunction.addBlocks(objBlock);
            }
        }
    }
    private void parseFunctions() {
        iMap();
        for(Function f : irModule.getFunctions())
            if(! f.isLibFunction())
                parseFunction(f);
    }
    private void parseFunction(Function f) {
        for(IList.INode<BasicBlock, Function> b : f.getBbs()) {
            BasicBlock irBlock = b.getValue();
            parseBlock(irBlock, f);
        }
        BasicBlock b = f.getBbs().getHead().getValue();
        ObjFunction objF = fMap.get(f);
        ObjOperand alloc = parseConstIntOperand(-objF.getAllocaSize(), 12, f, b);
        ObjBinary add = ObjBinary.getAdd(ObjPhyReg.SP, ObjPhyReg.SP, alloc);

        objF.getFirstBlock().addInstrHead(add);
    }
    private void parseBlock(BasicBlock b, Function f) {
        for(IList.INode<Instruction, BasicBlock> inst : b.getInsts()) {
            Instruction irInst = inst.getValue();
            parseInstruction(irInst, b, f);
        }
    }
    private void parseInstruction(Instruction irInst, BasicBlock irBlock, Function irFunction) {
        // System.out.println(irInst instanceof  CmpInst);
        if(irInst instanceof RetInst)
            parseRet((RetInst) irInst, irBlock, irFunction);
        else if(irInst instanceof AllocInst)
            parseAlloca((AllocInst) irInst, irBlock, irFunction);
        else if(irInst instanceof LoadInst)
            parseLoad((LoadInst) irInst, irBlock, irFunction);
        else if(irInst instanceof StoreInst)
            parseStore((StoreInst) irInst, irBlock, irFunction);
        else if(irInst instanceof  CmpInst)
            parseIcmp((CmpInst) irInst, irBlock, irFunction);
        else if(irInst instanceof BinaryInst) {
            if(irInst.getOp() == OP.Add)
                parseAdd((BinaryInst) irInst, irBlock, irFunction);
        }
        else if(irInst instanceof BrInst)
            parseBr((BrInst) irInst, irBlock, irFunction);
    }

    private void parseIcmp(CmpInst inst, BasicBlock irBlock, Function irFunction) {
        OP op = inst.getOp();
        ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);
        Value left = inst.getLeftVal(), right = inst.getRightVal();
        ObjBlock objBlock = bMap.get(irBlock);
        ObjFunction objFunction = fMap.get(irFunction);

        // ne eq lt le gt ge
        if(op == OP.Ne) {
            ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
            ObjOperand objRight = parseOperand(right, 12, irFunction, irBlock);
            ObjVirReg tmpReg = new ObjVirReg();
            objFunction.addUsedVirReg(tmpReg);

            ObjBinary objBinary;
            if(objRight instanceof ObjImm12)
                objBinary = ObjBinary.getXori(tmpReg, objLeft, objRight);
            else
                objBinary = ObjBinary.getXor(tmpReg, objLeft, objRight);
            objBlock.addInstr(objBinary);

            ObjBinary objBinary2 = ObjBinary.getSltu(dst, ZERO, tmpReg);
            objBlock.addInstr(objBinary2);
        }
        else if(op == OP.Eq) { // ( a xor b == 0 )
            ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
            ObjOperand objRight = parseOperand(right, 12, irFunction, irBlock);
            ObjVirReg tmpReg = new ObjVirReg();
            objFunction.addUsedVirReg(tmpReg);

            ObjBinary objBinary;
            if(objRight instanceof ObjImm12)
                objBinary = ObjBinary.getXori(tmpReg, objLeft, objRight);
            else
                objBinary = ObjBinary.getXor(tmpReg, objLeft, objRight);
            objBlock.addInstr(objBinary);

            ObjVirReg tmpReg2 = new ObjVirReg();
            objFunction.addUsedVirReg(tmpReg2);
            ObjBinary objBinary2 = ObjBinary.getSltu(tmpReg2, ZERO, tmpReg);
            objBlock.addInstr(objBinary2);

            ObjBinary objBinary3 = ObjBinary.getXori(dst, tmpReg2, new ObjImm12(1));
            objBlock.addInstr(objBinary3);
        }
        else if(op == OP.Lt) {
            ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
            ObjOperand objRight = parseOperand(right, 12, irFunction, irBlock);

            ObjBinary objBinary;
            if(objRight instanceof ObjImm12)
                objBinary = ObjBinary.getSlti(dst, objLeft, objRight);
            else
                objBinary = ObjBinary.getSlt(dst, objLeft, objRight);
            objBlock.addInstr(objBinary);
        }
        else if(op == OP.Le) { // left <= Right    !( Right < left )
            ObjOperand objLeft = parseOperand(left, 12, irFunction, irBlock);
            ObjOperand objRight = parseOperand(right, 0, irFunction, irBlock);
            ObjVirReg tmpReg = new ObjVirReg();
            objFunction.addUsedVirReg(tmpReg);

            ObjBinary objBinary;
            if(objLeft instanceof ObjImm12)
                objBinary = ObjBinary.getSlti(tmpReg, objRight, objLeft);
            else
                objBinary = ObjBinary.getSlt(tmpReg, objRight, objLeft);
            objBlock.addInstr(objBinary);

            ObjBinary objBinary2 = ObjBinary.getXori(dst, tmpReg, new ObjImm12(1));
            objBlock.addInstr(objBinary2);
        }
        else if(op == OP.Gt) { // (left > Right)
            ObjOperand objLeft = parseOperand(left, 12, irFunction, irBlock);
            ObjOperand objRight = parseOperand(right, 0, irFunction, irBlock);
            ObjBinary objBinary;
            if(objLeft instanceof ObjImm12)
                objBinary = ObjBinary.getSlti(dst, objRight, objLeft);
            else
                objBinary = ObjBinary.getSlt(dst, objRight, objLeft);
            objBlock.addInstr(objBinary);
        }
        else if(op == OP.Ge) { // left >= Right    ! ( left < Right )
            ObjOperand objLeft = parseOperand(left, 0, irFunction, irBlock);
            ObjOperand objRight = parseOperand(right, 12, irFunction, irBlock);
            ObjVirReg tmpReg = new ObjVirReg();
            objFunction.addUsedVirReg(tmpReg);

            ObjBinary objBinary;
            if(objRight instanceof ObjImm12)
                objBinary = ObjBinary.getSlti(tmpReg, objLeft, objRight);
            else
                objBinary = ObjBinary.getSlt(tmpReg, objLeft, objRight);
            objBlock.addInstr(objBinary);

            ObjBinary objBinary2 = ObjBinary.getXori(dst, tmpReg, new ObjImm12(1));
            objBlock.addInstr(objBinary2);
        }
    }


    private void parseBr(BrInst inst, BasicBlock irBlock, Function irFunction) {
        ObjBlock objBlock = bMap.get(irBlock);

        if(inst.getJudVal() != null) {
            Value irCondition = inst.getJudVal();
            BasicBlock irTrueBlock = inst.getTrueBlock();
            BasicBlock irFalseBlock = inst.getFalseBlock();

            if(irCondition instanceof ConstInteger) {
                int condImm = ((ConstInteger) irCondition).getValue();
                if(condImm != 0) {
                    ObjBranch objBranch = new ObjBranch(bMap.get(irTrueBlock));
                    objBlock.addInstr(objBranch);
                    objBlock.setTrueBlock(bMap.get(irTrueBlock));
                }
                else {
                    ObjBranch objBranch = new ObjBranch(bMap.get(irFalseBlock));
                    objBlock.addInstr(objBranch);
                    objBlock.setTrueBlock(bMap.get(irFalseBlock));
                }
            }
            else if(irCondition instanceof CmpInst){
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
        }
        else {
            ObjBlock objTargetBlock = bMap.get(inst.getJumpBlock());
            ObjBranch objBranch = new ObjBranch(objTargetBlock);
            objBlock.addInstr(objBranch);
            objBlock.setTrueBlock(objTargetBlock);
        }
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
        }
        else if (isOp1Const) {
            src1 = parseOperand(inst.getRightVal(), 0, irFunction, irBlock);
            src2 = parseOperand(inst.getLeftVal(), 12, irFunction, irBlock);
            ObjBinary objAdd = ObjBinary.getAddi(dst, src1, src2);
            objBlock.addInstr(objAdd);
        }
        else {
            src1 = parseOperand(inst.getLeftVal(), 0, irFunction, irBlock);
            src2 = parseOperand(inst.getRightVal(), 12, irFunction, irBlock);
            ObjBinary objAdd = ObjBinary.getAdd(dst, src1, src2);
            objBlock.addInstr(objAdd);
        }
    }

    private void parseStore(StoreInst inst, BasicBlock irBlock, Function irFunction) {
        ObjBlock objBlock = bMap.get(irBlock);

        Value irAddr = inst.getPointer();
        ObjOperand src = parseOperand(inst.getValue(), 0, irFunction, irBlock);

        ObjOperand addr = parseOperand(irAddr, 0, irFunction, irBlock);
        ObjOperand offset = new ObjImm12(0);
        ObjStore objStore = new ObjStore(src, addr, offset);
        objBlock.addInstr(objStore);
    }

    private void parseLoad(LoadInst inst, BasicBlock irBlock, Function irFunction) {
        ObjBlock objBlock = bMap.get(irBlock);

        Value irAddr = inst.getPointer();
        ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);
        ObjOperand addr = parseOperand(irAddr, 0, irFunction, irBlock);
        ObjOperand offset = new ObjImm12(0);
        ObjLoad objLoad = new ObjLoad(dst, addr, offset);
        objBlock.addInstr(objLoad);
    }

    private void parseAlloca(AllocInst inst, BasicBlock irBlock, Function irFunction) {
        ObjBlock objBlock = bMap.get(irBlock);
        ObjFunction objFunction = fMap.get(irFunction);

        Type pointeeType = ((PointerType) inst.getType()).getEleType();
        ObjOperand offset = parseConstIntOperand(objFunction.getAllocaSize(), 12, irFunction, irBlock);
        objFunction.addAllocaSize(4);

        ObjOperand dst = parseOperand(inst, 0, irFunction, irBlock);
        ObjBinary objAdd = ObjBinary.getAdd(dst, ObjPhyReg.SP, offset);
        objBlock.addInstr(objAdd);
    }

    private void parseRet(RetInst inst, BasicBlock irBlock, Function irFunction) {
        ObjBlock objBlock = bMap.get(irBlock);
        ObjFunction objFunction = fMap.get(irFunction);
        Value irRetValue = inst.getValue();
        if(irRetValue != null) {
            ObjOperand objRet = parseOperand(irRetValue, 32, irFunction, irBlock);
            ObjMove objMove = new ObjMove(ObjPhyReg.A0, objRet);
            objBlock.addInstr(objMove);
        }
        objBlock.addInstr(new ObjRet());
    }

    private ObjOperand genTmpReg(Function irFunction) {
        ObjFunction objFunction = fMap.get(irFunction);
        ObjVirReg tmpReg = new ObjVirReg();
        objFunction.addUsedVirReg(tmpReg);
        return tmpReg;
    }

    private ObjOperand genDstOperand(Value irValue, Function irFunction) {
        ObjFunction objFunction = fMap.get(irFunction);
        ObjVirReg dstReg = new ObjVirReg();
        objFunction.addUsedVirReg(dstReg);
        operandMap.put(irValue, dstReg);
        return dstReg;
    }

    private ObjOperand parseOperand(Value irValue, int canImm, Function irFunction, BasicBlock irBlock) {
        if (operandMap.containsKey(irValue)) {
            ObjOperand objOperand = operandMap.get(irValue);
            if(((objOperand instanceof ObjImm) && canImm < 32)
                    || ((objOperand instanceof ObjImm12) && canImm < 12)) {

                if(((ObjImm) objOperand).getImmediate() == 0)
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
        if(irValue instanceof ConstInteger)
            return parseConstIntOperand(((ConstInteger) irValue).getValue(), canImm, irFunction, irBlock);

        return genDstOperand(irValue, irFunction);
    }
    private ObjOperand parseConstIntOperand(int immediate, int canImm, Function irFunction, BasicBlock irBlock) {
        ObjImm imm = new ObjImm(immediate);
        ObjImm12 imm12 = new ObjImm12(immediate);
        if(canImm == 32)
            return imm;
        else if(canImm == 12 && (immediate >= -2048 && immediate <= 2047))
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
