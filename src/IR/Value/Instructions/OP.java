package IR.Value.Instructions;

public enum OP {
    Add,
    Sub,
    Mul,
    Div,
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
    Bitand
}

