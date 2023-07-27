package Pass;

import Backend.component.ObjModule;
import IR.IRModule;
import Pass.IR.*;
import Pass.Obj.Peephole;
import Pass.Pass.*;

import Utils.IRDump;

import java.util.ArrayList;
import java.util.HashSet;

public class PassManager {
    private static final PassManager passManager = new PassManager();
    public static PassManager getInstance(){
        return passManager;
    }
    ArrayList<IRPass> irPasses = new ArrayList<>();
    ArrayList<ObjPass> objPasses = new ArrayList<>();

    private PassManager(){
        //  这里放入所有pass,控制pass的顺序
        irPasses.add(new GlobalValueLocalize());
        irPasses.add(new MergeBB());
        irPasses.add(new Mem2Reg());
        irPasses.add(new InstComb());
        irPasses.add(new RemovePhi());
//        irPasses.add(new DCE());
//        irPasses.add(new FuncInLine());
//        irPasses.add(new PeepHole());
//        irPasses.add(new ConstFold());
//        irPasses.add(new GVN());
        objPasses.add(new Peephole());


    }


    public void runIRPasses(IRModule irModule){
        for(IRPass irPass : irPasses){
            irPass.run(irModule);
        }
    }

    public void runObjPasses(ObjModule objModule){
        for(ObjPass objPass : objPasses){
            objPass.run(objModule);
        }
    }
}
