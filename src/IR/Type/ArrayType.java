package IR.Type;

public class ArrayType extends Type{
    int dim;

    Type eleType;

    public ArrayType(int dim, Type eleType){
        this.dim = dim;
        this.eleType = eleType;
    }

    @Override
    public boolean isArrayType() {
        return true;
    }

    @Override
    public String toString(){
        return "[" + dim + " x " + eleType + "]";
    }
}
