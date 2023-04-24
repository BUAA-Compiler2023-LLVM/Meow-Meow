package IR.Value;

import IR.Type.IntegerType;

public class ConstFloat extends Const {
    private final double value;
    public static ConstFloat const0 = new ConstFloat(0.0);

    public ConstFloat(double value) {
        super(String.valueOf(value), IntegerType.I32);
        this.value = value;
    }

    public double getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "float i32 " + this.value;
    }
}
