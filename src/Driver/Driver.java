package Driver;

import Backend.Backend;
import Backend.process.RegAllo;
import Frontend.AST;
import Frontend.Lexer;
import Frontend.Parser;
import Frontend.TokenList;
import IR.IRModule;
import IR.Visitor;
import Pass.IR.RemovePhi;
import Pass.PassManager;
import Utils.IRDump;
import Utils.RISC_Dump;

import java.io.IOException;

public class Driver {
    public void run(String[] args) throws IOException {
        parseArgs(args);
        TokenList tokenList = Lexer.getInstance().lex();
        AST compAST = new Parser(tokenList).parseAST();
        IRModule irModule = new Visitor().visitAST(compAST);

        if(Config.outputLLVM) {
            IRDump.DumpModule(irModule, "llvm_no_opt.ll");
        }

        PassManager passManager = PassManager.getInstance();
        passManager.runIRPasses(irModule);

        if(Config.outputLLVM) {
            IRDump.DumpModule(irModule, "llvm.ll");
        }

        RemovePhi rmp=new RemovePhi();
        rmp.run(irModule);

        if(Config.outputLLVM) {
            IRDump.DumpModule(irModule, "removed_phi.ll");
        }

        Backend backend = new Backend(irModule);
        passManager.runObjPasses(backend.getModule());
        RISC_Dump.DumpBackend(backend,"riscv_withno_alloc.s");

        RegAllo ar=new RegAllo(backend.getModule());
        ar.run();
        RISC_Dump.DumpBackend(backend,"riscv.s");
    }

    private void parseArgs(String[] args){
        int length = args.length;
        if(length == 5 && args[4].equals("-O1")){
            Config.isO1 = true;
        }
        Config.outputFile = args[2];
        Config.inputFile = args[3];
    }
}
