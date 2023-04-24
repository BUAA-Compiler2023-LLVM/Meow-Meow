package IR.Value.Instructions;

import IR.IRBuildFactory;
import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.User;
import IR.Value.Value;
import Utils.DataStruct.IList;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

public abstract class Instruction extends User {
    private final BasicBlock parentbb;
    private BasicBlock earliestBb;
    private BasicBlock latestBb;
    private OP op;

    private final IList.INode<Instruction, BasicBlock> node;

    public Instruction(String name, Type type, OP op, BasicBlock basicBlock) {
        super(name, type);
        this.op = op;
        this.parentbb = basicBlock;
        this.node = new IList.INode<>(this);
    }

    public IList.INode<Instruction, BasicBlock> getNode(){
        return node;
    }



    public ArrayList<Value> getUseValues(){
        return getOperands();
    }

    public OP getOp() {
        return op;
    }

    public void setOp(OP op){
        this.op = op;
    }

    public BasicBlock getParentbb() {
        return node.getParent().getValue();
    }

    public String getInstString(){
        return "";
    }

    //  将inst插入在this的前面
    public void insertBefore(Instruction inst){
        node.insertBefore(inst.getNode());
    }

    public void insertAfter(Instruction inst){
        node.insertAfter(inst.getNode());
    }

    public void insertToHead(BasicBlock bb){
        node.insertListHead(bb.getInsts());
    }
}
