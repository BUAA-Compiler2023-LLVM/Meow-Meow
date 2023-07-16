package Pass.IR.Utils;

import IR.Use;
import IR.Value.GlobalVar;
import IR.Value.Instructions.AllocInst;
import IR.Value.Instructions.GepInst;
import IR.Value.Instructions.LoadInst;
import IR.Value.Instructions.StoreInst;
import IR.Value.Value;

public class AliasAnalysis {

    //  获取某个数组value的根定义，要么是alloc指令(局部数组或参数数组)，要么是全局数组
    public static Value getArrRoot(Value pointer){
        Value iter = pointer;

        //  这里loadInst是因为有可能为参数数组(本质上最初定义也是allocInst)
        //  我们一路循环直到iter是AllocInst或者为全局数组
        while (iter instanceof GepInst || iter instanceof LoadInst){
            if (iter instanceof GepInst) {
                iter = ((GepInst) iter).getTarget();
            } else {
                iter = ((LoadInst) iter).getPointer();
            }
        }

        return iter;
    }

    public static boolean isGlobal(Value array){
        return array instanceof GlobalVar;
    }
    public static boolean isParam(Value array){
        if(array instanceof AllocInst allocInst){
            return allocInst.getAllocType().isPointerType();
        }
        return false;
    }

    public static boolean isLocal(Value array){
        return !isGlobal(array) && !isParam(array);
    }

}