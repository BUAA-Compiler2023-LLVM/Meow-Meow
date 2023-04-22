package Frontend;

import Utils.Config;

import java.io.*;

public class Lexer {

    private static final Lexer lexer;
    private final PushbackReader in = new PushbackReader(new FileReader(Config.inputFile));
    private char c;
    private int readIn;

    static {
        try {
            lexer = new Lexer();
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private boolean isAlpha(char x){
        return (x <= 'z' && x >= 'a') || (x <= 'Z' && x >= 'A');
    }

    private boolean isNumber(char x){
        return (x <= '9' && x >= '0') || x == 'X' || x == 'x';
    }

    private Lexer() throws FileNotFoundException {
    }

    public static Lexer getInstance(){
        return lexer;
    }

    private boolean isAlNum(char x){
        return (x <= 'z' && x >= 'a') || (x <= 'Z' && x >= 'A') || (x <= '9' && x >= '0');
    }

    private char readChar() throws IOException {
        readIn = in.read();
        c = (char) readIn;
        return c;
    }

    private Token Ident() throws IOException {
        StringBuilder identBuilder = new StringBuilder();
        while (isAlNum(c) || c == '_'){
            identBuilder.append(c);
            c = readChar();
        }
        in.unread(c);
        String ident = identBuilder.toString();
        return switch (ident) {
            case "main" -> new Token(Tokens.MAINTK, ident);
            case "const" -> new Token(Tokens.CONSTTK, ident);
            case "int" -> new Token(Tokens.INTTK, ident);
            case "float" -> new Token(Tokens.FLOATTK, ident);
            case "break" -> new Token(Tokens.BREAKTK, ident);
            case "continue" -> new Token(Tokens.CONTINUETK, ident);
            case "if" -> new Token(Tokens.IFTK, ident);
            case "else" -> new Token(Tokens.ELSETK, ident);
            case "while" -> new Token(Tokens.WHILETK, ident);
            case "getint" -> new Token(Tokens.GETINTTK, ident);
            case "printf" -> new Token(Tokens.PRINTFTK, ident);
            case "return" -> new Token(Tokens.RETURNTK, ident);
            case "void" -> new Token(Tokens.VOIDTK, ident);
            default -> new Token(Tokens.IDENFR, ident);
        };


    }
    private Token FString() throws IOException {
        StringBuilder FStringBuilder = new StringBuilder();
        FStringBuilder.append('"');
        while (readChar() != '"'){
            FStringBuilder.append(c);
        }
        FStringBuilder.append('"');
        String FString = FStringBuilder.toString();
        return new Token(Tokens.STRCON, FString);
    }

    private Token Number() throws IOException {
        StringBuilder numBuilder = new StringBuilder(Character.toString(c));
        while (isNumber(readChar())){
            numBuilder.append(c);
        }
        in.unread(c);
        String num = numBuilder.toString();
        return new Token(Tokens.INTCON, num);
    }

    private void Comment() throws IOException {
        if(c == '/'){
            while (c != '\n'){
                readChar();
            }
        }
        else if(c == '*'){
            readChar();
            while (true){
                if(readIn == -1) return;
                if(c == '*'){
                    if(readChar() == '/') return;
                    else {
                        in.unread(c);
                    }
                }
                readChar();
            }
        }
    }

    public Token getTok() throws IOException {
        while ((readIn = in.read()) != -1){
            c = (char)readIn;

            while (c == ' ' || c == '\t' || c == '\n'|| c == '\r'){
                readIn = in.read();
                c = (char)readIn;
            }

            if(isAlpha(c) || c == '_'){
                return Ident();
            }
            if(isNumber(c)){
                return Number();
            }
            if(c == '"'){
                return FString();
            }

            switch (c){
                case '/':
                    readChar();
                    if(c != '*' && c != '/'){
                        in.unread(c);
                        return new Token(Tokens.DIV, "/");
                    }
                    else Comment();
                    break;
                case '!':
                    if(readChar() == '=') {
                        return new Token(Tokens.NEQ, "!=");
                    }
                    else {
                        in.unread(readIn);
                        return new Token(Tokens.NOT, "!");
                    }
                case '&':
                    if(readChar() == '&'){
                        return new Token(Tokens.AND, "&&");
                    }
                case '|':
                    if(readChar() == '|'){
                        return new Token(Tokens.OR, "||");
                    }
                case '+':
                    return new Token(Tokens.PLUS, "+");
                case '-':
                    return new Token(Tokens.MINU, "-");
                case '*':
                    return new Token(Tokens.MULT, "*");
                case '%':
                    return new Token(Tokens.MOD, "%");
                case '<':
                    if(readChar() == '='){
                        return new Token(Tokens.LEQ, "<=");
                    }
                    else{
                        in.unread(readIn);
                        return new Token(Tokens.LSS, "<");
                    }
                case '>':
                    if(readChar() == '='){
                        return new Token(Tokens.GEQ, ">=");
                    }
                    else{
                        in.unread(readIn);
                        return new Token(Tokens.GRE, ">");
                    }
                case '=':
                    if(readChar() == '='){
                        return new Token(Tokens.EQL, "==");
                    }
                    else {
                        in.unread(readIn);
                        return new Token(Tokens.ASSIGN, "=");
                    }
                case ';':
                    return new Token(Tokens.SEMICN, ";");
                case ',':
                    return new Token(Tokens.COMMA, ",");
                case '(':
                    return new Token(Tokens.LPARENT, "(");
                case ')':
                    return new Token(Tokens.RPARENT, ")");
                case '[':
                    return new Token(Tokens.LBRACK, "[");
                case ']':
                    return new Token(Tokens.RBRACK, "]");
                case '{':
                    return new Token(Tokens.LBRACE, "{");
                case '}':
                    return new Token(Tokens.RBRACE, "}");
                default:
                    return null;
            }
        }
        return null;
    }

}
