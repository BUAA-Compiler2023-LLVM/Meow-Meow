import Frontend.*;

import java.io.IOException;

public class Compiler {

    public static void main(String[] args) throws IOException {
        TokenList tokenList = Lexer.getInstance().lex();
        AST compAST = new Parser(tokenList).parseAST();

    }
}
