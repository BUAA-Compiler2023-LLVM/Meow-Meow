package Backend.component;

import IR.Type.ArrayType;
import IR.Type.Type;

import java.util.ArrayList;

public class ObjGlobalVariable {
    private String name;
    private boolean isInit, isStr;
    private int size;

    private ArrayList<Integer> elements;

    private String content;

    public String getName() {
        return name;
    }

    public ObjGlobalVariable(String name, ArrayList<Integer> elements) {
        this.name = name.substring(1);
        this.isInit = true;
        this.isStr = false;
        this.size = 4 * elements.size();
        this.elements = elements;
        this.content = null;
    }

    public ObjGlobalVariable(String name, int size) {
        this.name = name.substring(1);
        this.isInit = false;
        this.isStr = false;
        this.size = size;
        this.elements = null;
        this.content = null;
    }

    public ObjGlobalVariable(String name, String content) {
        this.name = name.substring(1);
        this.isInit = true;
        this.isStr = true;
        this.size = content.length() + 1;
        this.elements = null;
        this.content = content;
    }

    public boolean isInit() {
        return isInit;
    }
    public boolean isStr() {
        return isStr;
    }

    @Override
    public String toString() {
        String output = "\t.globl\t" + name + "\n";
        if(isInit)
            output += "\t.data\n";
        else output += "\t.bss\n";
        output += "\t.type\t" + name + ",\t" + "@object\n";
        output += "\t.size\t" + name + ",\t" + String.valueOf(size) + "\n";
        output += name + ":\n";

        if(isInit) {
            if(isStr) {
                output += "\t.ascii\t" + content;
                if(content.length() < size)
                    output += "\t.zero\t" + String.valueOf(size - content.length()) + "\n";
            }
            else {
                for (int value : elements)
                    output += "\t.word\t" + String.valueOf(value) + "\n";
                if(elements.size() * 4 < size) {
                    int last_size = size - elements.size() * 4;
                    output += "\t.zero\t" + String.valueOf(last_size) + "\n";
                }
            }
        }
        else
            output += "\t.zero\t" + String.valueOf(size) + "\n";
        return output;
    }
}
