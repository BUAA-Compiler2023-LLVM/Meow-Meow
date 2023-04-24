package IR;

import IR.Value.User;
import IR.Value.Value;

public class Use {
    private Value value;
    private final User user;
    //  pos表示该value在该user的operandList中的pos
    private final int pos;

    public Use(Value value, User user, int pos){
        this.value = value;
        this.user = user;
        this.pos = pos;
    }



    // Getters and Setters
    public void setValue(Value value) {
        this.value = value;
    }

    public int getPos() {
        return pos;
    }

    public Value getValue() {
        return value;
    }

    public User getUser() {
        return user;
    }
}
