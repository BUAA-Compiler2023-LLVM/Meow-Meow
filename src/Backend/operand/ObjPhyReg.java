package Backend.operand;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

public class ObjPhyReg extends ObjReg {
    private final static HashMap<Integer, String> indexToName = new HashMap<>();
    private final static HashMap<String, Integer> nameToIndex = new HashMap<>();
    public final static ArrayList<ObjPhyReg> A = new ArrayList<>();

    static {
        indexToName.put(0, "zero");
        indexToName.put(1, "ra");
        indexToName.put(2, "sp");
        indexToName.put(3, "gp");
        indexToName.put(4, "tp");
        indexToName.put(5, "t0");
        indexToName.put(6, "t1");
        indexToName.put(7, "t2");
        indexToName.put(8, "fp");
        indexToName.put(9, "s1");


        indexToName.put(10, "a0");
        indexToName.put(11, "a1");

        for(int i = 12; i <= 17; i ++)
            indexToName.put(i, "a" + String.valueOf(i - 10));
        for(int i = 18; i <= 27; i ++)
            indexToName.put(i, "s" + String.valueOf(i - 16));
        for(int i = 28; i <= 31; i ++)
            indexToName.put(i, "t" + String.valueOf(i - 25));

        for (Map.Entry<Integer, String> entry : indexToName.entrySet())
            nameToIndex.put(entry.getValue(), entry.getKey());

        for (int i = 0; i < 8; i ++)
            A.add(new ObjPhyReg("a" + String.valueOf(i)));
    }
    public final static ObjPhyReg ZERO = new ObjPhyReg("zero");
    // public final static ObjPhyReg A0 = new ObjPhyReg("a0");
    public final static ObjPhyReg SP = new ObjPhyReg("sp");
    public final static ObjPhyReg RA = new ObjPhyReg("ra");
    private final int index;
    private final String name;
    private boolean isAllocated;

    public ObjPhyReg(String name) {
        this.name = name;
        this.index = nameToIndex.get(name);
        this.isAllocated = false;
    }
    public ObjPhyReg(int index) {
        this.name = indexToName.get(index);
        this.index = index;
        this.isAllocated = false;
    }
    public ObjPhyReg(int index, boolean isAllocated) {
        this.name = indexToName.get(index);
        this.index = index;
        this.isAllocated = isAllocated;
    }
    public void setAllocated(boolean isAllocated) {
        this.isAllocated = isAllocated;
    }
    public int getIndex() {
        return index;
    }

    @Override
    public String toString() {
        return "$" + name;
    }
}
