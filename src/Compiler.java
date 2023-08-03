import Backend.Backend;
import Backend.component.ObjModule;
import Backend.process.RegAllo;
import Driver.Driver;
import Frontend.*;
import IR.IRModule;
import IR.Visitor;
import Pass.IR.RemovePhi;
import Pass.PassManager;
import Utils.IRDump;
import Utils.RISC_Dump;

import java.io.IOException;

public class Compiler {

    public static void main(String[] args) throws IOException {
        Driver driver = new Driver();
        driver.run(args);
    }
}
