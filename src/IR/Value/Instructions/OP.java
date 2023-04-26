package IR.Value.Instructions;

public enum OP {
    Add,
    Fadd,
    Sub,
    Fsub,
    Mul,
    Fmul,
    Div,
    Fdiv,
    Mod,
    Shl,
    Shr,
    And,
    Or,
    Xor,
    Lt,
    Le,
    Ge,
    Gt,
    Eq,
    Ne,
    //conversion op
    Zext,
    Ftoi,
    Itof,
    //Mem
    Alloca,
    Load,
    Store,
    GEP, //get element ptr
    Phi,
    MemPhi,
    LoadDep,
    //vector op
    InsertEle,
    ExtractEle,
    //terminator op
    Br,
    Call,
    Ret,
    //not op
    Not;

    @Override
    public String toString(){
        String name = name();
        return switch (name) {
            case "Add" -> "add";
            case "Fadd" -> "fadd";
            case "Sub" -> "sub";
            case "Fsub" -> "fsub";
            case "Mul" -> "mul";
            case "Fmul" -> "fmul";
            case "Div" -> "div";
            case "Fdiv" -> "fdiv";
            case "Ne" -> "icmp ne";
            case "Ftoi" -> "fptosi";
            case "Itof" -> "sitofp";

            default -> null;
        };
    }
}

