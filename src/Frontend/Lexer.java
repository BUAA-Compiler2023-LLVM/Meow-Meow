package Frontend;

public class Lexer {

    private static final Lexer lexer = new Lexer();



    private boolean isAlpha(char x){
        return (x <= 'z' && x >= 'a') || (x <= 'Z' && x >= 'A');
    }

    private boolean isNumber(char x){
        return (x <= '9' && x >= '0');
    }

    private Lexer(){
    }

    public static Lexer getInstance(){
        return lexer;
    }

    public void getTok(){
        System.out.println("Hello World!");
    }
}
