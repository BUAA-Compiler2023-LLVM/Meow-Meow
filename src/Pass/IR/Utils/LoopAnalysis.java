package Pass.IR.Utils;

import IR.Value.BasicBlock;
import IR.Value.Function;

import java.util.*;

public class LoopAnalysis {
    private static final HashMap<BasicBlock, IRLoop> loopMap = new HashMap<>();
    private static final ArrayList<IRLoop> loops = new ArrayList<>();
    private static final ArrayList<IRLoop> topLevelLoops = new ArrayList<>();

    public static void run(Function function){
        DomAnalysis.run(function);
        //  idoms是该基本块直接支配的基本块
        HashMap<BasicBlock, ArrayList<BasicBlock>> idoms =  function.getIdoms();
        //  dom是该基本块被哪些基本块支配
        HashMap<BasicBlock, HashSet<BasicBlock>> domer = function.getDomer();
        loopMap.clear();
        loops.clear();
        topLevelLoops.clear();

        // 后序遍历IDom
        ArrayList<BasicBlock> postOrder = new ArrayList<>();
        BasicBlock entry = function.getBbEntry();
        Stack<BasicBlock> stack = new Stack<>();
        stack.push(entry);
        BasicBlock now;
        while (!stack.isEmpty()) {
            now = stack.pop();
            postOrder.add(now);
            for (BasicBlock child : idoms.get(now)) {
                stack.push(child);
            }
        }
        Collections.reverse(postOrder); // 由于不是严格的树结构可以这样做后序遍历

        for(BasicBlock headBb : postOrder){
            Stack<BasicBlock> backEdges = new Stack<>();

            // 如果一个结点支配其前继，则将这个边识别为backedge
            for (BasicBlock backEdge : headBb.getPreBlocks()) {
                if (domer.getOrDefault(backEdge, new HashSet<>()).contains(headBb)) {
                    backEdges.push(backEdge);
                }
            }

            // 沿着reverse cfg的找到所有循环体
            if (!backEdges.isEmpty()) {
                // 初始化一个loop，以backedge的端点为loop header
                IRLoop loop = new IRLoop(headBb);
                while (!backEdges.isEmpty()) {
                    BasicBlock edge = backEdges.pop();
                    IRLoop subLoop = loopMap.get(edge);
                    // discoverAndMapSubloop
                    if (subLoop == null) {
                        loopMap.put(edge, loop);
                        if (edge.equals(loop.getHead())) {
                            continue;
                        }
                        for (BasicBlock edgePred : edge.getPreBlocks()) {
                            backEdges.push(edgePred);
                        }
                    }
                    else {
                        while (subLoop.hasParent()) {
                            subLoop = subLoop.getParentLoop();
                        }
                        if (subLoop == loop) {
                            continue;
                        }
                        subLoop.setParentLoop(loop);
                        for (var subHeadPred : subLoop.getHead().getPreBlocks()) {
                            if (!Objects.equals(loopMap.get(subHeadPred), subLoop)) {
                                backEdges.push(subHeadPred);
                            }
                        }
                    }
                }
            }
        }

        HashSet<BasicBlock> visited = new HashSet<>();
        populateLoopsDFS(entry, visited);
        computeAllLoops();

        function.setLoopInfo(loopMap);
    }

    private static void populateLoopsDFS(BasicBlock bb, HashSet<BasicBlock> visited){
        if (visited.contains(bb)) {
            return;
        }
        visited.add(bb);
        for (BasicBlock nxtBb : bb.getNxtBlocks()) {
            populateLoopsDFS(nxtBb, visited);
        }
        IRLoop subLoop = loopMap.get(bb);
        if (subLoop != null && subLoop.getHead().equals(bb)) {
            if (subLoop.hasParent()) {
                subLoop.getParentLoop().addSubLoop(subLoop);
            } else {
                topLevelLoops.add(subLoop);
            }

            // TODO: Check
            subLoop.reverseBlock1();
            Collections.reverse(subLoop.getSubLoops());

            subLoop = subLoop.getParentLoop();
        }

        while (subLoop != null) {
            subLoop.addBlock(bb);
            subLoop = subLoop.getParentLoop();
        }
    }

    private static void computeAllLoops(){
        loops.clear();
        Stack<IRLoop> stack = new Stack<>();
        stack.addAll(topLevelLoops);
        loops.addAll(topLevelLoops);
        while (!stack.isEmpty()) {
            var l = stack.pop();
            if (!l.getSubLoops().isEmpty()) {
                stack.addAll(l.getSubLoops());
                loops.addAll(l.getSubLoops());
            }
        }
    }

}
