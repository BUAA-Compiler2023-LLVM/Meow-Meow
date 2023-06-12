package Backend.component;

import Backend.instruction.ObjInstr;
import IR.Value.Function;
import Utils.DataStruct.IList;

public class ObjBlock {

    private static int index = 0;
    private String name;
    private IList.INode<ObjBlock, ObjFunction> node;
    private IList<ObjInstr, ObjBlock> instrs;
    public ObjBlock(String name) {
        this.name = name;
        this.node = new IList.INode<>(this);
        this.instrs = new IList<>(this);
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
        // System.out.println(name + ":");
        for(IList.INode<ObjInstr, ObjBlock> instr : instrs) {
            ObjInstr i = instr.getValue();
            System.out.println(i.toString());
        }
    }
}
