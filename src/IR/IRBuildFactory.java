package IR;

import Frontend.AST;
import IR.Type.IntegerType;
import IR.Type.VoidType;
import IR.Value.*;
import IR.Value.Instructions.BinaryInst;
import IR.Value.Instructions.OP;
import IR.Value.Instructions.RetInst;

public class IRBuildFactory {
    private IRBuildFactory(){}

    private static final IRBuildFactory f = new IRBuildFactory();

    public static IRBuildFactory getInstance(){
        return f;
    }

    private OP str2op(String str){
        return switch (str){
            case "+" -> OP.Add;
            case "-" -> OP.Sub;
            case "*" -> OP.Mul;
            case "/" -> OP.Div;
            case "<=" -> OP.Le;
            case "<" -> OP.Lt;
            case ">=" -> OP.Ge;
            case ">" -> OP.Gt;
            case "==" -> OP.Eq;
            case "!=" -> OP.Ne;
            case "&&" -> OP.And;
            case "||" -> OP.Or;
            case "%" -> OP.Mod;
            default -> null;
        };
    }

    public Value buildNumber(int val){
        return new ConstInteger(val);
    }
    public Value buildNumber(float val){
        return new ConstFloat(val);
    }

    public BinaryInst buildBinaryInst(Value left, Value right, String op, BasicBlock bb){
        BinaryInst binaryInst = new BinaryInst(str2op(op), left, right, bb);
        bb.addInst(binaryInst);
        return binaryInst;
    }

    public RetInst buildRetInst(Value value, BasicBlock bb){
        assert value != null;
        RetInst retInst = new RetInst(bb, value);
        bb.addInst(retInst);
        return retInst;
    }

    public BasicBlock buildBasicBlock(Function parentFunc){
        BasicBlock bb = new BasicBlock(parentFunc);
        parentFunc.getBbs().add(bb.getNode());
        return bb;
    }

    public Function buildFunction(String name, String type, IRModule module){
        Function function;
        if(type.equals("int")){
            function = new Function(name, IntegerType.I32);
        }
        else {
            function = new Function(name, new VoidType());
        }
        module.addFunction(function);
        return function;
    }

}
