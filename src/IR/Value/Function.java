package IR.Value;

import IR.IRBuildFactory;
import IR.Type.Type;
import Utils.DataStruct.IList;

import java.util.ArrayList;

public class Function extends Value{
    private final IList<BasicBlock, Function> bbs;
    private final ArrayList<Argument> args;
    private boolean hasSideEffect;
    private boolean useGV;
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
    }
    public Function(String name, Type type, IList<BasicBlock, Function> bbs, ArrayList<Argument> args){
        super(name, type);
        this.bbs = bbs;
        this.args = args;
        this.callerList = new ArrayList<>();
        this.calleeList = new ArrayList<>();
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

    public void setBbExit(BasicBlock b) {
        this.Exit=b;
    }

    public BasicBlock getBbExit() {
        return this.Exit;
    }

    public boolean isLibFunction(){
        return this.getName().equals("@getint") || this.getName().equals("@memset") || this.getName().equals("@printf");
    }
}
