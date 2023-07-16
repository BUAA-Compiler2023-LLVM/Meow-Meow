package Backend.instruction;

import Backend.operand.ObjImm;
import Backend.operand.ObjImm12;
import Backend.operand.ObjOperand;

public class ObjBinary extends ObjInstr {
    private String type;
    private ObjOperand dst, src1, src2;
    public ObjBinary(String type, ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        this.type = type;
        setDst(dst);
        setSrc1(src1);
        setSrc2(src2);
    }
    public void setDst(ObjOperand dst) {
        addDefReg(this.dst, dst);
        this.dst = dst;
    }
    public void setSrc1(ObjOperand src1) {
        addUseReg(this.src1, src1);
        this.src1 = src1;
    }
    public void setSrc2(ObjOperand src2) {
        addUseReg(this.src2, src2);
        this.src2 = src2;
    }
    public String getType() { return type; }
    public ObjOperand getDst() { return dst; }
    public ObjOperand getSrc1() { return src1; }
    public ObjOperand getSrc2() { return src2; }
    public boolean isSrc2Imm() { return src2 instanceof ObjImm; }
    public boolean isSrc2Imm12() { return src2 instanceof ObjImm12; }

    @Override
    public void replaceReg(ObjOperand oldReg, ObjOperand newReg) {
        if (dst.equals(oldReg))
            setDst(newReg);
        if (src1.equals(oldReg))
            setSrc1(newReg);
        if (src2.equals(oldReg))
            setSrc2(newReg);
    }
    @Override
    public void replaceUseReg(ObjOperand oldReg, ObjOperand newReg) {
        if (src1.equals(oldReg))
            setSrc1(newReg);
        if (src2.equals(oldReg))
            setSrc2(newReg);
    }

    public static ObjBinary getAdd(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("add", dst, src1, src2);
    }
    public static ObjBinary getAddi(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("addi", dst, src1, src2);
    }
    public static ObjBinary getSub(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("sub", dst, src1, src2);
    }
    public static ObjBinary getSlt(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("slt", dst, src1, src2);
    }
    public static ObjBinary getSlti(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("slti", dst, src1, src2);
    }
    public static ObjBinary getSltu(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("sltu", dst, src1, src2);
    }
    public static ObjBinary getSgt(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("sgt", dst, src1, src2);
    }
//    public static ObjBinary getSeqz(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
//        return new ObjBinary("seqz", dst, src1, src2);
//    }
//    public static ObjBinary getSnez(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
//        return new ObjBinary("snez", dst, src1, src2);
//    }
    public static ObjBinary getXor(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("xor", dst, src1, src2);
    }
    public static ObjBinary getXori(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("xori", dst, src1, src2);
    }
    public static ObjBinary getOr(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("or", dst, src1, src2);
    }
    public static ObjBinary getOri(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("ori", dst, src1, src2);
    }
    public static ObjBinary getAnd(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("and", dst, src1, src2);
    }
    public static ObjBinary getAndi(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("andi", dst, src1, src2);
    }
    public static ObjBinary getSll(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("sll", dst, src1, src2);
    }
    public static ObjBinary getSrl(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("srl", dst, src1, src2);
    }
    public static ObjBinary getSra(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("sra", dst, src1, src2);
    }
    public static ObjBinary getMul(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("mul", dst, src1, src2);
    }
    public static ObjBinary getDiv(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("div", dst, src1, src2);
    }
    public static ObjBinary getRem(ObjOperand dst, ObjOperand src1, ObjOperand src2) {
        return new ObjBinary("rem", dst, src1, src2);
    }

    @Override
    public String toString() {
        String s = " " + type;
        if (isSrc2Imm12())
            if(type.equals("add") || type.equals("xor") || type.equals("or") || type.equals("and"))
                s = type + "i";
        s += "\t" + dst + ",\t" + src1 + ",\t" + src2;
        return s;
    }
}
