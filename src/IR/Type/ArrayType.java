package IR.Type;

public class ArrayType extends Type{
    int dim;

    Type eleType;

    @Override
    public boolean isArrayType() {
        return true;
    }
}
