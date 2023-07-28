import Backend.Backend;
import Backend.component.ObjModule;
import Backend.process.RegAllo;
import Frontend.*;
import IR.IRModule;
import IR.Visitor;
import Pass.IR.RemovePhi;
import Pass.PassManager;
import Utils.IRDump;
import Utils.RISC_Dump;

import java.io.IOException;

public class Compiler {

    public static void main(String[] args) throws IOException {
        TokenList tokenList = Lexer.getInstance().lex();
        AST compAST = new Parser(tokenList).parseAST();
        IRModule irModule = new Visitor().visitAST(compAST);

        IRDump.DumpModule(irModule,"llvm_no_opt.ll");

        PassManager passManager = PassManager.getInstance();
        passManager.runIRPasses(irModule);

        IRDump.DumpModule(irModule, "llvm.ll");

//        RemovePhi rmp=new RemovePhi();
//        rmp.run(irModule);
//
//        IRDump.DumpModule(irModule,"removed_phi.ll");
//
//        Backend backend = new Backend(irModule);
//        passManager.runObjPasses(backend.getModule());
//        RISC_Dump.DumpBackend(backend,"not_alloc_reg.asm");
//
//        RegAllo ar=new RegAllo(backend.getModule());
//        ar.process();
//        ar.allocate();
//        RISC_Dump.DumpBackend(backend,"alloc_reg.asm");
    }
}
