package Utils;

import IR.IRModule;
import IR.Value.Argument;
import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.Instructions.Instruction;
import Utils.DataStruct.IList;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class IRDump {
    private static final BufferedWriter out;
    static {
        try {
            out = new BufferedWriter(new FileWriter(Config.iroutFile));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static void DumpInstruction(Instruction inst) throws IOException {
        out.write(inst.getInstString() + "\n");
    }

    private static void DumpBasicBlock(BasicBlock bb) throws IOException {
        String bbName = bb.getName();
        out.write(bbName + ":\n");
        IList<Instruction, BasicBlock> insts = bb.getInsts();
        for(IList.INode<Instruction, BasicBlock> instNode : insts){
            out.write("\t");
            DumpInstruction(instNode.getValue());
        }
    }

    private static void DumpFunction(Function function) throws IOException {
        out.write("define ");
        if(function.getType().isIntegerTy()){
            out.write("i32 ");
        }
        else if(function.getType().isFloatTy()){
            out.write("float ");
        }
        else out.write("void ");

        out.write(function.getName() + "(");

        out.write(") {\n");
        IList<BasicBlock, Function> basicBlocks = function.getBbs();

        for(IList.INode<BasicBlock, Function> bbNode : basicBlocks){
            DumpBasicBlock(bbNode.getValue());
        }

        out.write("}\n");

    }

    //  Name BasicBlock, Inst to let shit llvm run my damn program.
    private static void RenameFunction(Function function){
        int nowNum = 0;

        ArrayList<Argument> args = function.getArgs();
        for(Argument arg : args){
            arg.setName("%" + nowNum++);
        }

        IList<BasicBlock, Function> basicBlocks = function.getBbs();
        for (IList.INode<BasicBlock, Function> bbNode : basicBlocks) {
            BasicBlock basicBlock = bbNode.getValue();
            basicBlock.setName("%" + nowNum++);
            IList<Instruction, BasicBlock> instructions = basicBlock.getInsts();
            for (IList.INode<Instruction, BasicBlock> instNode : instructions) {
                Instruction inst = instNode.getValue();
                if (inst.hasName()) {
                    inst.setName("%" + nowNum++);
                }
            }
        }
    }

    public static void DumpModule(IRModule irModule) throws IOException {
        ArrayList<Function> functions = irModule.getFunctions();
        for (Function function : functions) {
            RenameFunction(function);
            DumpFunction(function);
            out.write("\n");
        }
        out.close();
    }
}
