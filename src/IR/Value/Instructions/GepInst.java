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
        ArrayType arrayType = (ArrayType) pointerType.getEleType();
        sb.append(arrayType).append(", ");
        sb.append(pointerType).append(" ");
        sb.append(target.getName());

        ArrayList<Value> indexs = getIndexs();
        for(Value index : indexs){
            sb.append(", i32 ").append(index.getName());
        }
        return sb.toString();
    }
}
