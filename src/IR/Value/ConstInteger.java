package IR.Value;

import IR.Type.IntegerType;

public class ConstInteger extends Const {
    private final int value;
    public static ConstInteger const0_32 = new ConstInteger(0, 32);
    public static ConstInteger const0_1 = new ConstInteger(0, 1);

    public ConstInteger(int value, int bit) {
        super(String.valueOf(value), IntegerType.I1);
        this.value = value;
        if(bit == 32) {
            this.setType(IntegerType.I32);
        }
    }

    public int getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "i32 " + this.value;
    }
}
