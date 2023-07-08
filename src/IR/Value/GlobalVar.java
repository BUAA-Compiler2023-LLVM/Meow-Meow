package IR.Value;

import IR.Type.ArrayType;
import IR.Type.PointerType;
import IR.Type.Type;

import java.awt.*;
import java.util.ArrayList;

public class GlobalVar extends Value{
    private Value value;
    //  代表全局数组的初始值
    private ArrayList<Value> values;

    //  全局变量
    public GlobalVar(String name, Type type, Value value){
        super(name, type);
        //  这个Value是他的初始值
        this.value = value;
    }

    //  全局数组
    public GlobalVar(String name, Type type, ArrayList<Value> values){
        super(name, type);
        this.values = values;
    }


    public Value getValue() {
        return value;
    }

    public ArrayList<Value> getValues() {
        return values;
    }

    @Override
    public String toString(){
        String prefix = getName() + " = global ";
        PointerType type = (PointerType) getType();
        Type eleType = type.getEleType();
        if(eleType.isArrayType()){
            StringBuilder sb = new StringBuilder();
            sb.append(prefix).append(eleType);
            if(values.size() == 0){
                sb.append(" zeroinitializer");
            }
            else{
                sb.append("[");
                for(int i = 0; i < values.size(); i++){
                    sb.append(values.get(i));
                    if(i != values.size() - 1) sb.append(", ");
                }
                sb.append("]");
            }
            return sb.toString();
        }
        else {
            return prefix + getValue();
        }
    }
}
