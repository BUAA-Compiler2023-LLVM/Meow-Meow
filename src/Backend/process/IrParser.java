package Backend.process;

import Backend.component.ObjBlock;
import Backend.component.ObjFunction;
import Backend.component.ObjGlobalVariable;
import Backend.component.ObjModule;
import Backend.instruction.ObjMove;
import Backend.instruction.ObjRet;
import Backend.operand.*;
import IR.IRModule;
import IR.Value.*;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.RetInst;
import Utils.DataStruct.IList;

import java.util.HashMap;

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
    }
    private void parseBlock(BasicBlock b, Function f) {
        for(IList.INode<Instruction, BasicBlock> inst : b.getInsts()) {
            Instruction irInst = inst.getValue();
            parseInstruction(irInst, b, f);
        }
    }
    private void parseInstruction(Instruction irInst, BasicBlock irBlock, Function irFunction) {
        if(irInst instanceof RetInst)
            parseRet((RetInst) irInst, irBlock, irFunction);
    }

    private void parseRet(RetInst inst, BasicBlock irBlock, Function irFunction) {
        ObjBlock objBlock = bMap.get(irBlock);
        ObjFunction objFunction = fMap.get(irFunction);
        Value irRetValue = inst.getValue();
        if(irRetValue != null) {
            ObjOperand objRet = parseOperand(irRetValue, 32, irFunction, irBlock);
            ObjMove objMove = new ObjMove(ObjPhyReg.A0, objRet);
            objBlock.addInstr(objMove);
            objBlock.addInstr(new ObjRet());
        }
    }

    private ObjOperand parseOperand(Value irValue, int canImm, Function irFunction, BasicBlock irBlock) {
        if(irValue instanceof ConstInteger)
            return parseConstIntOperand(((ConstInteger) irValue).getValue(), canImm, irFunction, irBlock);
        return null;
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
