package Pass.IR.Utils;

import IR.Use;
import IR.Value.GlobalVar;
import IR.Value.Instructions.AllocInst;
import IR.Value.Instructions.GepInst;
import IR.Value.Instructions.LoadInst;
import IR.Value.Instructions.StoreInst;
import IR.Value.Value;

public class AliasAnalysis {

    //  获取某个数组value的根定义，要么是alloc指令，要么是全局数组
    //  如果是alloc返回根定义，全局数组返回null
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

        //  全局数组返回null
        //  AllocInst要判断一下是否为参数数组
        if (iter instanceof AllocInst || iter instanceof GlobalVar) {
            //  参数数组
            if (iter instanceof AllocInst && ((AllocInst) iter).getAllocType().isPointerType()) {
                for (Use use : iter.getUseList()) {
                    if (use.getUser() instanceof StoreInst) {
                        StoreInst storeInst = (StoreInst) use.getUser();
                        iter = storeInst.getPointer();
                    }
                }
            }
            return iter;
        }
        else {
            return null;
        }
    }

    public static boolean isGlobal(Value array){
        return array instanceof GlobalVar;
    }
    public static boolean isParam(Value array){
        if(array instanceof AllocInst){
            AllocInst allocInst = (AllocInst) array;
            return allocInst.getAllocType().isPointerType();
        }
        return false;
    }

    public static boolean isLocal(Value array){
        return !isGlobal(array) && !isParam(array);
    }

}