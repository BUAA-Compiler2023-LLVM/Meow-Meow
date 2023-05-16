package IR.Value;

import IR.Type.PointerType;
import IR.Type.Type;

import java.util.ArrayList;

public class GlobalVar extends Value{
    private Value value;
    //  代表全局数组的初始值
    private ArrayList<Value> values;

    public GlobalVar(String name, Type type, Value value){
        super(name, type);
        //  这个Value是他的初始值
        this.value = value;
    }


    public Value getValue() {
        return value;
    }

    public ArrayList<Value> getValues() {
        return values;
    }

    @Override
    public String toString(){
        return getName() + " = global " + getValue();
    }
}
