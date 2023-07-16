package Pass;

import Backend.component.ObjModule;
import IR.IRModule;
import Pass.IR.DCE;
import Pass.IR.FuncInLine;
import Pass.IR.Mem2Reg;
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
    ArrayList<ObjPass> objPasses = new ArrayList<>();

    private PassManager(){
        //  这里放入所有pass,控制pass的顺序
        irPasses.add(new Mem2Reg());
        irPasses.add(new DCE());


        //  然后根据需求开放pass
        openedPasses.add("Mem2Reg");
        openedPasses.add("DCE");
    }


    public void runIRPasses(IRModule irModule){
        for(IRPass irPass : irPasses){
            if(openedPasses.contains(irPass.getName())){
                irPass.run(irModule);
            }
        }
    }

    public void runObjPasses(ObjModule objModule){
        for(ObjPass objPass : objPasses){
            if(openedPasses.contains(objPass.getName())){
                objPass.run(objModule);
            }
        }
    }


    public void addOpenPass(String pass){
        openedPasses.add(pass);
    }
}
