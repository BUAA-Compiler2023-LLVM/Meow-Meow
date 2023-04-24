package IR.Value;

import IR.Type.IntegerType;

public class ConstInteger extends Const {
    private final int value;
    public static ConstInteger const0 = new ConstInteger(0);

    public ConstInteger(int value) {
        super(String.valueOf(value), IntegerType.I32);
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "i32 " + this.value;
    }
}
