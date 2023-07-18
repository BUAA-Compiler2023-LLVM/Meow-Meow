package Pass.IR;

import IR.IRBuildFactory;
import IR.IRModule;
import IR.Type.Type;
import IR.Value.*;
import IR.Value.Instructions.*;
import Pass.Pass;
import Utils.DataStruct.IList;

import java.util.ArrayList;

import static Pass.IR.Utils.UtilFunc.buildCallRelation;

public class FuncInLine implements Pass.IRPass {

    @Override
    public String getName() {
        return "FuncInLine";
    }

    private IRModule module;
    private boolean changed;
    private final IRBuildFactory f = IRBuildFactory.getInstance();

    @Override
    public void run(IRModule module) {
        this.module = module;
        simpleInline();
    }

    //  simpleInline只基础版的函数内联，不做递归展开
    private void simpleInline(){
        ArrayList<Function> tobeProcessed = new ArrayList<>();
        changed = true;
        //  dfs找到端点函数并内联，直至没有函数可以内联
        //  将找到的端点函数放入tobeProcessed里
        while (changed) {
            changed = false;
            buildCallRelation(module);
            for(Function function : module.getFunctions()){
                if (isInlinable(function)) {
                    tobeProcessed.add(function);
                }
            }

            for(Function function : tobeProcessed) {
                inlineFunction(function);
            }
            tobeProcessed.clear();
        }
        buildCallRelation(module);
        removeUseLessFunction(module);
    }

    private void removeUseLessFunction(IRModule module){
        ArrayList<Function> deleteFuncs = new ArrayList<>();
        for(Function function : module.getFunctions()){
            if(function.getCallerList().size() == 0 && !function.getName().equals("@main")){
                deleteFuncs.add(function);
            }
        }

        for(Function deleteFunc : deleteFuncs){
            module.getFunctions().remove(deleteFunc);
        }
    }

    //  inlineFunction
    private void inlineFunction(Function function){
        if(function.getCallerList().isEmpty()){
            return;
        }

        changed = true;
        //  内联每一处调用该function的地方
        //  1. 找到该函数callers对应的callInst
        ArrayList<Instruction> toBeReplaced = new ArrayList<>();
        for(Function caller : function.getCallerList()){
            if(caller.equals(function)){
                //  递归给我gun啊！！！
                continue;
            }
            for(IList.INode<BasicBlock, Function> bbNode : caller.getBbs()){
                BasicBlock bb = bbNode.getValue();
                for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                    Instruction inst = instNode.getValue();
                    if(inst instanceof CallInst callInst){
                        if(callInst.getFunction().getName().equals(function.getName())){
                            toBeReplaced.add(inst);
                        }
                    }
                }
            }
        }
        //  2. 处理callInst的替换
        for(Instruction inst : toBeReplaced){
            inlineOneCall((CallInst) inst);
        }
        //  3. 删除该函数的调用列表
        function.getCallerList().clear();
    }

    //  insertBlock用于承上启下，将callInst所在的基本块以callInst为分隔线一分为二
    //  之后copy出来的新blocks将插在oriBlock和insertBlock之间
    private void inlineOneCall(CallInst callInst){
        Function calledFunction = callInst.getFunction();
        BasicBlock oriBlock = callInst.getParentbb();
        Function oriFunction = oriBlock.getParentFunc();
        Function tmpInlineFunction = f.getFunction(calledFunction.getName(), calledFunction.getType());
        tmpInlineFunction.copyAll(calledFunction, module.getGlobalVars());

        //  构建insertBlock
        //  1. 创建insertBlock并将其插入在函数中
        BasicBlock insertBlock = new BasicBlock(oriFunction);
        insertBlock.insertAfter(oriBlock);

        //  2. 为insertBlock填写指令(即callInst后面的指令)
        //  同时删除oriBlock中的这些指令
        IList.INode<Instruction, BasicBlock> itInstNode = callInst.getNode().getNext();
        while (itInstNode != null){
            Instruction inst = itInstNode.getValue();
            itInstNode = itInstNode.getNext();
            inst.removeFromBb();
            insertBlock.addInst(inst);
        }

        //  3. 删除callInst指令并修正函数调用关系
        callInst.removeSelf();
        oriFunction.getCalleeList().remove(calledFunction);
        calledFunction.getCallerList().remove(oriFunction);

        //  4. 修正基本块之间前驱后继关系
        BasicBlock tmpBbEntry = tmpInlineFunction.getBbEntry();
        //  在为oriBlock重构nxtBlock之前，
        //  先把insertBlock和oriBlock的原后继建好关系
        for(BasicBlock bb : oriBlock.getNxtBlocks()){
            //  一般情况下 我们nxtBlock和preBlock都是在建立br指令的时候自动构建的
            //  但是这里的情况是insertBlock复制了oriBlock里的br指令
            //  并没有进行新的构建，因此需要手动设置一下nxtBlock和preBlock
            insertBlock.setNxtBlock(bb);
            for(int i = 0; i < bb.getPreBlocks().size(); i++){
                BasicBlock preBb = bb.getPreBlocks().get(i);
                if(preBb == oriBlock){
                    bb.getPreBlocks().set(i, insertBlock);
                }
            }
        }
        f.buildBrInst(tmpBbEntry, oriBlock);

        // 将调用函数的形式参数换为为传入参数
        ArrayList<Argument> formalParameters = tmpInlineFunction.getArgs();
        ArrayList<Value> actualParameters = new ArrayList<>(callInst.getOperands());

        for (int i = 0; i < formalParameters.size(); i++) {
            Value formalParam = formalParameters.get(i);
            Value actualParam = actualParameters.get(i);
            if (actualParam.getType().isIntegerTy()) {
                formalParam.replaceUsedWith(actualParam);
            }
            else {
                ArrayList<Instruction> deletedMem = new ArrayList<>();
                //  对于非i32的参数，我们当时使用的策略是新申请一个空间来存这个变量
                //  但是显然把该函数内联后，我们没有必要去这么做
                //  因此我们可以找到alloc对应的load指令，并将其改成actualParam
                for (User user : formalParam.getUserList()) {
                    if (!(user instanceof Instruction useArgInst)) {
                        continue;
                    }
                    if (useArgInst.getOp().equals(OP.Store)) {
                        AllocInst allocInst = (AllocInst) ((StoreInst) useArgInst).getPointer();
                        deletedMem.add(allocInst);
                        deletedMem.add(useArgInst);
                        for (User allocUser : allocInst.getUserList()) {
                            if (!(allocUser instanceof Instruction useAllocInst)) {
                                continue;
                            }
                            //  将load出来的这个value直接换成actualParam
                            if (useAllocInst.getOp().equals(OP.Load)) {
                                useAllocInst.replaceUsedWith(actualParam);
                                deletedMem.add(useAllocInst);
                            }
                        }
                    }
                }

                for(Instruction inst : deletedMem){
                    inst.removeSelf();
                }
            }
        }

        //  处理ret和call指令
        //  将tmpInline函数中的基本块转移到原函数中
        ArrayList<Instruction> rets = new ArrayList<>();
        ArrayList<Instruction> calls = new ArrayList<>();
        ArrayList<BasicBlock> moveBB = new ArrayList<>();
        for (IList.INode<BasicBlock, Function> bbNode : tmpInlineFunction.getBbs()) {
            BasicBlock bb = bbNode.getValue();
            moveBB.add(bb);
            for (IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()) {
                Instruction inst = instNode.getValue();
                if (inst instanceof RetInst) {
                    rets.add(inst);
                }
                else if (inst instanceof CallInst) {
                    calls.add(inst);
                }
            }
        }
        //  要内联的函数内部可能因为不同的控制流有多个return指令
        //  如果只有一个ret指令显然我们呢直接替换就可以了
        //  否则我们应该将返回值转换成一个phi指令的形式
        Type retType = calledFunction.getType();
        if (retType.isIntegerTy()) {
            if(rets.size() == 1){
                Instruction retInst = rets.get(0);
                callInst.replaceUsedWith(retInst.getOperand(0));
                BasicBlock nowBb = retInst.getParentbb();
                //  先remove retInst，这样nowBb的isTerminal就会变为false
                retInst.removeSelf();
                f.buildBrInst(insertBlock, nowBb);
            }
            else {
                //  填写phi指令并修改ret指令为br指令
                //  这些含ret的基本块通过br汇总到insertBlock
                Phi phi = new Phi(retType, new ArrayList<>());
                callInst.replaceUsedWith(phi);
                for (Instruction retInst : rets) {
                    if(((RetInst) retInst).isVoid()){
                        continue;
                    }
                    phi.addOperand(retInst.getOperands().get(0));
                    BasicBlock nowBb = retInst.getParentbb();
                    retInst.removeSelf();
                    f.buildBrInst(insertBlock, nowBb);
                }
                phi.insertToHead(insertBlock);
            }
        }
        else if (retType.isVoidTy()) {
            for (Instruction retInst : rets) {
                BasicBlock nowBb = retInst.getParentbb();
                retInst.removeFromBb();
                f.buildBrInst(insertBlock, nowBb);
            }
        }

        for (BasicBlock bb : moveBB) {
            bb.insertBefore(insertBlock);
        }
        for (Instruction call : calls) {
            Function calledFunc = ((CallInst) call).getFunction();
            if(calledFunc.isLibFunction()){
                continue;
            }
            calledFunc.addCaller(oriFunction);
            oriFunction.addCallee(calledFunc);
        }

        module.getFunctions().remove(tmpInlineFunction);
    }

    private boolean isInlinable(Function function){
        //  main函数或调用了其他函数 不能被内联
        if(function.getName().equals("@main")) return false;
        return function.getCalleeList().isEmpty();
    }
}
