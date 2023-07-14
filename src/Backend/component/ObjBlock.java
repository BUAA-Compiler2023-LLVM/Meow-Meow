package Backend.component;

import Backend.instruction.ObjInstr;
import IR.Value.Function;
import Utils.DataStruct.IList;

public class ObjBlock {

    private static int index = 0;
    private String name;
    private IList.INode<ObjBlock, ObjFunction> node;
    private IList<ObjInstr, ObjBlock> instrs;
    private ObjBlock trueBlock = null, falseBlock = null;
    public ObjBlock(String name) {
        this.name = name;
        this.node = new IList.INode<>(this);
        this.instrs = new IList<>(this);
        trueBlock = null;
        falseBlock = null;
    }

    public ObjBlock getTrueBlock() {
        return trueBlock;
    }

    public ObjBlock getFalseBlock() {
        return falseBlock;
    }

    public void setTrueBlock(ObjBlock trueBlock) {
        this.trueBlock = trueBlock;
    }

    public void setFalseBlock(ObjBlock falseBlock) {
        this.falseBlock = falseBlock;
    }

    public IList<ObjInstr, ObjBlock> getInstrs() {
        return instrs;
    }

    public IList.INode<ObjBlock, ObjFunction> getNode(){
        return node;
    }
    public void addInstr(ObjInstr instr) {
        instr.getNode().insertListEnd(instrs);
    }
    public void addInstrHead(ObjInstr instr) {
        instr.getNode().insertListHead(instrs);
    }
    public void print() {
         System.out.println(name + ":");
        for(IList.INode<ObjInstr, ObjBlock> instr : instrs) {
            ObjInstr i = instr.getValue();
            System.out.println("\t" + i.toString());
        }
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
