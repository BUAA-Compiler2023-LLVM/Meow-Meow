package Pass.IR;

import IR.IRBuildFactory;
import IR.IRModule;
import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.Instructions.AllocInst;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.Phi;
import Pass.IR.Utils.DomAnalysis;
import Pass.Pass;
import Utils.DataStruct.IList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class Mem2reg implements Pass.IRPass {
    private final IRBuildFactory f = IRBuildFactory.getInstance();
    private HashMap<BasicBlock, Boolean> visited;
    private HashMap<AllocInst, ArrayList<BasicBlock>> defMap;
    private ArrayList<AllocInst> defs;
    private HashMap<BasicBlock, ArrayList<BasicBlock>> domTree;
    private HashSet<Instruction> deletedInst;
    private HashMap<Phi, AllocInst> phiAllocMap;

    @Override
    public void run(IRModule irModule){
        for(Function function : irModule.getFunctions()){
            IList<BasicBlock, Function> basicBlocks = function.getBbs();
            visited = new HashMap<>();
            //  df为该函数的支配边界信息，记录了每个节点的支配边界
            DomAnalysis.DomAnalysisRes res = DomAnalysis.run(function);
        }
    }

    @Override
    public String getName(){
        return "Mem2reg";
    }
}
