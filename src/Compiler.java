import Backend.Backend;
import Frontend.*;
import IR.IRModule;
import IR.Visitor;
import Pass.PassManager;
import Utils.IRDump;
import Utils.RISC_Dump;

import java.io.IOException;

public class Compiler {

    public static void main(String[] args) throws IOException {
        TokenList tokenList = Lexer.getInstance().lex();
        AST compAST = new Parser(tokenList).parseAST();
        IRModule irModule = new Visitor().visitAST(compAST);

        PassManager passManager = PassManager.getInstance();
        passManager.runIRPasses(irModule);

        IRDump.DumpModule(irModule);

//        Backend backend = new Backend(irModule);
//        RISC_Dump.DumpBackend(backend);
    }
}
