package IR.Type;

public class IntegerType extends Type{

    private IntegerType(){
    }

    public static IntegerType I32 = new IntegerType();

    @Override
    public boolean isIntegerTy(){
        return true;
    }


    @Override
    public String toString(){
        return "i32";
    }
}
