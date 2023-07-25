package IR.Value;

import IR.Type.IntegerType;
import IR.Type.Type;

public class ConstInteger extends Const {
    private final int value;
    public static ConstInteger const0_32 = new ConstInteger(0, IntegerType.I32);
    public static ConstInteger const0_1 = new ConstInteger(0, IntegerType.I1);

    public ConstInteger(int value, Type type) {
        super(String.valueOf(value), type);
        this.value = value;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ConstInteger that = (ConstInteger) o;
        return value == that.value;
    }

    public int getValue() {
        return value;
    }

}
