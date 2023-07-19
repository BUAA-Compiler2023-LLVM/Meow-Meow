package IR.Value;

import IR.IRBuildFactory;
import IR.Type.IntegerType;
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
