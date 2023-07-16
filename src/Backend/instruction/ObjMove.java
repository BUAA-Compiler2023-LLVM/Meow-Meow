package Backend.instruction;

import Backend.operand.ObjImm;
import Backend.operand.ObjImm12;
import Backend.operand.ObjOperand;

public class ObjMove extends ObjInstr{
    private ObjOperand dst, src;
    public ObjMove(ObjOperand dst, ObjOperand src) {
        setDst(dst);
        setSrc(src);
    }
    public void setDst(ObjOperand dst) {
        addDefReg(this.dst, dst);
        this.dst = dst;
    }

    public void setSrc(ObjOperand src) {
        addUseReg(this.src, src);
        this.src = src;
    }
    public ObjOperand getDst() {
        return dst;
    }
    public ObjOperand getSrc() {
        return src;
    }
    @Override
    public String toString() {
        if ((src instanceof ObjImm) || (src instanceof ObjImm12))
            return "  li\t" + dst + ",\t" + src;
        return "move\t" + dst + ",\t" + src;
    }
}
