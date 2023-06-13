package Backend.operand;

public abstract class ObjOperand {
    public boolean isPrecolored() { return false; }
    public boolean needsColor() { return false; }
    public boolean isAllocated() { return false; }
}
