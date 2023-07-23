package Utils;

import Backend.Backend;
import Backend.component.ObjBlock;
import Backend.component.ObjFunction;
import Backend.component.ObjGlobalVariable;
import Backend.component.ObjModule;
import Backend.instruction.ObjInstr;
import Utils.DataStruct.IList;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class RISC_Dump {
    private static final BufferedWriter out;
    static {
        try {
            out = new BufferedWriter(new FileWriter(Config.outputFile));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void DumpObjBlocks(ObjBlock objBlock) throws IOException {
        out.write(objBlock.getName() + ":\n");
        // System.out.println(objBlock.getName());
        for(IList.INode<ObjInstr, ObjBlock> instr : objBlock.getInstrs()) {
            ObjInstr i = instr.getValue();
            // System.out.println("\t" + i.toString());
            out.write("\t" + i.toString() + "\n");
        }
    }

    public static void DumpObjFunction(ObjFunction objFunction) throws IOException {
        out.write(objFunction.getName() + ":\n");
        // System.out.println(objFunction.getName());
        IList <ObjBlock, ObjFunction> bs = objFunction.getObjBlocks();
        for(IList.INode<ObjBlock, ObjFunction> b : bs)
            DumpObjBlocks(b.getValue());
    }

    public static void DumpObjModle(ObjModule objModule) throws IOException {

        ArrayList<ObjGlobalVariable> globalVariables = objModule.getGlobalVariables();
        for (ObjGlobalVariable g : globalVariables)
            out.write(g.toString() + "\n");

        ArrayList<ObjFunction> functions = objModule.getFunctions();
        for(ObjFunction f : functions)
            DumpObjFunction(f);
    }

    public static void DumpBackend(Backend backend) throws IOException {
        DumpObjModle(backend.getModule());
        out.close();
    }
}
