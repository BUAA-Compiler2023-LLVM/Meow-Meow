package Backend;

import Backend.component.ObjModule;
import Backend.process.IrParser;
import Backend.process.LiveVar;
import IR.IRModule;

public class Backend {

    private ObjModule objModule;
    public Backend(IRModule irModule) {
        IrParser irParser = new IrParser(irModule);
        this.objModule = irParser.parseModule();
    }
    public ObjModule getModle() {
        return objModule;
    }
    public void print() {
        this.objModule.print();
    }
    public static void Alloreg(IRModule irModule)
    {
        LiveVar.Analysis(irModule);
    }
}
