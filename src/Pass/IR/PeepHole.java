package Pass.IR;

import IR.IRBuildFactory;
import IR.IRModule;
import IR.Type.IntegerType;
import IR.Value.BasicBlock;
import IR.Value.ConstInteger;
import IR.Value.Function;
import IR.Value.Instructions.*;
import IR.Value.Value;
import Pass.Pass;
import Utils.DataStruct.IList;

import java.util.ArrayList;
import java.util.HashSet;

public class PeepHole implements Pass.IRPass {

    private final IRBuildFactory f = IRBuildFactory.getInstance();

    @Override
    public void run(IRModule module) {
        //  PeepHole1: Rem2DivSubMul & RemOptimize
        PeepHole1(module);
        // A = icmp %0, %1; B = icmp ne A, 0
        // A.replaceUsedWith(B)
        PeepHole2(module);
        // store A ptr1; ...; B = load ptr1;
        PeepHole3(module);
    }

    private void PeepHole3(IRModule module){
        for(Function function : module.getFunctions()){
            for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
                BasicBlock bb = bbNode.getValue();
                ArrayList<Instruction> memInsts = new ArrayList<>();
                for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                    Instruction inst = instNode.getValue();
                    if(inst instanceof StoreInst || inst instanceof LoadInst){
                        memInsts.add(inst);
                    }
                }

                for(int i = 0; i < memInsts.size() - 1; i++){
                    Instruction inst = memInsts.get(i);
                    Instruction nxtInst = memInsts.get(i + 1);
                    if(inst instanceof StoreInst storeInst && nxtInst instanceof LoadInst loadInst
                            && storeInst.getPointer().equals(loadInst.getPointer())){
                        Value value = storeInst.getValue();
                        loadInst.replaceUsedWith(value);
                        loadInst.removeSelf();
                    }
                }
            }
        }
    }

    private void PeepHole2(IRModule module){
        for(Function function : module.getFunctions()){
            for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
                BasicBlock bb = bbNode.getValue();
                ArrayList<CmpInst> cmpInsts = new ArrayList<>();
                for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                    Instruction inst = instNode.getValue();
                    if(inst instanceof CmpInst cmpInst){
                        cmpInsts.add(cmpInst);
                    }
                }

                for(CmpInst cmpInst : cmpInsts){
                    if(!cmpInst.getOp().equals(OP.Ne)){
                        continue;
                    }
                    Value left = cmpInst.getLeftVal();
                    Value right = cmpInst.getRightVal();
                    if(left instanceof CmpInst){
                        if(right.equals(ConstInteger.const0_32) ||
                        right.equals(ConstInteger.const0_1)){
                            cmpInst.replaceUsedWith(left);
                            cmpInst.removeSelf();
                        }
                    }
                    else if(right instanceof CmpInst){
                        if(left.equals(ConstInteger.const0_32) ||
                        left.equals(ConstInteger.const0_1)){
                            cmpInst.replaceUsedWith(right);
                            cmpInst.removeSelf();
                        }
                    }
                }
            }
        }
    }

    private void PeepHole1(IRModule module){
        HashSet<BinaryInst> rems = new HashSet<>();
        HashSet<BinaryInst> frems = new HashSet<>();

        for (Function function : module.getFunctions()) {
            for (IList.INode<BasicBlock, Function> bbNode : function.getBbs()) {
                BasicBlock bb = bbNode.getValue();
                for (IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()) {
                    Instruction inst = instNode.getValue();
                    if (inst instanceof BinaryInst binaryInst) {
                        OP op = binaryInst.getOp();
                        if(op.equals(OP.Mod)){
                            rems.add(binaryInst);
                        }
                        else if(op.equals(OP.Fmod)){
                            frems.add(binaryInst);
                        }
                    }
                }
            }
        }

        for (BinaryInst rem : rems) {
            Value A = rem.getLeftVal();
            Value B = rem.getRightVal();
            if (B instanceof ConstInteger) {
                int val = ((ConstInteger) B).getValue();
                if (val > 0 && ((int) Math.pow(2, ((int) (Math.log(val) / Math.log(2))))) == val) {
                    continue;
                }
            }

            //  0 % a = 0; a % a = 0; a % 1 = 0;
            if(A.equals(ConstInteger.const0_32) || A.equals(B)
                    || (B instanceof ConstInteger constInteger
                    && constInteger.getValue() == 1)){
                rem.replaceUsedWith(ConstInteger.const0_32);
                rem.removeSelf();
                return;
            }

            BinaryInst div = f.getBinaryInst(A, B, OP.Div, IntegerType.I32);
            BinaryInst mul = f.getBinaryInst(div, B, OP.Mul, IntegerType.I32);
            BinaryInst sub = f.getBinaryInst(A, mul, OP.Sub, IntegerType.I32);

            div.insertAfter(rem);
            mul.insertAfter(div);
            sub.insertAfter(mul);

            rem.replaceUsedWith(sub);
            rem.removeSelf();
        }

        for (BinaryInst frem: frems) {
            Value A = frem.getLeftVal();
            Value B = frem.getRightVal();
            BinaryInst fdiv = f.getBinaryInst(A, B, OP.Fdiv, IntegerType.I32);
            BinaryInst fmul = f.getBinaryInst(fdiv, B, OP.Fmul, IntegerType.I32);
            BinaryInst fsub = f.getBinaryInst(A, fmul, OP.Fsub, IntegerType.I32);

            fdiv.insertAfter(frem);
            fmul.insertAfter(fdiv);
            fsub.insertAfter(fmul);

            frem.replaceUsedWith(fsub);
            frem.removeSelf();
        }
    }

    @Override
    public String getName() {
        return "PeepHole";
    }
}
