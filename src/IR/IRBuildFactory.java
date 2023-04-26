package IR;

import Frontend.AST;
import IR.Type.FloatType;
import IR.Type.IntegerType;
import IR.Type.Type;
import IR.Type.VoidType;
import IR.Value.*;
import IR.Value.Instructions.BinaryInst;
import IR.Value.Instructions.ConversionInst;
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
            case "+f" -> OP.Fadd;
            case "-" -> OP.Sub;
            case "-f" -> OP.Fsub;
            case "*" -> OP.Mul;
            case "*f" -> OP.Fmul;
            case "/" -> OP.Div;
            case "/f" -> OP.Fdiv;
            case "<=" -> OP.Le;
            case "<" -> OP.Lt;
            case ">=" -> OP.Ge;
            case ">" -> OP.Gt;
            case "==" -> OP.Eq;
            case "!=" -> OP.Ne;
            case "&&" -> OP.And;
            case "||" -> OP.Or;
            case "%" -> OP.Mod;
            case "ftoi" -> OP.Ftoi;
            case "itof" -> OP.Itof;
            default -> null;
        };
    }

    public Value buildNumber(int val){
        return new ConstInteger(val);
    }
    public Value buildNumber(float val){
        return new ConstFloat(val);
    }

    public ConversionInst buildConversionInst(Value value, String op, BasicBlock bb){
        Type type = null;
        if(op.equals("ftoi")) type = IntegerType.I32;
        else if(op.equals("itof")) type = FloatType.F32;
        ConversionInst conversionInst = new ConversionInst(value, type, str2op(op), bb);
        bb.addInst(conversionInst);
        return conversionInst;
    }

    public BinaryInst buildBinaryInst(Value left, Value right, String op, BasicBlock bb){
        Type type = null;
        Type leftType = left.getType();
        Type rightType = right.getType();
        if(leftType != rightType) {
            if (leftType == FloatType.F32) {
                right = buildConversionInst(right, "itof", bb);
            }
            else if (rightType == FloatType.F32) {
                left = buildConversionInst(left, "itof", bb);
            }
            type = FloatType.F32;
        }
        else type = leftType;
        if(type.isFloatTy()){
            op = op + "f";
        }
        BinaryInst binaryInst = new BinaryInst(str2op(op), left, right, type, bb);
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
