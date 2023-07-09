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
        return (x <= '9' && x >= '0');
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
            case "main" -> new Token(TokenType.MAINTK, ident);
            case "const" -> new Token(TokenType.CONSTTK, ident);
            case "int" -> new Token(TokenType.INTTK, ident);
            case "float" -> new Token(TokenType.FLOATTK, ident);
            case "break" -> new Token(TokenType.BREAKTK, ident);
            case "continue" -> new Token(TokenType.CONTINUETK, ident);
            case "if" -> new Token(TokenType.IFTK, ident);
            case "else" -> new Token(TokenType.ELSETK, ident);
            case "while" -> new Token(TokenType.WHILETK, ident);
            case "getint" -> new Token(TokenType.GETINTTK, ident);
            case "printf" -> new Token(TokenType.PRINTFTK, ident);
            case "return" -> new Token(TokenType.RETURNTK, ident);
            case "void" -> new Token(TokenType.VOIDTK, ident);
            default -> new Token(TokenType.IDENFR, ident);
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
        return new Token(TokenType.STRCON, FString);
    }

    private Token Number() throws IOException {
        boolean isFloat = false;
        boolean isHex = false;
        boolean isOct;
        StringBuilder numBuilder = new StringBuilder();
        isOct = (c == '0');
        while (isNumber(c) || c == 'x' || c == 'X' || c == '.'){
            numBuilder.append(c);
            if(c == '.'){
                isFloat = true;
                isOct = false;
            }
            if(c == 'X' || c == 'x'){
                isHex = true;
                isOct = false;
            }
            readChar();
        }
        in.unread(c);
        String num = numBuilder.toString();
        if(num.equals("0")) isOct = false;
        if(isFloat) return new Token(TokenType.FLOATCON, num);
        else if(isHex) return new Token(TokenType.HEXCON, num);
        else if(isOct) return new Token(TokenType.OCTCON, num);
        else return new Token(TokenType.DECCON, num);
    }

    private void Comment() throws IOException {
        if(c == '/'){
            while (c != '\n' && c != '\uFFFF'){
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

    private Token getTok() throws IOException {
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
                        return new Token(TokenType.DIV, "/");
                    }
                    else Comment();
                    break;
                case '!':
                    if(readChar() == '=') {
                        return new Token(TokenType.NEQ, "!=");
                    }
                    else {
                        in.unread(readIn);
                        return new Token(TokenType.NOT, "!");
                    }
                case '&':
                    if(readChar() == '&'){
                        return new Token(TokenType.AND, "&&");
                    }
                case '|':
                    if(readChar() == '|'){
                        return new Token(TokenType.OR, "||");
                    }
                case '+':
                    return new Token(TokenType.PLUS, "+");
                case '-':
                    return new Token(TokenType.MINU, "-");
                case '*':
                    return new Token(TokenType.MULT, "*");
                case '%':
                    return new Token(TokenType.MOD, "%");
                case '<':
                    if(readChar() == '='){
                        return new Token(TokenType.LEQ, "<=");
                    }
                    else{
                        in.unread(readIn);
                        return new Token(TokenType.LSS, "<");
                    }
                case '>':
                    if(readChar() == '='){
                        return new Token(TokenType.GEQ, ">=");
                    }
                    else{
                        in.unread(readIn);
                        return new Token(TokenType.GRE, ">");
                    }
                case '=':
                    if(readChar() == '='){
                        return new Token(TokenType.EQL, "==");
                    }
                    else {
                        in.unread(readIn);
                        return new Token(TokenType.ASSIGN, "=");
                    }
                case ';':
                    return new Token(TokenType.SEMICN, ";");
                case ',':
                    return new Token(TokenType.COMMA, ",");
                case '(':
                    return new Token(TokenType.LPARENT, "(");
                case ')':
                    return new Token(TokenType.RPARENT, ")");
                case '[':
                    return new Token(TokenType.LBRACK, "[");
                case ']':
                    return new Token(TokenType.RBRACK, "]");
                case '{':
                    return new Token(TokenType.LBRACE, "{");
                case '}':
                    return new Token(TokenType.RBRACE, "}");
                default:
                    return null;
            }
        }
        return null;
    }

    public TokenList lex() throws IOException {
        TokenList tokenList = new TokenList();
        while (true){
            Token token = this.getTok();
            if(token == null) break;
            tokenList.addToken(token);
        }
        return tokenList;
    }
}
