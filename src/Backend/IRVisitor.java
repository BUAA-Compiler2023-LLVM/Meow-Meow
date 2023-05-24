package Backend;

import IR.IRModule;
import IR.Value.*;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.RetInst;
import Utils.DataStruct.IList;

public class IRVisitor {
    public void visit_irModule(IRModule irModule) {
        System.out.println("    .text");
        System.out.println("    .globl main");
        System.out.println("main:");
        for(GlobalVar g : irModule.getGlobalVars())
            visit_ir_globavar(g);
        for(Function f : irModule.getFunctions())
            visit_ir_function(f);
    }
    private void visit_ir_globavar(GlobalVar g) {

    }
    private void visit_ir_function(Function f) {
        for(IList.INode<BasicBlock, Function> bbNode : f.getBbs())
            visit_ir_bbs(bbNode.getValue());
    }
    private void visit_ir_bbs(BasicBlock bbs) {
        for(IList.INode<Instruction, BasicBlock> iNode : bbs.getInsts())
            visit_ir_inst(iNode.getValue());
    }
    private void visit_ir_inst(Instruction inst) {
        if(inst instanceof RetInst)
            visit_ir_Retinst((RetInst) inst);
    }

    private void visit_ir_Retinst(RetInst inst) {
        System.out.print("    li a0, ");
        Value value = inst.getValue();
        if(value instanceof ConstInteger constInt)
            System.out.println(constInt.getValue());
        System.out.println("    ret");
    }
}
