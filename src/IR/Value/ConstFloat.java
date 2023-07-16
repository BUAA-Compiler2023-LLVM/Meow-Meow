package IR.Value;

import IR.Type.FloatType;
import IR.Type.IntegerType;

public class ConstFloat extends Const {
    private final float value;
    public static ConstFloat const0 = new ConstFloat(0.0F);

    public ConstFloat(float value) {
        super(String.format("0x%x", Double.doubleToRawLongBits(value)), FloatType.F32);
        this.value = value;
    }

    public float getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "float " + this.value;
    }
}
