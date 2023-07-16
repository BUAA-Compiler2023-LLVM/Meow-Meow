package IR.Value;

import IR.Type.VoidType;
import IR.Value.Instructions.BrInst;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.RetInst;
import Utils.DataStruct.IList;
import org.w3c.dom.Node;

import java.util.ArrayList;

public class BasicBlock extends Value{
    private Function parentFunc;
    private final ArrayList<BasicBlock> preBlocks;
    private final ArrayList<BasicBlock> nxtBlocks;
    private final IList<Instruction, BasicBlock> insts;
    public static int blockNum = 0;
    private final IList.INode<BasicBlock, Function> node;
    private ArrayList<BasicBlock> idoms;
    private ArrayList<BasicBlock> pidoms;
    private BasicBlock idominator;
    private BasicBlock pidominator;
    private int domLV;

    public BasicBlock(){
        super("block" + ++blockNum, VoidType.voidType);
        this.insts = new IList<>(this);
        this.preBlocks = new ArrayList<>();
        this.nxtBlocks = new ArrayList<>();
        this.node = new IList.INode<>(this);
    }

    public BasicBlock(Function function){
        super("block" + ++blockNum, VoidType.voidType);
        this.insts = new IList<>(this);
        this.parentFunc = function;
        this.preBlocks = new ArrayList<>();
        this.nxtBlocks = new ArrayList<>();
        this.node = new IList.INode<>(this);
    }

    public IList.INode<BasicBlock, Function> getNode(){
        return node;
    }


    public void addInst(Instruction inst){
        inst.getNode().insertListEnd(insts);
    }

    public void addInstToHead(Instruction inst){
        inst.getNode().insertListHead(insts);
    }

    public IList<Instruction, BasicBlock> getInsts() {
        return insts;
    }

    public ArrayList<BasicBlock> getPreBlocks() {
        return preBlocks;
    }

    public ArrayList<BasicBlock> getNxtBlocks() {
        return nxtBlocks;
    }

    public void setPreBlock(BasicBlock bb){
        if(!preBlocks.contains(bb)) {
            preBlocks.add(bb);
        }
    }
    public void setNxtBlock(BasicBlock bb){
        if(!nxtBlocks.contains(bb)) {
            nxtBlocks.add(bb);
        }
    }

    public Instruction getLastInst(){
        return insts.getTailValue();
    }

    public void setIdoms(ArrayList<BasicBlock> idoms){
        this.idoms = idoms;
    }
    public void setPIdoms(ArrayList<BasicBlock> pidoms){
        this.pidoms = pidoms;
    }

    public void setDomLV(int domLV){
        this.domLV = domLV;
    }

    public void setIdominator(BasicBlock idominator){
        this.idominator = idominator;
    }
    public void setPIdominator(BasicBlock pidominator){
        this.pidominator = pidominator;
    }

    public BasicBlock getIdominator(){
        return idominator;
    }
    public BasicBlock getPIdominator(){
        return pidominator;
    }
    public ArrayList<BasicBlock> getIdoms(){
        return idoms;
    }

    public ArrayList<BasicBlock> getPIdoms(){
        return pidoms;
    }

    public void removeSelf(){
        //  删除前驱后继关系
        for(BasicBlock preBb : preBlocks){
            preBb.getNxtBlocks().remove(this);
        }
        for(BasicBlock nxtBb : nxtBlocks){
            nxtBb.getPreBlocks().remove(this);
        }
        node.removeFromList();
    }

    public Function getParentFunc() {
        return node.getParent().getValue();
    }


    @Override
    public String toString(){
        return this.getName();
    }

    public void insertBefore(BasicBlock bb){
        node.insertBefore(bb.getNode());
    }

    public void insertAfter(BasicBlock bb){
        node.insertAfter(bb.getNode());
    }
}
