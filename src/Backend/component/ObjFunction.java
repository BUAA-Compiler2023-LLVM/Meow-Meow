package Backend.component;

import Backend.operand.ObjVirReg;
import IR.Value.Function;
import Utils.DataStruct.IList;

import java.util.HashSet;

public class ObjFunction {
    private String name;
    private boolean isBuiltin;
    private IList<ObjBlock, ObjFunction> objBlocks;
    private HashSet<ObjVirReg> usedVirRegs;
    public ObjFunction(String name, boolean isBuiltin) {
        this.name = name.substring(1);
        this.isBuiltin = isBuiltin;
        objBlocks = new IList<>(this);
        usedVirRegs = new HashSet<>();
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
    public void print() {
        System.out.println(name + ":");
        for(IList.INode<ObjBlock, ObjFunction> b : objBlocks)
            b.getValue().print();
    }
}
