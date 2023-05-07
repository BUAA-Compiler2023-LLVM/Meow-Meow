package IR;

import IR.Type.*;
import IR.Value.*;
import IR.Value.Instructions.*;

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

    private int calculate(int a, int b, String op){
        return switch (op){
            case "+" -> a + b;
            case "-" -> a - b;
            case "*" -> a * b;
            case "/" -> a / b;
            default -> 0;
        };
    }

    private float calculate(float a, float b, String op){
        return switch (op){
            case "+" -> a + b;
            case "-" -> a - b;
            case "*" -> a * b;
            case "/" -> a / b;
            default -> 0;
        };
    }

    private Value unifyType(Value value, Type targetTy, BasicBlock bb){
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
        return new ConstInteger(val);
    }
    public Const buildNumber(float val){
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

    public BinaryInst buildBinaryInst(Value left, Value right, String _op, BasicBlock bb){
        Type type;
        Type leftType = left.getType();
        Type rightType = right.getType();
        //  统一两个操作数的type
        //  先将1位的全部转化为I32
        if(leftType == IntegerType.I1){
            left = unifyType(left, IntegerType.I32, bb);
        }
        if(rightType == IntegerType.I1){
            right = unifyType(right, IntegerType.I32, bb);
        }
        //  此时只可能是I32或F32, 将I32强制转到F32
        if(leftType != rightType) {
            if (leftType == IntegerType.I32) {
                left = unifyType(left, FloatType.F32, bb);
            }
            else if (rightType == IntegerType.I32) {
                right = unifyType(right, FloatType.F32, bb);
            }
            type = FloatType.F32;
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
            bb.addInst(binaryInst);
        }
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

    public Const buildCalculateNumber(Const _left, Const _right, String op){
        if(_left instanceof ConstFloat left && _right instanceof ConstInteger right){
            return new ConstFloat(calculate(left.getValue(), (float) right.getValue(), op));
        }
        else if(_left instanceof ConstFloat left && _right instanceof ConstFloat right){
            return new ConstFloat(calculate(left.getValue(), right.getValue(), op));
        }
        else if(_left instanceof ConstInteger left && _right instanceof ConstInteger right){
            return new ConstInteger(calculate(left.getValue(), right.getValue(), op));
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
        if(valueTy != pointerTy.getEleType()){
            value = unifyType(value, pointerTy.getEleType(), bb);
        }
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
