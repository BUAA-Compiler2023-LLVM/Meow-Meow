package Pass.IR;

import IR.IRModule;
import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.Instructions.*;
import IR.Value.Value;
import Pass.IR.Utils.DomAnalysis;
import Pass.IR.Utils.InterproceduralAnalysis;
import Pass.Pass;
import Utils.DataStruct.IList;

import java.util.*;

public class GVN implements Pass.IRPass {

    private final HashMap<String, Value> GVNMap = new HashMap<>();

    @Override
    public void run(IRModule module) {
        InterproceduralAnalysis.run(module);
        for(Function function : module.getFunctions()){
            runGVNOnFunction(function);
        }
    }

    private void runGVNOnFunction(Function function){
        GVNMap.clear();
        DomAnalysis.run(function);
        HashSet<BasicBlock> visited = new HashSet<>();
        ArrayList<BasicBlock> RPOrder = new ArrayList<>();

        BasicBlock entry = function.getBbEntry();
        POSearch(entry, visited, RPOrder);
        Collections.reverse(RPOrder);

        for(BasicBlock bb : RPOrder){
            runGVNOnBlock(bb);
        }
    }

    //  do post-order traversal
    private void POSearch(BasicBlock bb, HashSet<BasicBlock> visited, ArrayList<BasicBlock> RPOrder){
        visited.add(bb);
        for(BasicBlock nxtBb : bb.getNxtBlocks()){
            if(!visited.contains(nxtBb)) {
                POSearch(nxtBb, visited, RPOrder);
            }
        }
        RPOrder.add(bb);
    }

    private void runGVNOnBlock(BasicBlock bb){
        IList.INode<Instruction, BasicBlock> itInstNode = bb.getInsts().getHead();
        ArrayList<Instruction> deletedInsts = new ArrayList<>();
        while (itInstNode != null){
            Instruction inst = itInstNode.getValue();
            itInstNode = itInstNode.getNext();
            if (canGVN(inst) && runGVNOnInst(inst)){
                deletedInsts.add(inst);
            }
        }

        for(BasicBlock idomBb : bb.getIdoms()){
            runGVNOnBlock(idomBb);
        }
    }

    private boolean runGVNOnInst(Instruction inst){
        if(inst instanceof BinaryInst binaryInst){
            String leftName = binaryInst.getLeftVal().getName();
            OP op = binaryInst.getOp();
            String rightName = binaryInst.getRightVal().getName();
            String hash_1 = leftName + op.name() + rightName;
            String hash_2 = rightName + op.name() + leftName;
            if(GVNMap.containsKey(hash_1)){
                inst.replaceUsedWith(GVNMap.get(hash_1));
                inst.removeSelf();
                return false;
            }
            if(canSwap(op)){
                if(GVNMap.containsKey(hash_2)){
                    inst.replaceUsedWith(GVNMap.get(hash_2));
                    inst.removeSelf();
                    return false;
                }
                GVNMap.put(hash_1, inst);
                if(!leftName.equals(rightName)){
                    GVNMap.put(hash_2, inst);
                }
            }
            else{
                GVNMap.put(hash_1, inst);
            }
        }
        else if(inst instanceof CallInst callInst){
            StringBuilder hashBuilder = new StringBuilder(callInst.getFunction().getName() + "(");
            ArrayList<Value> params = callInst.getParams();
            for (int i = 0; i < params.size(); i++) {
                hashBuilder.append(params.get(i).getName());
                if (i < params.size() - 1) {
                    hashBuilder.append(", ");
                }
            }
            hashBuilder.append(")");
            String hash = hashBuilder.toString();
            if (GVNMap.containsKey(hash)) {
                inst.replaceUsedWith(GVNMap.get(hash));
                inst.removeSelf();
                return false;
            }
            GVNMap.put(hash, inst);
        }
        else if (inst instanceof GepInst gepInst) {
            StringBuilder hashBuilder = new StringBuilder(gepInst.getTarget().getName());
            ArrayList<Value> indexs = ((GepInst) inst).getIndexs();
            for (Value index : indexs) {
                hashBuilder.append("[").append(index.getName()).append("]");
            }
            String hash = hashBuilder.toString();
            if (GVNMap.containsKey(hash)) {
                inst.replaceUsedWith(GVNMap.get(hash));
                inst.removeSelf();
                return false;
            }
            GVNMap.put(hash, inst);
        }
        return true;
    }

    private void removeInstFromGVN(Instruction inst){

    }


    private boolean canGVN(Instruction inst){
        if(inst instanceof CallInst callInst){
            Function function = callInst.getFunction();
            return !function.isLibFunction() && !function.isMayHasSideEffect();
        }
        return inst instanceof BinaryInst || inst instanceof GepInst || inst instanceof ConversionInst;
    }

    private boolean canSwap(OP op){
        return op == OP.Add || op == OP.Fadd
                || op == OP.Mul || op == OP.Fmul
                || op == OP.Eq || op == OP.Ne
                || op == OP.FEq || op == OP.FNe;
    }


    @Override
    public String getName() {
        return "GVN";
    }
}
