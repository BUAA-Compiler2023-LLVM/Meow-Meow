package Pass.IR;

import IR.IRModule;
import IR.Value.Function;
import Pass.IR.Utils.LoopAnalysis;
import Pass.Pass;

public class LCSSA implements Pass.IRPass {

    @Override
    public void run(IRModule module) {
        for(Function function : module.getFunctions()){
            runLCSSAForFunc(function);
        }
    }

    private void runLCSSAForFunc(Function function){
        LoopAnalysis.run(function);
        //  TODO: 转换成LCSSA形式
    }

    @Override
    public String getName() {
        return "LCSSA";
    }
}
