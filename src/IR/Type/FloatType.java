package IR.Type;

public class FloatType extends Type {
    public FloatType(){
    }

    @Override
    public boolean isFloatTy(){
        return true;
    }

    @Override
    public String toString(){
        return "float i32";
    }
}
