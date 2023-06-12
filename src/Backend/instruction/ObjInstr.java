package Backend.instruction;

import Backend.component.ObjBlock;
import Backend.operand.ObjOperand;
import Backend.operand.ObjReg;
import Utils.DataStruct.IList;

import java.util.ArrayList;

public class ObjInstr {

    private IList.INode<ObjInstr, ObjBlock> node;
    private ArrayList<ObjReg> regDef, regUse;
    public ObjInstr() {
        this.node = new IList.INode<>(this);
        regDef = new ArrayList<>();
        regUse = new ArrayList<>();
    }
    public IList.INode<ObjInstr, ObjBlock> getNode() {
        return node;
    }

    private void addUse(ObjOperand reg) {
        if (reg instanceof ObjReg)
            regUse.add((ObjReg) reg);
    }

    private void addDef(ObjOperand reg) {
        if (reg instanceof ObjReg)
            regDef.add((ObjReg) reg);
    }

    private void removeDef(ObjOperand reg) {
        if (reg instanceof ObjReg)
            regDef.remove((ObjReg) reg);
    }

    private void removeUse(ObjOperand reg) {
        if (reg instanceof ObjReg)
            regUse.remove((ObjReg) reg);
    }
    public void addDefReg(ObjOperand oldReg, ObjOperand newReg) {
        if (oldReg != null)
            removeDef(oldReg);
        addDef(newReg);
    }

    public void addUseReg(ObjOperand oldReg, ObjOperand newReg) {
        if (oldReg != null)
            removeUse(oldReg);
        addUse(newReg);
    }
}