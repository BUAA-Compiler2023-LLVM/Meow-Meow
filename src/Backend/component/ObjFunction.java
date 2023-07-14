package Backend.component;

import Backend.operand.ObjImm;
import Backend.operand.ObjVirReg;
import IR.Value.BasicBlock;
import IR.Value.Function;
import Utils.DataStruct.IList;

import java.util.HashSet;
import java.util.TreeSet;

public class ObjFunction {
    private String name;
    private boolean isBuiltin;
    private IList<ObjBlock, ObjFunction> objBlocks;
    private HashSet<ObjVirReg> usedVirRegs;

    private int allocaSize;
    private int Rsize, argsSize;

    private TreeSet<Integer> calleeSavedRegIndexes = new TreeSet<>();
    private HashSet<ObjBlock> hasSerial = new HashSet<>();
    private HashSet<ObjImm> argOffsets = new HashSet<>();

    public ObjFunction(String name, boolean isBuiltin) {
        this.name = name.substring(1);
        this.isBuiltin = isBuiltin;
        objBlocks = new IList<>(this);
        usedVirRegs = new HashSet<>();

        this.allocaSize = 0;
        this.Rsize = 0;
        this.argsSize = 0;
    }

    public IList<ObjBlock, ObjFunction> getObjBlocks() {
        return objBlocks;
    }

    public String getName() {
        return name;
    }
    public boolean isBuiltin() {
        return isBuiltin;
    }
    public void addBlocks(ObjBlock block) {
        block.getNode().insertListEnd(objBlocks);
    }
    public void addUsedVirReg(ObjVirReg objVirReg) {
        usedVirRegs.add(objVirReg);
    }
    public HashSet<ObjVirReg> getUsedVirRegs() {
        return usedVirRegs;
    }

    public void addArgOffset(ObjImm objOffset) { argOffsets.add(objOffset); }
    // public int getTotalStackSize() { return totalStackSize; }
    public void addAllocaSize(int size) {
        allocaSize += size;
    }
    public int getAllocaSize() { return allocaSize; }
    public void setRsize() { Rsize = 4; }
    public int getRsize() { return Rsize; }
    public void setArgsSize(int size) {
        if(size > argsSize)
            argsSize = size;
    }
    public int getArgsSize() { return argsSize; }
    public int getStackSize() {
        return Rsize + argsSize + allocaSize;
    }

    public void print() {
        System.out.println(name + ":");
        for(IList.INode<ObjBlock, ObjFunction> b : objBlocks)
            b.getValue().print();
    }

    public ObjBlock getFirstBlock() {
        return objBlocks.getHead().getValue();
    }
}
