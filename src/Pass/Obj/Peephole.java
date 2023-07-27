package Pass.Obj;
import Backend.component.ObjBlock;
import Backend.component.ObjFunction;
import Backend.component.ObjModule;
import Backend.instruction.*;
import Backend.operand.ObjImm;
import Backend.operand.ObjImm12;
import Backend.operand.ObjReg;
import IR.Value.BasicBlock;
import IR.Value.Instructions.Instruction;
import Pass.Pass;
import Utils.DataStruct.IList;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

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
                for(IList.INode<ObjInstr, ObjBlock> instNode : block.getInstrs()){
                    zero(instNode);
                    multiple(instNode);
                    uselessMove(instNode);
                    uselessJump(instNode,instBlock.getNext());
                    uselessMemory(instNode);
                }
            }
            dataflow(function);
        }
    }
    // add t0, t1, 0 => mov t0, t1
    private void zero(IList.INode<ObjInstr, ObjBlock> instNode){
            ObjInstr nowInstr=instNode.getValue();
            if(nowInstr instanceof ObjBinary nowBinary){
                if(nowBinary.isSrc2Imm12()){
                    ObjImm12 nowImm = (ObjImm12)nowBinary.getSrc2();
                    if(nowImm.getImmediate12() == 0){
                        if(nowBinary.getDst().equals(nowBinary.getSrc1())){//相同
                            instNode.removeFromList();
                        }
                        else if(nowBinary.getType().equals("add")||nowBinary.getType().equals("sub")){
                            ObjMove objMove=new ObjMove(nowBinary.getDst(),nowBinary.getSrc1());
                            IList.INode<ObjInstr, ObjBlock> newNode = new IList.INode<ObjInstr, ObjBlock>(objMove);
                            newNode.insertBefore(instNode);
                            instNode.removeFromList();
                        }
                    }
                }
            }
            else if(nowInstr instanceof ObjMove objMove){
                if(objMove.getDst().equals(objMove.getSrc())){
                    instNode.removeFromList();
                }
            }

    }
    /* 乘法优化 mul t0, t1, 19 => sll t2, t1, 5
                                sll t3, t1, 1
                                add t2, t2, t3
                                sll t3, t1, 0
                                add t2, t2, t3
                                mov t0, t2
     */
    private void multiple(IList.INode<ObjInstr, ObjBlock> instNode){
            ObjInstr nowInstr = instNode.getValue();
            if(nowInstr instanceof ObjBinary nowBinary&&nowBinary.getType().equals("mul")){
                if(nowBinary.isSrc2Imm12()){
                    ObjImm12 nowImm = (ObjImm12)nowBinary.getSrc2();
                    int num=nowImm.getImmediate12();
                    String biNum="";
                    while(num>0){
                        biNum+=num%2;
                        num/=2;
                    }
                    String one="1";
                    String zero="0";
                    String oneString=biNum.replace(zero,"");
                    if(oneString.length()>biNum.length()/2){//加法换1


                    }
                    else{
                        //减法换0
                    }
                }
            }

    }
    /* move t0, t1
       move t0, t2 => move t0, t2
     */
    private void uselessMove(IList.INode<ObjInstr, ObjBlock> instNode){
            ObjInstr nowInstr = instNode.getValue();
            IList.INode<ObjInstr, ObjBlock> nextNode=instNode.getNext();
            if(nowInstr instanceof ObjMove objMove){
                if(nextNode!=null&&nextNode.getValue() instanceof ObjMove nextMove){
                    if(objMove.getDst().equals(nextMove.getDst()) && !(nextMove.getDst().equals(nextMove.getSrc()))){
                        instNode.removeFromList();
                    }
                }
            }
        }

    /* j aaa
       aaa:  => null
     */
    private void uselessJump(IList.INode<ObjInstr, ObjBlock> instNode, IList.INode<ObjBlock,ObjFunction> nextBlock){
            ObjInstr nowInstr=instNode.getValue();
            if(nowInstr instanceof ObjBranch objBranch){
                if(nextBlock!=null && !(objBranch.getCondType()) && objBranch.getTarget().equals(nextBlock.getValue())){
                    instNode.removeFromList();
                }
            }

    }
    /* store a, c(d)   store a, c(d)
       load b, c(d) => mov b, a
     */
    private void uselessMemory(IList.INode<ObjInstr, ObjBlock> instNode){

            ObjInstr nowInstr=instNode.getValue();
            IList.INode<ObjInstr,ObjBlock> nextNode=instNode.getNext();
            if(nextNode!=null &&nowInstr instanceof ObjStore objStore &&nextNode.getValue() instanceof ObjLoad objLoad){
                if(objStore.getAddr().equals(objLoad.getAddr())&&objStore.getOffset().equals(objLoad.getOffset())){
                    ObjMove newMove=new ObjMove(objLoad.getDst(),objStore.getSrc());
                    IList.INode<ObjInstr, ObjBlock> newNode = new IList.INode<ObjInstr, ObjBlock>(newMove);
                    newNode.insertAfter(instNode);
                    nextNode.removeFromList();
                }
            }
        }

    private HashMap<HashMap<ObjInstr, ObjInstr>,HashMap<ObjReg, ObjInstr>> initDataFlow(ObjBlock objBlock){
        HashMap<ObjInstr, ObjInstr> write2read = new HashMap<>();
        HashMap<ObjReg, ObjInstr> changeReg = new HashMap<>();
        for(IList.INode<ObjInstr, ObjBlock> instNode : objBlock.getInstrs()){
            ObjInstr nowInstr=instNode.getValue();
            ArrayList<ObjReg> writeReg=nowInstr.getWriteRegs();
            ArrayList<ObjReg> readReg=nowInstr.getReadRegs();
            if(nowInstr instanceof ObjBranch || nowInstr instanceof ObjCall || nowInstr instanceof ObjRet || nowInstr instanceof ObjStore){
                write2read.put(nowInstr,nowInstr);
            }
            for(ObjReg reg : writeReg){
                    changeReg.put(reg,nowInstr);
            }
            for(ObjReg reg : readReg){
                if(changeReg.containsKey(reg)){
                    write2read.put(changeReg.get(reg),nowInstr);
                }
            }
        }
        HashMap <HashMap<ObjInstr, ObjInstr>,HashMap<ObjReg, ObjInstr>>  dataFlow=new HashMap<>();
        dataFlow.put(write2read,changeReg);
        return dataFlow;
    }
    private void dataflow(ObjFunction objFunction){

    }
}