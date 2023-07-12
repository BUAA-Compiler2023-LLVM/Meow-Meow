package IR;

import Frontend.AST;
import IR.Type.*;
import IR.Value.*;
import IR.Value.Instructions.*;

import java.awt.*;
import java.util.ArrayList;

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
            case "<=f" -> OP.FLe;
            case "<" -> OP.Lt;
            case "<f" -> OP.FLt;
            case ">=" -> OP.Ge;
            case ">=f" -> OP.FGe;
            case ">" -> OP.Gt;
            case ">f" -> OP.FGt;
            case "==" -> OP.Eq;
            case "==f" -> OP.FEq;
            case "!=" -> OP.Ne;
            case "!=f" -> OP.FNe;
            case "&&" -> OP.And;
            case "||" -> OP.Or;
            case "%" -> OP.Mod;
            case "ftoi" -> OP.Ftoi;
            case "itof" -> OP.Itof;
            case "zext" -> OP.Zext;
            default -> null;
        };
    }

    private int calculate(int a, int b, String op){
        return switch (op){
            case "+" -> a + b;
            case "-" -> a - b;
            case "*" -> a * b;
            case "/" -> a / b;
            case "%" -> a % b;
            case "<" -> a < b ? 1 : 0;
            case "<=" -> a <= b ? 1 : 0;
            case ">" -> a > b ? 1 : 0;
            case ">=" -> a >= b ? 1 : 0;
            case "==" -> a == b ? 1 : 0;
            case "!=" -> a != b ? 1 : 0;
            default -> 0;
        };
    }

    private float calculate(float a, float b, String op){
        return switch (op){
            case "+" -> a + b;
            case "-" -> a - b;
            case "*" -> a * b;
            case "/" -> a / b;
            case "%" -> a % b;
            case "<" -> a < b ? 1 : 0;
            case "<=" -> a <= b ? 1 : 0;
            case ">" -> a > b ? 1 : 0;
            case ">=" -> a >= b ? 1 : 0;
            case "==" -> a == b ? 1 : 0;
            case "!=" -> a != b ? 1 : 0;
            default -> 0;
        };
    }

    private ArrayType getArrayType(ArrayList<Integer> indexs, Type eleType){
        if(indexs.size() == 1){
            return new ArrayType(indexs.get(0), eleType);
        }

        ArrayList<Integer> newIndexs = new ArrayList<>();
        for(int i = 1; i < indexs.size(); i++){
            newIndexs.add(indexs.get(i));
        }
        Type type = getArrayType(newIndexs, eleType);
        return new ArrayType(indexs.get(0), type);
    }

    public GlobalVar buildGlobalArray(String name, Type eleType, ArrayList<Integer> indexs, ArrayList<Value> values){
        ArrayType arrayType = getArrayType(indexs, eleType);
        return new GlobalVar("@" + name, new PointerType(arrayType), values);
    }

    //  传入一个指向目标数组的指针
    public GepInst buildGepInst(Value target, ArrayList<Value> indexs, BasicBlock bb){
        Type type = ((PointerType) target.getType()).getEleType();
        for(int i = 0; i < indexs.size() - 1; i++){
            type = ((ArrayType) type).getEleType();
        }

        GepInst gepInst = new GepInst(target, indexs, new PointerType(type), bb);
        bb.addInst(gepInst);
        return gepInst;
    }

    public Value buildArray(Type eleType, ArrayList<Integer> indexs, BasicBlock bb){
        ArrayType arrayType = getArrayType(indexs, eleType);
        return buildAllocInst(arrayType, bb);
    }

    private void buildCallRelation(Function caller, Function callee){
        if(callee.isLibFunction()) return;
        if(!callee.getCallerList().contains(caller)) {
            callee.addCaller(caller);
        }
        if(!caller.getCalleeList().contains(callee)){
            caller.addCallee(callee);
        }
    }

    private Value turnType(Value value, Type targetTy, BasicBlock bb){
        Type type = value.getType();
        if(type == IntegerType.I1 && targetTy == IntegerType.I32){
            return buildConversionInst(value, "zext", bb);
        }
        else if(type == IntegerType.I32 && targetTy == FloatType.F32){
            return buildConversionInst(value, "itof", bb);
        }
        else if(type == FloatType.F32 && targetTy == IntegerType.I32){
            return buildConversionInst(value, "ftoi", bb);
        }
        return null;
    }

    public Const buildNumber(int val){
        return new ConstInteger(val, IntegerType.I32);
    }
    public Const buildNumber(float val){
        return new ConstFloat(val);
    }

    public GlobalVar buildGlobalVar(String name, Type type, Value value){
        return new GlobalVar("@" + name, new PointerType(type), value);
    }

    public ConversionInst buildConversionInst(Value value, String op, BasicBlock bb){
        Type type = switch (op) {
            case "ftoi", "zext" -> IntegerType.I32;
            case "itof" -> FloatType.F32;
            default -> null;
        };
        ConversionInst conversionInst = new ConversionInst(value, type, str2op(op), bb);
        bb.addInst(conversionInst);
        return conversionInst;
    }

    public BinaryInst buildBinaryInst(Value left, Value right, String _op, BasicBlock bb){
        Type type;
        Type leftType = left.getType();
        Type rightType = right.getType();
        if(leftType != rightType) {
            //  先将1位的全部转化为I32
            if(leftType == IntegerType.I1){
                left = turnType(left, IntegerType.I32, bb);
            }
            if(rightType == IntegerType.I1){
                right = turnType(right, IntegerType.I32, bb);
            }
            type = IntegerType.I32;
        }
        else type = leftType;
        if(type.isFloatTy()){
            _op = _op + "f";
        }

        OP op = str2op(_op);
        BinaryInst binaryInst;
        if(op.isCmpOP()){
            binaryInst = new CmpInst(op, left, right, bb);
        }
        else {
            binaryInst = new BinaryInst(op, left, right, type, bb);
        }
        bb.addInst(binaryInst);
        return binaryInst;
    }

    public CallInst buildCallInst(Function callFunc, ArrayList<Value> values, BasicBlock bb){
        CallInst callInst = new CallInst(callFunc, values, bb);
        bb.addInst(callInst);

        buildCallRelation(bb.getParentFunc(), callFunc);
        return callInst;
    }

    public Argument buildArgument(String name, String typeStr, Function parentFunc){
        Argument argument;
        if (typeStr.equals("int")) argument = new Argument(name, IntegerType.I32, parentFunc);
        else if (typeStr.equals("float")) argument = new Argument(name, FloatType.F32, parentFunc);
        else if(typeStr.equals("int*")) argument = new Argument(name, new PointerType(IntegerType.I32), parentFunc);
        else argument = new Argument(name, VoidType.voidType, parentFunc);
        parentFunc.addArg(argument);
        return argument;
    }

    public Argument buildArgument(String name, String typeStr, Function parentFunc, ArrayList<Integer> indexs){
        Type eleType;
        if(typeStr.equals("int")) eleType = IntegerType.I32;
        else eleType = FloatType.F32;
        Type type = new PointerType(getArrayType(indexs, eleType));
        Argument argument = new Argument(name, type, parentFunc);

        parentFunc.addArg(argument);
        return argument;
    }

    public void buildRetInst(BasicBlock bb){
        Value voidValue = new Value("void", VoidType.voidType);
        RetInst retInst = new RetInst(bb, voidValue);
        bb.addInst(retInst);
    }

    public RetInst buildRetInst(Value value, BasicBlock bb){
        assert value != null;
        RetInst retInst = new RetInst(bb, value);
        bb.addInst(retInst);
        return retInst;
    }

    public void buildBrInst(BasicBlock jumpBB, BasicBlock bb){
        BrInst brInst = new BrInst(jumpBB, bb);
        bb.addInst(brInst);
        //  前驱后继关系
        bb.getNxtBlocks().clear();
        bb.setNxtBlock(jumpBB);
        jumpBB.setPreBlock(bb);
    }

    public void buildBrInst(Value judVal, BasicBlock trueBlock, BasicBlock falseBlock, BasicBlock bb){
        BrInst brInst = new BrInst(judVal, trueBlock, falseBlock, bb);
        bb.addInst(brInst);
        //  前驱后继关系
        bb.getNxtBlocks().clear();
        bb.setNxtBlock(trueBlock);
        bb.setNxtBlock(falseBlock);
        trueBlock.setPreBlock(bb);
        falseBlock.setPreBlock(bb);
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
            function = new Function(name, VoidType.voidType);
        }
        module.addFunction(function);
        return function;
    }

    public Const buildCalculateNumber(Const _left, Const _right, String op){
        if(_left instanceof ConstFloat left && _right instanceof ConstInteger right){
            return new ConstFloat(calculate(left.getValue(), (float) right.getValue(), op));
        }
        else if(_left instanceof ConstFloat left && _right instanceof ConstFloat right){
            return new ConstFloat(calculate(left.getValue(), right.getValue(), op));
        }
        else if(_left instanceof ConstInteger left && _right instanceof ConstInteger right){
            return new ConstInteger(calculate(left.getValue(), right.getValue(), op), IntegerType.I32);
        }
        else if(_left instanceof ConstInteger left && _right instanceof ConstFloat right){
            return new ConstFloat(calculate((float) left.getValue(), right.getValue(), op));
        }
        return null;
    }

    public AllocInst buildAllocInst(Type type, BasicBlock bb){
        Type pointerTy = new PointerType(type);
        AllocInst allocInst = new AllocInst(pointerTy, bb);
        bb.addInst(allocInst);
        return allocInst;
    }

    public void buildStoreInst(Value value, Value pointer, BasicBlock bb){
        Type valueTy = value.getType();
        PointerType pointerTy = (PointerType) pointer.getType();
        StoreInst storeInst = new StoreInst(value, pointer, bb);
        bb.addInst(storeInst);
    }

    public LoadInst buildLoadInst(Value pointer, BasicBlock bb){
        Type type = ((PointerType) pointer.getType()).getEleType();
        LoadInst loadInst = new LoadInst(pointer, type, bb);
        bb.addInst(loadInst);
        return loadInst;
    }
}
