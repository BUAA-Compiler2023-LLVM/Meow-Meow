package Backend.component;

import Backend.instruction.ObjInstr;
import Backend.operand.ObjReg;
import IR.Value.Function;
import IR.Value.Value;
import Utils.DataStruct.IList;

import java.util.ArrayList;

public class ObjBlock {

    private static int index = 0;
    private String name;
    private IList.INode<ObjBlock, ObjFunction> node;
    private IList<ObjInstr, ObjBlock> instrs;
    private ObjBlock trueBlock = null, falseBlock = null;
    public final ArrayList<ObjReg> liveIns=new ArrayList<>();
    public final ArrayList<ObjReg> liveOuts=new ArrayList<>();
    public final ArrayList<ObjReg> Use=new ArrayList<>();
    public final ArrayList<ObjReg> Def=new ArrayList<>();
    public final ArrayList<ArrayList<ObjReg>> LocalInterfere = new ArrayList<>();

    private ArrayList<ObjBlock> preBlocks, nxtBlocks;
    public ObjBlock(String name) {
        this.name = name;
        this.node = new IList.INode<>(this);
        this.instrs = new IList<>(this);
        trueBlock = null;        falseBlock = null;

        preBlocks = new ArrayList<>();
        nxtBlocks = new ArrayList<>();
    }

    public void addPreBlock(ObjBlock objBlock) {
        preBlocks.add(objBlock);
    }
    public void addNxtBlock(ObjBlock objBlock) {
        nxtBlocks.add(objBlock);
    }
    public ArrayList<ObjBlock> getPreBlocks() {
        return preBlocks;
    }
    public ArrayList<ObjBlock> getNxtBlocks() {
        return nxtBlocks;
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
