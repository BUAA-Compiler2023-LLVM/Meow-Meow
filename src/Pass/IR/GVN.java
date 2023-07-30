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

    private final HashMap<Value, Value> valueTable = new HashMap<>();

    @Override
    public void run(IRModule module) {
        InterproceduralAnalysis.run(module);
        for(Function function : module.getFunctions()){
            runGVNOnFunction(function);
        }
    }

    private void runGVNOnFunction(Function function){
        valueTable.clear();
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

        for(Instruction inst : deletedInsts){
            removeInstFromGVN(inst);
        }
    }

    private boolean runGVNOnInst(Instruction inst){
        return false;
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

    @Override
    public String getName() {
        return "GVN";
    }
}
