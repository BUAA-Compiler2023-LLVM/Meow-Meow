package IR;

import IR.Value.Function;
import IR.Value.GlobalVar;

import java.util.ArrayList;

public class IRModule {
    private final ArrayList<Function> functions;
    private final ArrayList<GlobalVar> globalVars;

    public IRModule(ArrayList<Function> functions, ArrayList<GlobalVar> globalVars){
        this.functions = functions;
        this.globalVars = globalVars;
    }

    public ArrayList<Function> getFunctions() {
        return functions;
    }

    public ArrayList<GlobalVar> getGlobalVars() {
        return globalVars;
    }

    public void addFunction(Function function){
        functions.add(function);
    }

    public void removeFunc(Function function){
        functions.remove(function);
        for(Function callee : function.getCalleeList()){
            callee.getCallerList().remove(function);
        }
        for(Function caller : function.getCallerList()){
            caller.getCalleeList().remove(function);
        }
    }
}
