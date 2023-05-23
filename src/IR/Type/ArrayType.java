package IR.Type;

public class ArrayType extends Type{
    int num;

    Type eleType;

    public ArrayType(int num, Type eleType){
        this.num = num;
        this.eleType = eleType;
    }

    @Override
    public boolean isArrayType() {
        return true;
    }

    public int getDim(){
        if(eleType.isArrayType()){
            return ((ArrayType) eleType).getDim() + 1;
        }
        else return 1;
    }

    public Type getEleType(){
        return eleType;
    }

    public int getTotalSize(){
        if(eleType.isArrayType()){
            return ((ArrayType) eleType).getTotalSize() * num;
        }
        else return num;
    }

    @Override
    public String toString(){
        return "[" + num + " x " + eleType + "]";
    }
}
