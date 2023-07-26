package Backend.operand;

public abstract class ObjOperand {
    boolean needsColor = false;
    public boolean isPrecolored() { return false; }
    public boolean needsColor() {
        return needsColor;
    }
    public void setNeedsColor() {
        needsColor = true;
    }
    public boolean isAllocated() { return false; }
}
