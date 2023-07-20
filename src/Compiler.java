import Backend.Backend;
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

        IRDump.DumpModule(irModule,"not_removed_phi.ll");

        RemovePhi rmp=new RemovePhi();
        rmp.run(irModule);

        IRDump.DumpModule(irModule,"removed_phi.ll");

        Backend backend = new Backend(irModule);
        backend.print();

//        backend.print();
        RISC_Dump.DumpBackend(backend);
    }
}
