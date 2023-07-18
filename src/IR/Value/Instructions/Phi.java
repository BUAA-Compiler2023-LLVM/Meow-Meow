package IR.Value.Instructions;

import IR.Type.Type;
import IR.Value.BasicBlock;
import IR.Value.Value;
import Utils.DataStruct.Pair;

import java.util.ArrayList;

public class Phi extends Instruction {

    public Phi(Type type, ArrayList<Value> values) {
        super("%" + (++Value.valNumber), type, OP.Phi);
        for(Value value : values){
            addOperand(value);
        }
    }

    public ArrayList<Pair<Value, BasicBlock>> getPhiValues(){
        ArrayList<Pair<Value, BasicBlock>> phiValues = new ArrayList<>();
        ArrayList<Value> useValues = getUseValues();
        for (int i = 0; i < useValues.size(); i++) {
            Value value = useValues.get(i);
            BasicBlock bb = getParentbb().getPreBlocks().get(i);
            phiValues.add(new Pair<>(value, bb));
        }
        return phiValues;
    }

    @Override
    public String getInstString() {
        ArrayList<Value> useValues = getUseValues();
        StringBuilder sb = new StringBuilder();
        sb.append(getName()).append(" = phi ");
        sb.append(getType()).append(" ");
        for (int i = 0; i < useValues.size(); i++) {
            Value useValue = useValues.get(i);
            if (i != 0) {
                sb.append(",");
            }
            sb.append("[ ");
            sb.append(useValue.getName()).append(", ");
            sb.append("%").append(getParentbb().getPreBlocks().get(i).getName()).append(" ]");
        }
        return sb.toString();
    }
    @Override
    public String getInstString1() {
        ArrayList<Value> useValues = getUseValues();
        StringBuilder sb = new StringBuilder();
        sb.append(reg).append(" = phi ");
        sb.append(getType()).append(" ");
        for (int i = 0; i < useValues.size(); i++) {
            Value useValue = useValues.get(i);
            if (i != 0) {
                sb.append(",");
            }

            sb.append("[ ");
            if(useValue.reg!=null)
            sb.append(useValue.reg).append(", ");
            else sb.append(useValue.getName()).append(", ");
            sb.append("%").append(getParentbb().getPreBlocks().get(i).getName()).append(" ]");
        }
        return sb.toString();
    }
}
