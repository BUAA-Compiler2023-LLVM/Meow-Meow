package IR;

import Frontend.AST;
import IR.Type.FloatType;
import IR.Type.IntegerType;
import IR.Type.PointerType;
import IR.Type.Type;
import IR.Value.*;
import IR.Value.Instructions.AllocInst;
import IR.Value.Instructions.OP;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class Visitor {
    private IRModule module;
    private Function CurFunction;
    private BasicBlock CurBasicBlock;
    private Value CurValue;
    //  符号表
    private final HashMap<String, Value> symTbl = new HashMap<>();
    private final IRBuildFactory f = IRBuildFactory.getInstance();

    private Value find(String ident){
        return symTbl.get(ident);
    }

    //  isFetch表示当目标变量为指针的情况是否要取值
    //  true返回值，false返回指针
    private void visitLValAST(AST.LVal lValAST, boolean isFetch){
        String ident = lValAST.getIdent();
        CurValue = find(ident);

        if(CurValue.getType() instanceof PointerType){
            if(isFetch) {
                CurValue = f.buildLoadInst(CurValue, CurBasicBlock);
            }
        }
    }

    private void visitPrimaryExpAST(AST.PrimaryExp primaryExpAST, boolean isConst){
        if(primaryExpAST instanceof AST.Number number){
            if(number.isIntConst){
                CurValue = f.buildNumber(number.getIntConstVal());
            }
            else if(number.isFloatConst){
                CurValue = f.buildNumber(number.getFloatConstVal());
            }
            assert false;
        }
        else if(primaryExpAST instanceof AST.Exp expAST){
            visitExpAST(expAST, isConst);
        }
        else if(primaryExpAST instanceof AST.LVal lValAST){
            visitLValAST(lValAST, true);
        }
    }

    private void visitUnaryExpAST(AST.UnaryExp unaryExpAST, boolean isConst){
        visitPrimaryExpAST(unaryExpAST.getPrimary(), isConst);
        ArrayList<String> unaryOPs = unaryExpAST.getUnaryOps();
        int count = 0;
        for (String unaryOP : unaryOPs) {
            if (unaryOP.equals("-")) {
                count++;
            } else if (unaryOP.equals("!")) {
                count = 0;
                CurValue = f.buildBinaryInst(CurValue, ConstInteger.const0, "!=", CurBasicBlock);
            }
        }
        if (count % 2 == 1) {
            if(CurValue instanceof ConstInteger constInt){
                CurValue = f.buildNumber(-constInt.getValue());
            }
            else if(CurValue instanceof ConstFloat constFloat){
                CurValue = f.buildNumber(-constFloat.getValue());
            }
            else {
                CurValue = f.buildBinaryInst(ConstInteger.const0, CurValue, "-", CurBasicBlock);
            }
        }
    }

    private void visitBinaryExpAST(AST.BinaryExp binaryExpAST, boolean isConst){
        //  将binaryExp的first赋值到CurValue上
        visitExpAST(binaryExpAST.getFirst(), isConst);
        ArrayList<String> ops = binaryExpAST.getOperators();
        ArrayList<AST.Exp> exps = binaryExpAST.getFollows();
        for(int i = 0; i < ops.size(); i++){
            Value TmpValue = CurValue;
            visitExpAST(exps.get(i), isConst);

            if(TmpValue instanceof Const left && CurValue instanceof Const right){
                CurValue = f.buildCalculateNumber(left, right, ops.get(i));
            }
            else {
                CurValue = f.buildBinaryInst(TmpValue, CurValue, ops.get(i), CurBasicBlock);
            }
        }
    }

    private void visitExpAST(AST.Exp expAST, boolean isConst){
        if(expAST instanceof AST.UnaryExp unaryExpAST){
            visitUnaryExpAST(unaryExpAST, isConst);
        }
        else if(expAST instanceof AST.BinaryExp binaryExpAST){
            visitBinaryExpAST(binaryExpAST, isConst);
        }
    }

    private void visitStmtAST(AST.Stmt stmtAST){
        if(stmtAST instanceof AST.Return retAST){
            visitExpAST(retAST.getRetExp(), false);
            CurValue = f.buildRetInst(CurValue, CurBasicBlock);
        }
        else if(stmtAST instanceof AST.Assign assignAST){
            visitLValAST(assignAST.getLVal(), false);
            Value pointer = CurValue;
            visitExpAST(assignAST.getValue(), false);
            f.buildStoreInst(CurValue, pointer, CurBasicBlock);
        }
    }

    private void visitDeclAST(AST.Decl declAST){
        boolean isConst = declAST.isConstant();
        String type = declAST.getBType();
        ArrayList<AST.Def> defs = declAST.getDefs();
        //  ConstDecl
        if(isConst) {
            for (AST.Def def : defs) {
                String ident = def.getIdent();
                AST.Init init = def.getInit();

                if (init instanceof AST.Exp expAST) {
                    visitExpAST(expAST, true);
                    //  根据定义纠正类型
                    if(type.equals("int") && CurValue.getType().isFloatTy()){
                        CurValue = f.buildNumber((int) ((ConstFloat) CurValue).getValue());
                    }
                    else if(type.equals("float") && CurValue.getType().isIntegerTy()){
                        CurValue = f.buildNumber((float) ((ConstInteger) CurValue).getValue());
                    }
                    //  push进符号表
                    symTbl.put(ident, CurValue);
                }
            }
        }
        //  VarDecl
        else{
            for(AST.Def def : defs){
                String ident = def.getIdent();
                AST.Init init = def.getInit();

                if(type.equals("int")){
                    CurValue = f.buildAllocInst(IntegerType.I32, CurBasicBlock);
                }
                else if(type.equals("float")){
                    CurValue = f.buildAllocInst(FloatType.F32, CurBasicBlock);
                }
                symTbl.put(ident, CurValue);
                if (init instanceof AST.Exp expAST){
                    Value TmpValue = CurValue;
                    visitExpAST(expAST, false);

                    f.buildStoreInst(CurValue, TmpValue, CurBasicBlock);
                }
            }
        }
    }

    private void visitBlockItemAST(AST.BlockItem blockItemAST){
        if(blockItemAST instanceof AST.Stmt stmtAST){
            visitStmtAST(stmtAST);
        }
        else if(blockItemAST instanceof AST.Decl declAST){
            visitDeclAST(declAST);
        }
    }

    private void visitBlockAST(AST.Block blockAST){
        ArrayList<AST.BlockItem> blockItemASTS = blockAST.getItems();
        for(AST.BlockItem blockItemAST : blockItemASTS){
            visitBlockItemAST(blockItemAST);
        }
    }

    private void visitFuncDefAST(AST.FuncDef funcDefAST){
        String ident = funcDefAST.getIdent();
        String type = funcDefAST.getType();
        CurFunction = f.buildFunction(ident, type, module);
        CurBasicBlock = f.buildBasicBlock(CurFunction);
        visitBlockAST(funcDefAST.getBody());
    }

    public IRModule visitAST(AST compAST){
        ArrayList<Function> functions = new ArrayList<>();
        ArrayList<GlobalVar> globalVars = new ArrayList<>();

        module = new IRModule(functions, globalVars);

        for(AST.CompUnit compUnit : compAST.getUnits()){
            if(compUnit instanceof AST.FuncDef funcDefAST){
                visitFuncDefAST(funcDefAST);
            }
        }

        return module;
    }
}
