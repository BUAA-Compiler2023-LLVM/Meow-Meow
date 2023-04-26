package IR;

import Frontend.AST;
import IR.Type.FloatType;
import IR.Type.IntegerType;
import IR.Type.Type;
import IR.Value.*;
import IR.Value.Instructions.OP;

import java.util.ArrayList;

public class Visitor {
    private IRModule module;
    private Function CurFunction;
    private BasicBlock CurBasicBlock;
    private Value CurValue;
    private final IRBuildFactory f = IRBuildFactory.getInstance();

    private void visitPrimaryExpAST(AST.PrimaryExp primaryExpAST){
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
            visitExpAST(expAST);
        }
    }

    private void visitUnaryExpAST(AST.UnaryExp unaryExpAST){
        visitPrimaryExpAST(unaryExpAST.getPrimary());
        ArrayList<String> unaryOPs = unaryExpAST.getUnaryOps();
        int count = 0;
        for(String unaryOP : unaryOPs){
            if(unaryOP.equals("-")){
                count++;
            }
            else if(unaryOP.equals("!")){
                count = 0;
                CurValue = f.buildBinaryInst(CurValue, ConstInteger.const0, "!=", CurBasicBlock);
            }
        }
        if(count % 2 == 1){
            CurValue = f.buildBinaryInst(ConstInteger.const0, CurValue, "-", CurBasicBlock);
        }
    }

    private void visitBinaryExpAST(AST.BinaryExp binaryExpAST){
        //  将binaryExp的first赋值到CurValue上
        visitExpAST(binaryExpAST.getFirst());
        ArrayList<String> ops = binaryExpAST.getOperators();
        ArrayList<AST.Exp> exps = binaryExpAST.getFollows();
        for(int i = 0; i < ops.size(); i++){
            Value TmpValue = CurValue;
            visitExpAST(exps.get(i));
            CurValue = f.buildBinaryInst(TmpValue, CurValue, ops.get(i), CurBasicBlock);
            //  log记录错误
        }
    }

    private void visitExpAST(AST.Exp expAST){
        if(expAST instanceof AST.UnaryExp unaryExpAST){
            visitUnaryExpAST(unaryExpAST);
        }
        else if(expAST instanceof AST.BinaryExp binaryExpAST){
            visitBinaryExpAST(binaryExpAST);
        }
    }

    private void visitStmtAST(AST.Stmt stmtAST){
        if(stmtAST instanceof AST.Return retAST){
            visitExpAST(retAST.getRetExp());
            CurValue = f.buildRetInst(CurValue, CurBasicBlock);
        }
    }

    private void visitBlockItemAST(AST.BlockItem blockItemAST){
        if(blockItemAST instanceof AST.Stmt stmtAST){
            visitStmtAST(stmtAST);
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
