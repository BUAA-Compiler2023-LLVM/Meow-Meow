package Pass;

import IR.IRModule;
import Pass.Pass.*;

import java.util.ArrayList;
import java.util.HashSet;

public class PassManager {
    private static final PassManager passManager = new PassManager();
    public static PassManager getInstance(){
        return passManager;
    }
    HashSet<String> openedPasses = new HashSet<>();
    ArrayList<IRPass> irPasses = new ArrayList<>();

    private PassManager(){
//        irPasses.add(new DCE());
    }

    public void runIRPasses(IRModule irModule){
        for(IRPass irPass : irPasses){
            if(openedPasses.contains(irPass.getName())){
                irPass.run(irModule);
            }
        }
    }


    public void addOpenPass(String pass){
        openedPasses.add(pass);
    }
}
