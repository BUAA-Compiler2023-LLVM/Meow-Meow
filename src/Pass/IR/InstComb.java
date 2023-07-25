package Pass.IR;

import IR.IRModule;
import IR.Type.IntegerType;
import IR.Use;
import IR.Value.*;
import IR.Value.Instructions.BinaryInst;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.OP;
import Pass.Pass;
import Utils.DataStruct.IList;

import java.util.ArrayList;

public class InstComb implements Pass.IRPass {


    @Override
    public void run(IRModule module) {
        for(Function function : module.getFunctions()){
            instCombForFunc(function);
        }
    }

    private void instCombForFunc(Function function){
        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();
            IList.INode<Instruction, BasicBlock> itInstNode = bb.getInsts().getHead();
            while (itInstNode != null){
                Instruction inst = itInstNode.getValue();
                itInstNode = itInstNode.getNext();

                if(canCombAdd(inst)){
                    for(Use use : inst.getUseList()) {
                        BinaryInst userInst = (BinaryInst) use.getUser();
                        combAddToUser((BinaryInst) inst, userInst);
                    }
                    inst.removeSelf();
                }
            }
        }
    }

    //  b = a + 1; c = b + 2;
    //  c = a + 3;
    private void combAddToUser(BinaryInst inst, BinaryInst userInst){
        Value leftA = inst.getLeftVal();
        Value rightA = inst.getRightVal();
        Value leftB = userInst.getLeftVal();
        Value rightB = userInst.getRightVal();

        int ConstInA, ConstInB;
        boolean ConstInAIs0 = false, ConstInBIs0 = false;
        boolean isAAdd = inst.getOp() == OP.Add;
        boolean isBAdd = userInst.getOp() == OP.Add;

        if (leftA instanceof ConstInteger) {
            ConstInA = ((ConstInteger) leftA).getValue();
            ConstInAIs0 = true;
        } else {
            ConstInA = ((ConstInteger) rightA).getValue();
        }

        if (leftB instanceof ConstInteger) {
            ConstInB = ((ConstInteger) leftB).getValue();
            ConstInBIs0 = true;
        } else {
            ConstInB = ((ConstInteger) rightB).getValue();
        }
        if (ConstInAIs0 && ConstInBIs0 && isAAdd && isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInA + ConstInB, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, rightA);
        }
        else if (ConstInAIs0 && ConstInBIs0 && isAAdd && !isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInB - ConstInA, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, rightA);
        }
        else if (ConstInAIs0 && ConstInBIs0 && !isAAdd && isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInB + ConstInA, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, rightA);
            userInst.setOp(OP.Sub);
        }
        else if (ConstInAIs0 && ConstInBIs0 && !isAAdd && !isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInB - ConstInA, IntegerType.I32);
            userInst.setOperand(0, constantInt);
            userInst.setOperand(1, rightA);
            userInst.setOp(OP.Add);
        }


        else if (ConstInAIs0 && !ConstInBIs0 && isAAdd && isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInA + ConstInB, IntegerType.I32);
            userInst.setOperand(1, constantInt);
            userInst.setOperand(0, rightA);
        }
        else if (ConstInAIs0 && !ConstInBIs0 && isAAdd && !isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInA - ConstInB, IntegerType.I32);
            userInst.setOperand(1, constantInt);
            userInst.setOperand(0, rightA);
            userInst.setOp(OP.Add);
        }
        //b = x - a; c = b + y; c = (x+y) - a
        else if (ConstInAIs0 && !ConstInBIs0 && !isAAdd && isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInA + ConstInB, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, rightA);
            userInst.setOp(OP.Sub);
            //A.remove();
        }
        //b = x - a; c = b - y ==> c = (x - y) - a
        else if (ConstInAIs0 && !ConstInBIs0 && !isAAdd && !isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInA - ConstInB, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, rightA);
            //A.remove();
        }



        else if (!ConstInAIs0 && ConstInBIs0 && isAAdd && isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInA + ConstInB, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, leftA);
            //A.remove();
        }
        else if (!ConstInAIs0 && ConstInBIs0 && isAAdd && !isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInB - ConstInA, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, leftA);
            //A.remove();
        }
        else if (!ConstInAIs0 && ConstInBIs0 && !isAAdd && isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInB - ConstInA, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, leftA);
            //A.remove();
        }
        else if (!ConstInAIs0 && ConstInBIs0 && !isAAdd && !isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInB + ConstInA, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, leftA);
            //A.remove();
        }

        else if (!ConstInAIs0 && !ConstInBIs0 && isAAdd && isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInA + ConstInB, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, leftA);
            //A.remove();
        }
        else if (!ConstInAIs0 && !ConstInBIs0 && isAAdd && !isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInA - ConstInB, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, leftA);
            userInst.setOp(OP.Add);
            //A.remove();
        }
        else if (!ConstInAIs0 && !ConstInBIs0 && !isAAdd && isBAdd) {
            ConstInteger constantInt = new ConstInteger(ConstInB - ConstInA, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, leftA);
            //A.remove();
        }

        //b = a - x; c = b - y; c = a - (x + y)
        else if (!ConstInAIs0 && !ConstInBIs0 && !isAAdd && !isBAdd) {
            ConstInteger constantInt = new ConstInteger(-ConstInB - ConstInA, IntegerType.I32);
            userInst.setOperand(0, constantInt );
            userInst.setOperand(1, leftA);
            userInst.setOp(OP.Add);
            //A.remove();
        }
    }

    private boolean canCombAdd(Instruction inst){
        if(!isCombAddAlu(inst)){
            return false;
        }
        for(Use use : inst.getUseList()){
            User user = use.getUser();
            if(!(user instanceof Instruction userInst && isCombAddAlu(userInst))){
                return false;
            }
        }
        return true;
    }

    private boolean isCombAddAlu(Instruction inst){
        if(!(inst instanceof BinaryInst binaryInst)){
            return false;
        }
        OP op = binaryInst.getOp();
        if(!(op == OP.Add || op == OP.Sub)){
            return false;
        }
        return binaryInst.hasOneConst();
    }

    @Override
    public String getName() {
        return "InstComb";
    }
}
