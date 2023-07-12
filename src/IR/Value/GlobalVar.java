package IR.Value;

import IR.Type.ArrayType;
import IR.Type.IntegerType;
import IR.Type.PointerType;
import IR.Type.Type;

import java.awt.*;
import java.util.ArrayList;

public class GlobalVar extends Value{
    private Value value;
    //  代表全局数组的初始值
    private ArrayList<Value> values;
    //  nowVisit用于递归输出toString
    private int nowVisit;

    //  全局变量
    public GlobalVar(String name, Type type, Value value){
        super(name, type);
        //  这个Value是他的初始值
        this.value = value;
        this.nowVisit = 0;
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

    //  根据维度list将一维的values转换成String输出
    private String initValueString(ArrayType type){
        StringBuilder sb = new StringBuilder();
        sb.append(type);
        sb.append(" ");
        sb.append("[");
        int len = type.getNum();
        if(type.getEleType().isArrayType()){
            for(int i = 0; i < len; i++){
                sb.append(initValueString((ArrayType) type.getEleType()));
                if(i != len - 1) sb.append(", ");
            }
        }
        else{
            for(int i = 0; i < len; i++){
                sb.append(values.get(nowVisit++));
                if(i != len - 1) sb.append(", ");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    public String toInstString(){
        String prefix = getName() + " = global ";
        PointerType type = (PointerType) getType();
        Type eleType = type.getEleType();
        if(eleType.isArrayType()){
            if(values.size() == 0){
                return prefix + eleType + "zeroinitializer";
            }
            else {
                nowVisit = 0;
                return prefix + initValueString((ArrayType) eleType);
            }
        }
        else {
            return prefix + getValue();
        }
    }

}
