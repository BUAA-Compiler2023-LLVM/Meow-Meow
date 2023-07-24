package Pass.IR;

import IR.IRBuildFactory;
import IR.IRModule;
import IR.Value.BasicBlock;
import IR.Value.Instructions.Instruction;
import IR.Value.Value;
import Pass.Pass;
import Utils.DataStruct.IList;

public class ConstFold implements Pass.IRPass {
    private static final IRBuildFactory f = IRBuildFactory.getInstance();

    @Override
    public void run(IRModule module) {

    }

    @Override
    public String getName() {
        return "ConstFold";
    }
}
