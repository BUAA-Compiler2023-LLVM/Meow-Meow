import Backend.Backend;
import Frontend.*;
import IR.IRModule;
import IR.Visitor;
import Utils.IRDump;

import java.io.IOException;

public class Compiler {

    public static void main(String[] args) throws IOException {
        TokenList tokenList = Lexer.getInstance().lex();
        AST compAST = new Parser(tokenList).parseAST();
        IRModule irModule = new Visitor().visitAST(compAST);

        IRDump.DumpModule(irModule);
//
//        Backend backend = new Backend(irModule);
//        backend.print();
    }
}
