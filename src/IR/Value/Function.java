package IR.Value;

import IR.IRBuildFactory;
import IR.Type.Type;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.Phi;
import Utils.DataStruct.IList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Stack;

public class Function extends Value{
    private IRBuildFactory f = IRBuildFactory.getInstance();
    private final IList<BasicBlock, Function> bbs;
    private final ArrayList<Argument> args;
    private HashMap<BasicBlock, ArrayList<BasicBlock>> idoms;
    private HashMap<BasicBlock, ArrayList<BasicBlock>> pidoms;
    private HashMap<BasicBlock, HashSet<BasicBlock>> dom;
    private HashMap<BasicBlock, HashSet<BasicBlock>> pdom;
    private boolean mayHasSideEffect;
    private boolean useGV;
    private boolean canGVN = false;
    private boolean isLibFunc = false;
    private final HashSet<GlobalVar> loadGVs;
    private final HashSet<GlobalVar> storeGVs;

    //  callerList记录调用这个function的其他函数
    private final ArrayList<Function> callerList;
    //  calleeList记录这个function调用的其他函数
    private final ArrayList<Function> calleeList;
    private BasicBlock Entry;
    private BasicBlock Exit;

    //  Function的Type就是它返回值的type
    public Function(String name, Type type){
        super(name, type);
        this.bbs = new IList<>(this);
        this.args = new ArrayList<>();
        this.callerList = new ArrayList<>();
        this.calleeList = new ArrayList<>();
        this.loadGVs = new HashSet<>();
        this.storeGVs = new HashSet<>();
    }
    public Function(String name, Type type, IList<BasicBlock, Function> bbs, ArrayList<Argument> args){
        super(name, type);
        this.bbs = bbs;
        this.args = args;
        this.callerList = new ArrayList<>();
        this.calleeList = new ArrayList<>();
        this.loadGVs = new HashSet<>();
        this.storeGVs = new HashSet<>();
    }

    public void setIdoms(HashMap<BasicBlock, ArrayList<BasicBlock>> idoms) {
        this.idoms = idoms;
        for(IList.INode<BasicBlock, Function> bbNode : bbs){
            BasicBlock bb = bbNode.getValue();
            bb.setIdoms(idoms.get(bb));
            for(BasicBlock idomBb : idoms.get(bb)){
                idomBb.setIdominator(bb);
            }
        }
    }

    public void setPIdoms(HashMap<BasicBlock, ArrayList<BasicBlock>> pidoms){
        this.pidoms = pidoms;
        for(IList.INode<BasicBlock, Function> bbNode : bbs){
            BasicBlock bb = bbNode.getValue();
            bb.setPIdoms(pidoms.get(bb));
            for(BasicBlock pidomBb : pidoms.get(bb)){
                pidomBb.setPIdominator(bb);
            }
        }
    }

    public HashMap<BasicBlock, ArrayList<BasicBlock>> getIdoms() {
        return idoms;
    }

    public void setDom(HashMap<BasicBlock, HashSet<BasicBlock>> dom){
        this.dom = dom;
    }

    public void setPDom(HashMap<BasicBlock, HashSet<BasicBlock>> pdom){
        this.pdom = pdom;
    }

    public void addCaller(Function function){
        if(!callerList.contains(function)) {
            this.callerList.add(function);
        }
    }
    public void addCallee(Function function){
        if(calleeList.contains(function)) {
            this.calleeList.add(function);
        }
    }

    public ArrayList<Function> getCallerList(){
        return callerList;
    }

    public ArrayList<Function> getCalleeList(){
        return calleeList;
    }

    public void copyAll(Function srcFunction, ArrayList<GlobalVar> globalVars){
        HashMap<Value, Value> replaceMap = new HashMap<>();
        HashSet<BasicBlock> visitedMap = new HashSet<>();
        ArrayList<Argument> srcArgs = srcFunction.getArgs();
        //  初始化数据结构
        for (Argument arg : srcArgs) {
            Argument copyArg;
            Type type = arg.getType();
            copyArg = f.getArgument(arg.getName(), type, this);
            this.addArg(copyArg);
            replaceMap.put(arg, copyArg);
        }
        for (Value globalVar : globalVars) {
            replaceMap.put(globalVar, globalVar);
        }
        for (IList.INode<BasicBlock, Function> bbNode : srcFunction.getBbs()) {
            BasicBlock newBlock = IRBuildFactory.getInstance().buildBasicBlock(this);
            replaceMap.put(bbNode.getValue(), newBlock);
        }

        Stack<BasicBlock> dfsStack = new Stack<>();
        dfsStack.push(srcFunction.getBbEntry());
        while (!dfsStack.isEmpty()) {
            BasicBlock loopBlock = dfsStack.pop();
            ((BasicBlock) replaceMap.get(loopBlock)).copyAllFrom(loopBlock, replaceMap);
            if (!loopBlock.getNxtBlocks().isEmpty()) {
                for (BasicBlock basicBlock : new HashSet<>(loopBlock.getNxtBlocks())) {
                    if (!visitedMap.contains(basicBlock)) {
                        visitedMap.add(basicBlock);
                        dfsStack.push(basicBlock);
                    }
                }
            }
        }

        ArrayList<Phi> phiArrayList = new ArrayList<>();
        for (IList.INode<BasicBlock, Function> bbNode : srcFunction.getBbs()) {
            BasicBlock bb = bbNode.getValue();
            for (IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()) {
                Instruction inst = instNode.getValue();
                if (inst instanceof Phi) {
                    phiArrayList.add((Phi) inst);
                }
            }
        }

        //  修改phi指令中的前驱基本块
        for (Phi phi : phiArrayList) {
            for (int i = 0; i < phi.getOperands().size(); i++) {
                BasicBlock preBB = phi.getParentbb().getPreBlocks().get(i);
                BasicBlock nowBB = (BasicBlock) replaceMap.get(preBB);
                Phi copyPhi = (Phi) replaceMap.get(phi);
                int index = copyPhi.getParentbb().getPreBlocks().indexOf(nowBB);

                Value value = phi.getOperand(i);
                Value copyValue;
                if(value instanceof ConstInteger){
                    int val = ((ConstInteger) value).getVal();
                    copyValue = new ConstInteger(val);
                }
                else copyValue = replaceMap.get(value);
                copyPhi.replaceOperand(index, copyValue);
            }
        }
    }

    public void setMayHasSideEffect(boolean mayHasSideEffect){
        this.mayHasSideEffect = mayHasSideEffect;
    }

    public void setUseGV(boolean useGV){
        this.useGV = useGV;
    }

    public void addArg(Argument argument){ args.add(argument); }

    public IList<BasicBlock, Function> getBbs() {
        return bbs;
    }

    public ArrayList<Argument> getArgs() {
        return args;
    }

    public BasicBlock getBbEntry() {
        return bbs.getHeadValue();
    }

    public void setBbExit(BasicBlock b) {
        this.Exit=b;
    }

    public BasicBlock getBbExit() {
        return this.Exit;
    }

    public boolean isLibFunction(){
        return isLibFunc;
    }

    public void setAsLibFunction(){
        this.isLibFunc = true;
    }

    public boolean isMayHasSideEffect(){
        return mayHasSideEffect;
    }

    public boolean isUseGV(){
        return useGV;
    }

    public void addLoadGV(GlobalVar gv){
        loadGVs.add(gv);
    }

    public void addStoreGV(GlobalVar gv){
        storeGVs.add(gv);
    }

    public HashSet<GlobalVar> getLoadGVs(){
        return loadGVs;
    }

    public HashSet<GlobalVar> getStoreGVs(){
        return storeGVs;
    }
}
