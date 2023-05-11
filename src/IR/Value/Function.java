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

    //  Function的Type就是它返回值的type
    public Function(String name, Type type){
        super(name, type);
        this.bbs = new IList<>(this);
        this.args = new ArrayList<>();
    }
    public Function(String name, Type type, IList<BasicBlock, Function> bbs, ArrayList<Argument> args){
        super(name, type);
        this.bbs = bbs;
        this.args = args;
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
