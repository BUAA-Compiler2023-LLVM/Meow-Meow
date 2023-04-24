package Utils;

import IR.IRModule;
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
            out.write("float i32 ");
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

    public static void DumpModule(IRModule irModule) throws IOException {
        ArrayList<Function> functions = irModule.getFunctions();
        for (Function function : functions) {
            DumpFunction(function);
            out.write("\n");
        }
        out.close();
    }
}
