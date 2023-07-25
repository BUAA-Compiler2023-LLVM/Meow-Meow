package Pass.Obj;
import Backend.component.ObjBlock;
import Backend.component.ObjFunction;
import Backend.component.ObjModule;
import Backend.instruction.ObjBinary;
import Backend.instruction.ObjInstr;
import Backend.operand.ObjImm;
import IR.Value.BasicBlock;
import IR.Value.Instructions.Instruction;
import Pass.Pass;
import Utils.DataStruct.IList;

import java.util.ArrayList;

public class Peephole implements Pass.ObjPass{
    @Override
    public String getName() {
        return "Peephole";
    }

    @Override
    public void run(ObjModule objModule){
        ArrayList<ObjFunction> functions = objModule.getFunctions();
        for(ObjFunction function : functions){
            IList<ObjBlock,ObjFunction> blocks = function.getObjBlocks();
            for(IList.INode<ObjBlock,ObjFunction> instBlock : blocks){
                ObjBlock block = instBlock.getValue();
                zero(block);
            }
        }
    }
    // add t0, t1, 0 => mov t0, t1
    private void zero(ObjBlock objBlock){
        for(IList.INode<ObjInstr, ObjBlock> instNode : objBlock.getInstrs()){
            ObjInstr nowInstr=instNode.getValue();
            ObjBinary nowBinary=(ObjBinary) nowInstr;
            if(nowBinary.isSrc2Imm()){
                ObjImm nowimm=(ObjImm)nowBinary.getSrc2();
                if(nowimm.getImmediate()==0){
                    if(nowBinary.getDst().equals(nowBinary.getSrc1())){//相同
                        //delete
                    }
                    else{
                        nowBinary.setType("mov");//改成move
                    }
                }
            }
        }
    }
}