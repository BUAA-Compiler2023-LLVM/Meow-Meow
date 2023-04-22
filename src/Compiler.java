import Frontend.Lexer;
import Frontend.Token;

import java.io.IOException;

public class Compiler {

    public static void main(String[] args) throws IOException {
        Lexer lexer = Lexer.getInstance();
        while (true){
            Token tok = lexer.getTok();
            if(tok == null) break;
            System.out.println(tok.getVal());
        }
    }
}
