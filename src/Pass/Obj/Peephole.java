package Pass.Obj;
import Backend.component.ObjBlock;
import Backend.component.ObjFunction;
import Backend.component.ObjModule;
import Backend.instruction.ObjInstr;
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
        ArrayList<ObjFunction> functions=objModule.getFunctions();
        for(int i=0;i<functions.size();i++){
            ObjFunction function=functions.get(i);
            IList<ObjBlock,ObjFunction> blocks=function.getObjBlocks();
            for(IList.INode<ObjBlock,ObjFunction> instBlock : blocks){
                ObjBlock block=instBlock.getValue();
                IList<ObjInstr,ObjBlock> instructions=block.getInstrs();
                zero(instructions);


            }

        }
    }
    // add t0, t1, 0 => mov t0, t1
    private void zero(IList<ObjInstr,ObjBlock> instructions){
        for(IList.INode<ObjInstr,ObjBlock> instNode : instructions){
            ObjInstr nowInstr=instNode.getValue();
        }
    }
}