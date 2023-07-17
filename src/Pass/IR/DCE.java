package Pass.IR;

import IR.IRModule;
import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.*;
import IR.Value.Value;
//import Pass.IR.Utils.AliasAnalysis;
//import Pass.IR.Utils.InterproceduralAnalysis;
import Pass.IR.Utils.AliasAnalysis;
import Pass.IR.Utils.DomAnalysis;
import Pass.IR.Utils.InterproceduralAnalysis;
import Pass.Pass;
import Utils.DataStruct.IList;

import java.util.*;

/*  参考论文 https://yunmingzhang.files.wordpress.com/2013/12/dcereport-2.pdf
*   在此基础上做了一些更改:
*   Call指令也有可能被删除，这取决于过程间分析中该函数是否有副作用
* */
public class DCE implements Pass.IRPass {

    @Override
    public String getName() {
        return "DCE";
    }

    private Queue<Instruction> usefulInsts;
    private HashSet<Instruction> usefulInstSet;
    private HashSet<BasicBlock> usefulBbSet;
    private HashMap<BasicBlock, ArrayList<BasicBlock>> rdf;

    @Override
    public void run(IRModule module) {
        ArrayList<Function> uselessFuncs = new ArrayList<>();
        InterproceduralAnalysis.run(module);
        for(Function function : module.getFunctions()){
            usefulInsts = new LinkedList<>();
            usefulInstSet = new HashSet<>();
            usefulBbSet = new HashSet<>();
            if(function.getCallerList().isEmpty() && !function.getName().equals("@main")){
                uselessFuncs.add(function);
            }
            else if(!function.isLibFunction()) {
                runDCE(function);
            }
        }


        for(Function uselessFunc : uselessFuncs){
            module.getFunctions().remove(uselessFunc);
        }
    }

    private void runDCE(Function function){
        ArrayList<Instruction> deletedInsts = new ArrayList<>();
        rdf = DomAnalysis.run(function).getRDf();
        //  Initialize Phase
        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();
            for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                Instruction inst = instNode.getValue();
                if(isUseful(inst)){
                    usefulInstSet.add(inst);
                    usefulInsts.add(inst);
                    usefulBbSet.add(inst.getParentbb());
                }
            }
        }
        //  Mark Phase
        while (!usefulInsts.isEmpty()){
            Instruction inst = usefulInsts.poll();
            for(Value value : inst.getOperands()){
                if(value instanceof Instruction newInst &&
                        !usefulInstSet.contains(newInst)){
                    usefulInstSet.add(newInst);
                    usefulInsts.add(newInst);
                    usefulBbSet.add(newInst.getParentbb());
                }
            }

            if(rdf.get(inst.getParentbb()) != null) {
                for (BasicBlock bb : rdf.get(inst.getParentbb())) {
                    Instruction lastInst = bb.getLastInst();
                    if (!usefulInstSet.contains(lastInst)) {
                        usefulInstSet.add(lastInst);
                        usefulInsts.add(lastInst);
                        usefulBbSet.add(bb);
                    }
                }
            }
        }

        // Sweep Phase
        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();
            for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                Instruction inst = instNode.getValue();
                if(!usefulInstSet.contains(inst)){
                    if(inst instanceof BrInst brInst){
                        if(!brInst.isJump()){
                            BasicBlock nowBb = brInst.getParentbb();
                            while (!usefulBbSet.contains(nowBb) && nowBb.getPIdominator() != null){
                                nowBb = nowBb.getPIdominator();
                            }
                            brInst.turnToJump(nowBb);
                        }
                    }
                    else deletedInsts.add(inst);
                }
            }
        }

        for(Instruction inst : deletedInsts){
            inst.removeSelf();
        }

    }

    /*
    * 判断一个指令是否为usefulInst：
    * 1. Terminator: Ret
    * 2. MayHasSideEffect: Store, Call
    *
    * */
    private boolean isUseful(Instruction inst){
        OP op = inst.getOp();
        if(op == OP.Call){
            Function function = ((CallInst) inst).getFunction();
            if(function.isLibFunction()) return true;
            else return function.isMayHasSideEffect();
        }
        return op == OP.Ret || op == OP.Store;
    }

    //  removeUselessStore删除一系列store相同指针构成的指令集中前面无用的store
    //  只保留最后一个store指令
    //  遇到load, call等则停止搜索store
    private void removeUselessStore(Function function){
        ArrayList<Instruction> deletedInsts = new ArrayList<>();
        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();

            IList<Instruction, BasicBlock> insts = bb.getInsts();
            IList.INode<Instruction, BasicBlock> curNode = insts.getHead();
            while (curNode != null){
                Instruction curInst = curNode.getValue();
                if(curInst instanceof StoreInst curStoreInst){
                    Value pointer = AliasAnalysis.getArrRoot(curStoreInst);
                    IList.INode<Instruction, BasicBlock> nxtNode = curNode.getNext();
                    while (nxtNode != null){
                        Instruction nxtInst = nxtNode.getValue();
                        if(nxtInst instanceof StoreInst nxtStoreInst){
                            if(curStoreInst.getPointer() == nxtStoreInst.getPointer()){
                                deletedInsts.add(curStoreInst);
                                break;
                            }
                        }
                        else if(nxtInst instanceof LoadInst loadInst){
                            Value nxtPointer = AliasAnalysis.getArrRoot(loadInst.getPointer());
                            //  TODO 完成别名分析相关接口
                            break;
                        }
                        else if(nxtInst instanceof CallInst){
                            //  TODO 完成别名分析相关接口
                            break;
                        }
                        nxtNode = nxtNode.getNext();
                    }
                }
                curNode = curNode.getNext();
            }
        }
        for(Instruction deleteInst : deletedInsts){
            deleteInst.removeSelf();
        }
    }
}

