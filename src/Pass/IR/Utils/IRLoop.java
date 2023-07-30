package Pass.IR.Utils;

import IR.Value.BasicBlock;
import IR.Value.Function;

import java.util.*;

public class IRLoop {
    private final BasicBlock header;
    private final ArrayList<IRLoop> subLoops = new ArrayList<>();
    private final ArrayList<BasicBlock> bbs = new ArrayList<>();
    private final HashSet<BasicBlock> exitingBlocks = new HashSet<>();
    // 循环退出后第一个到达的block
    private final HashSet<BasicBlock> exitBlocks = new HashSet<>();
    // 跳转到循环头的块
    private final ArrayList<BasicBlock> latchBlocks = new ArrayList<>();
    private IRLoop parentLoop = null;

    public IRLoop(BasicBlock header) {
        this.header = header;
        bbs.add(header);
    }

    public BasicBlock getHead() {
        return header;
    }

    public boolean hasParent() {
        return parentLoop != null;
    }

    public IRLoop getParentLoop() {
        return parentLoop;
    }

    public void setParentLoop(IRLoop parentLoop) {
        this.parentLoop = parentLoop;
    }

    public void addSubLoop(IRLoop subLoop){
        subLoops.add(subLoop);
    }

    public void reverseBlock1() {
        Collections.reverse(bbs);
        BasicBlock bb = bbs.get(bbs.size() - 1);
        bbs.add(0, bb);
        bbs.remove(bbs.size() - 1);
    }

    public ArrayList<IRLoop> getSubLoops() {
        return subLoops;
    }

    public void addBlock(BasicBlock bb) {
        bbs.add(bb);
    }

    public int getLoopDepth() {
        int depth = 0;
        IRLoop now = this;
        while (now != null) {
            depth++;
            now = now.parentLoop;
        }
        return depth;
    }
}
