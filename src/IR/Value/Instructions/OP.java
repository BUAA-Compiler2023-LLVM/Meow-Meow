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
    FLt,
    Le,
    FLe,
    Ge,
    FGe,
    Gt,
    FGt,
    Eq,
    FEq,
    Ne,
    FNe,
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
    Not,
    Move,
    BitCast;

    public boolean isCmpOP(){
        String name = name();
        return switch (name) {
            case "Ne", "FNe", "Eq", "FEq", "Lt", "Le", "FLt", "Gt", "FLe", "FGt", "Ge", "FGe" -> true;
            default -> false;
        };
    }

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
            case "Div" -> "sdiv";
            case "Fdiv" -> "fdiv";
            case "Mod" -> "srem";
            case "Ne" -> "icmp ne";
            case "FNe" -> "fcmp one";
            case "Eq" -> "icmp eq";
            case "FEq" -> "fcmp oeq";
            case "Lt" -> "icmp slt";
            case "FLt" -> "fcmp olt";
            case "Le" -> "icmp sle";
            case "FLe" -> "fcmp ole";
            case "Gt" -> "icmp sgt";
            case "FGt" -> "fcmp ogt";
            case "Ge" -> "icmp sge";
            case "FGe" -> "fcmp oge";

            case "Ftoi" -> "fptosi";
            case "Itof" -> "sitofp";
            case "Zext" -> "zext";
            case "BitCast" -> "bitcast";
            case "Move" -> "move";
            default -> null;
        };
    }
}

