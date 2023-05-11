//package Pass.IR;
//
//import IR.IRModule;
//import IR.Value.BasicBlock;
//import IR.Value.Function;
//import IR.Value.Instructions.Instruction;
//import IR.Value.Instructions.OP;
//import IR.Value.Value;
//import Pass.Pass;
//import Utils.DataStruct.IList;
//
//import java.util.ArrayList;
//import java.util.HashSet;
//
//public class DCE implements Pass.IRPass {
//    @Override
//    public String getName() {
//        return "DCE";
//    }
//
//    private HashSet<Instruction> usefulInsts;
//    @Override
//    public void run(IRModule module) {
//        ArrayList<Function> uselessFuncs = new ArrayList<>();
//        InterproceduralAnalysis.run(module);
//        for(Function function : module.getFunctions()){
//            usefulInsts = new HashSet<>();
//            if(function.getCallerList().isEmpty() && !function.getName().equals("@main")){
//                uselessFuncs.add(function);
//            }
//            else if(!function.isLibFunction()) {
//                runDCE(function);
//            }
//        }
//        for(Function uselessFunc : uselessFuncs){
//            module.removeFunc(uselessFunc);
//        }
//    }
//
//    private void runDCE(Function function){
//        ArrayList<Instruction> deletedInsts = new ArrayList<>();
////        removeUselessStore(function);
//        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
//            BasicBlock bb = bbNode.getValue();
//            for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
//                Instruction inst = instNode.getValue();
//                if(isUseful(inst)){
//                    findUsefulClosure(inst);
//                }
//            }
//        }
//        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
//            BasicBlock bb = bbNode.getValue();
//            for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
//                Instruction inst = instNode.getValue();
//                if(!usefulInsts.contains(inst)){
//                    deletedInsts.add(inst);
//                }
//            }
//        }
//
//        for(Instruction deleteInst : deletedInsts){
//            deleteInst.removeSelf();
//        }
//    }
//
//    private void findUsefulClosure(Instruction inst){
//        if(usefulInsts.contains(inst)){
//            return ;
//        }
//        usefulInsts.add(inst);
//        for(Value value : inst.getOperands()){
//            if(value instanceof Instruction){
//                findUsefulClosure((Instruction) value);
//            }
//        }
//    }
//
//    private boolean isUseful(Instruction inst){
//        OP op = inst.getOp();
//        //  Q: 为什么store也是有用的?
//        if(op == OP.Br || op == OP.Ret || op == OP.Store){
//            return true;
//        }
//        else if(op == OP.Call){
//            Function callFunc = ((CallInst) inst).getCallFunc();
//            if(callFunc.isLibFunction()) return true;
//            return callFunc.isHasSideEffect();
//        }
//        return false;
//    }
//}
