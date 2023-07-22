package Pass.IR;

import IR.IRModule;
import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.Value;
import Pass.Pass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Stack;

public class GVN implements Pass.IRPass {

    private final HashMap<Value, Value> valueTable = new HashMap<>();

    @Override
    public void run(IRModule module) {
        for(Function function : module.getFunctions()){
            runGVNOnFunction(function);
        }
    }

    private void runGVNOnFunction(Function function){
        valueTable.clear();
        Stack<BasicBlock> stack = new Stack<>();
        ArrayList<BasicBlock> preOrder = new ArrayList<>();
        HashSet<BasicBlock> visited = new HashSet<>();

        stack.push(function.getBbEntry());
        visited.add(function.getBbEntry());

        while (!stack.isEmpty()) {
            BasicBlock curBlock = stack.pop();
            preOrder.add(curBlock);
            for (BasicBlock nxtBlock : curBlock.getNxtBlocks()) {
                if (!visited.contains(nxtBlock))
                {
                    stack.push(nxtBlock);
                    visited.add(nxtBlock);
                }
            }
        }

        for (BasicBlock bb : preOrder) {
            runGVNOnBlock(bb);
        }
    }

    private void runGVNOnBlock(BasicBlock bb){

    }

    @Override
    public String getName() {
        return "GVN";
    }
}
