package IR.Value;

import IR.Type.Type;
import IR.Use;

import java.util.ArrayList;

public class User extends Value{
    protected ArrayList<Value> operands;

    public User(String name, Type type){
        super(name, type);
        this.operands = new ArrayList<>();
    }

    public void addOperand(Value operand){
        operands.add(operand);
        if (operand != null) {
            operand.addUse(new Use(operand, this, operands.size() - 1));
        }
    }

    public ArrayList<Value> getOperands() {
        return operands;
    }

    public Value getOperand(int pos){
        return operands.get(pos);
    }

    public void setOperand(int pos, Value operand){
        if (pos >= operands.size()) {
            return;
        }

        this.operands.set(pos, operand);
        if (operand != null) {
            operand.addUse(new Use(operand, this, pos));
        }
    }


    // 把this的所有operands对应的value删除
    public void removeUseFromOperands() {
        if (operands == null) {
            return;
        }
        for (Value operand : operands) {
            if (operand != null) {
                operand.removeUseByUser(this);
            }
        }
    }

    // 把 operands 中的操作数替换成 value， 并更新 def-use 关系
    public void replaceOperand(int index, Value value) {
        Value operand = operands.get(index);
        setOperand(index, value);
        if (operand != null && !operands.contains(value)) {
            operand.removeUseByUser(this);
        }
    }
}
