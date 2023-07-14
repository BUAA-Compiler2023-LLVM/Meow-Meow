package IR.Value;

import IR.IRBuildFactory;
import IR.Type.Type;
import Utils.DataStruct.IList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class Function extends Value{
    private final IList<BasicBlock, Function> bbs;
    private final ArrayList<Argument> args;
    private HashMap<BasicBlock, ArrayList<BasicBlock>> idoms;
    private HashMap<BasicBlock, HashSet<BasicBlock>> dom;
    private boolean hasSideEffect;
    private boolean useGV;
    //  callerList记录调用这个function的其他函数
    private final ArrayList<Function> callerList;
    //  calleeList记录这个function调用的其他函数
    private final ArrayList<Function> calleeList;

    //  Function的Type就是它返回值的type
    public Function(String name, Type type){
        super(name, type);
        this.bbs = new IList<>(this);
        this.args = new ArrayList<>();
        this.callerList = new ArrayList<>();
        this.calleeList = new ArrayList<>();
    }
    public Function(String name, Type type, IList<BasicBlock, Function> bbs, ArrayList<Argument> args){
        super(name, type);
        this.bbs = bbs;
        this.args = args;
        this.callerList = new ArrayList<>();
        this.calleeList = new ArrayList<>();
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

    public HashMap<BasicBlock, ArrayList<BasicBlock>> getIdoms() {
        return idoms;
    }

    public void setDom(HashMap<BasicBlock, HashSet<BasicBlock>> dom){
        this.dom = dom;
    }

    public void addCaller(Function function){
        this.callerList.add(function);
    }
    public void addCallee(Function function){
        this.calleeList.add(function);
    }

    public ArrayList<Function> getCallerList(){
        return callerList;
    }

    public ArrayList<Function> getCalleeList(){
        return calleeList;
    }

    public void setHasSideEffect(boolean hasSideEffect){
        this.hasSideEffect = hasSideEffect;
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

    public boolean isLibFunction(){
        return this.getName().equals("@getint") || this.getName().equals("@memset") || this.getName().equals("@printf");
    }
}
