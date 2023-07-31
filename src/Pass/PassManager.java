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


    /*
    * 一些irPass顺序的想法：
    * 1. ConstFold要在InstComb之前
    * 2. GlobalValueLocalize必须最先做
    * 3. MergeBb必须在Mem2reg前
    * 4. FuncInLine尽量靠前
    * ...
    *
    * */
    private PassManager(){
        //  这里放入所有pass,控制pass的顺序
        irPasses.add(new GlobalValueLocalize());
        irPasses.add(new MergeBB());
        irPasses.add(new Mem2Reg());
//        irPasses.add(new FuncInLine());
        irPasses.add(new ConstFold());
//        irPasses.add(new InstComb());
//        irPasses.add(new DCE());
//        irPasses.add(new RemoveUselessStore());
//        irPasses.add(new PeepHole());
        //  循环相关优化
        irPasses.add(new LCSSA());

        //  GVNGCM本身不是循环优化，但需要用到loopDepth
//        irPasses.add(new GVN());
//        irPasses.add(new GCM());

//        irPasses.add(new GVN());
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
