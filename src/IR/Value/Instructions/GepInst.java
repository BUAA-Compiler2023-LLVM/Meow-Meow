package IR.Value.Instructions;

import IR.Type.ArrayType;
import IR.Type.PointerType;
import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.Value;

import java.util.ArrayList;

public class GepInst extends Instruction{
    public GepInst(Value target, ArrayList<Value> indexs, Type type, BasicBlock basicBlock) {
        super("%" + (++Value.valNumber), type, OP.GEP, basicBlock);
        this.addOperand(target);
        for(Value index : indexs){
            this.addOperand(index);
        }
    }

    public Value getTarget() {
        return getOperand(0);
    }

    public ArrayList<Value> getIndexs() {
        ArrayList<Value> indexs = new ArrayList<>();
        for(int i = 1; i < getOperands().size(); i++){
            indexs.add(getOperand(i));
        }
        return indexs;
    }

    @Override
    public String getInstString(){
        StringBuilder sb = new StringBuilder();
        sb.append(getName()).append(" = getelementptr ");
        Value target = getTarget();
        PointerType pointerType = (PointerType) target.getType();
        sb.append(pointerType.getEleType()).append(", ");
        sb.append(pointerType).append(" ");
        sb.append(target.getName());

        ArrayList<Value> indexs = getIndexs();
        for(Value index : indexs){
            sb.append(", i32 ").append(index.getName());
        }
        return sb.toString();
    }
    @Override
    public String getInstString1(){
        StringBuilder sb = new StringBuilder();
        if(reg!=null)
        sb.append(reg.toString()).append(" = getelementptr ");
        else
            sb.append(getName()).append(" = getelementptr ");
        Value target = getTarget();
        PointerType pointerType = (PointerType) target.getType();
        sb.append(pointerType.getEleType()).append(", ");
        sb.append(pointerType).append(" ");
        if(target.reg!=null)
        sb.append(target.reg.toString());
else sb.append(target.getName());
        ArrayList<Value> indexs = getIndexs();
        for(Value index : indexs){
            if(index.reg!=null)
            sb.append(", i32 ").append(index.reg.toString());
            else sb.append(", i32 ").append(index.getName());
        }
        return sb.toString();
    }
}
