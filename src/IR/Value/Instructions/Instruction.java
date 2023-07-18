package IR.Value.Instructions;

import IR.IRBuildFactory;
import IR.Type.Type;
import IR.Value.*;
import Utils.DataStruct.IList;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

public abstract class Instruction extends User {
    private OP op;

    private final IList.INode<Instruction, BasicBlock> node;

    public Instruction(String name, Type type, OP op) {
        super(name, type);
        this.op = op;
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

    public Instruction copySelf(HashMap<Value, Value> replaceMap){
        IRBuildFactory f = IRBuildFactory.getInstance();
        Instruction copyInst = null;
        BasicBlock fatherBb = (BasicBlock) replaceMap.get(this.getParentbb());
        if(this.getOp() == OP.Alloca){
            AllocInst allocInst = (AllocInst) this;
            copyInst = f.buildAllocInst(allocInst.getAllocType(), fatherBb);
        }
        else if(this.getOp() == OP.Load){
            LoadInst loadInst = (LoadInst) this;
            copyInst = f.buildLoadInst(findValue(replaceMap, loadInst.getPointer()), fatherBb);
        }
        else if(this.getOp() == OP.Store){
            StoreInst storeInst = (StoreInst) this;
            Value value = findValue(replaceMap, storeInst.getValue());
            Value pointer = findValue(replaceMap, storeInst.getPointer());
            copyInst = f.buildStoreInst(value, pointer, fatherBb);
        }
        else if(this.getOp() == OP.GEP){
            ArrayList<Value> values = new ArrayList<>();
            for (int i = 1; i < this.getOperands().size(); i++) {
                values.add(findValue(replaceMap, getOperands().get(i)));
            }
            Value target = findValue(replaceMap, ((GepInst) this).getTarget());
            copyInst = f.buildGepInst(target, values, fatherBb);
        }
        //  由于我们还没完全建立所有的基本块，无法确定preBlocks的顺序
        //  所以我们在其他value都建完之后再进行phi的赋值
        //  这里只要先建个phi占位即可
        else if(this.getOp() == OP.Phi){
            int length = this.getOperands().size();
            ArrayList<Value> copyValues = new ArrayList<>(Collections.nCopies(length, ConstInteger.const0_32));
            copyInst = f.buildPhi(fatherBb, this.getType(), copyValues);
        }
        else if(this instanceof BrInst brInst){
            if(!brInst.isJump()){
                Value judVal = findValue(replaceMap, brInst.getJudVal());
                BasicBlock left = (BasicBlock) findValue(replaceMap, brInst.getTrueBlock());
                BasicBlock right = (BasicBlock) findValue(replaceMap, brInst.getFalseBlock());
                copyInst = f.buildBrInst(judVal, left, right, fatherBb);
            }
            else{
                BasicBlock jumpBb = (BasicBlock) findValue(replaceMap, brInst.getJumpBlock());
                copyInst = f.buildBrInst(jumpBb, fatherBb);
            }
        }
        else if(this instanceof RetInst retInst){
            if (!retInst.isVoid()) {
                Value retVal = findValue(replaceMap, retInst.getValue());
                copyInst = f.buildRetInst(retVal, fatherBb);
            }
            else {
                copyInst = f.buildRetInst(fatherBb);
            }
        }
        else if(this instanceof CallInst callInst){
            ArrayList<Value> args = new ArrayList<>();
            for (int i = 1; i < getOperands().size(); i++) {
                args.add(findValue(replaceMap, getOperands().get(i)));
            }

            copyInst = f.buildCallInst(callInst.getFunction(), args, fatherBb);
        }
        else if(this instanceof BinaryInst){
            OP op = this.getOp();
            Value left = findValue(replaceMap, ((BinaryInst) this).getLeftVal());
            Value right = findValue(replaceMap, ((BinaryInst) this).getRightVal());
            copyInst = f.buildBinaryInst(left, right, op, fatherBb);
        }
        else if(this instanceof ConversionInst conversionInst){
            Value src = findValue(replaceMap, conversionInst.getValue());
            copyInst = f.buildConversionInst(src, conversionInst.getOp(), fatherBb);
        }
        return copyInst;
    }

    private Value findValue(HashMap<Value, Value> replaceMap, Value value) {
        if (value instanceof ConstInteger || value instanceof ConstFloat) {
            return value;
        }
        else {
            if(replaceMap.get(value) == null){
                System.out.println("error: findValue error!");
            }
            return replaceMap.get(value);
        }
    }

    public String getInstString(){
        return "";
    }
    public String getInstString1(){
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

    public boolean hasName(){
        return true;
    }

    public void removeSelf(){
        removeUseFromOperands();
        node.removeFromList();
    }

    //  与removeSelf的区别在于这个并不会删除def-use关系
    public void removeFromBb(){
        node.removeFromList();
    }
}
