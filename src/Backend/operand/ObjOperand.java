package Backend.operand;

public abstract class ObjOperand {
    boolean needsColor = true;
    public boolean isPrecolored() { return false; }
    public boolean needsColor() {
        return needsColor;
    }
    public void notNeedsColor() {
        needsColor = false;
    }
    public boolean isAllocated() { return false; }
}
