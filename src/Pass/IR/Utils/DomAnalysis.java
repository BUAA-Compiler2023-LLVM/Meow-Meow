package Pass.IR.Utils;

import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.BrInst;
import Utils.DataStruct.IList;
import Utils.DataStruct.Pair;

import java.util.*;

public class DomAnalysis{
    public static DomAnalysisRes run(Function function){
        HashSet<Pair<BasicBlock, BasicBlock>> CFGEdge = new HashSet<>();
        HashMap<BasicBlock, ArrayList<BasicBlock>> df = new HashMap<>();
        //  dom记录每个块被哪些块支配
        HashMap<BasicBlock, HashSet<BasicBlock>> dom = new HashMap<>();
        //  idom记录每个Bb的直接支配者
        HashMap<BasicBlock, BasicBlock> idom = new HashMap<>();
        //  idoms记录每个Bb直接支配哪些块
        HashMap<BasicBlock, ArrayList<BasicBlock>> idoms = new HashMap<>();

        //  allBlocks记录有效的Block(即与bbEntry全联通的BasicBlock)
        ArrayList<BasicBlock> allBlocks = new ArrayList<>();
        HashSet<BasicBlock> allBlocksSet = new HashSet<>();
        //  用队列q进行bfs计算allBlocks
        Queue<BasicBlock> q = new LinkedList<>();
        HashSet<BasicBlock> deletedBlock = new HashSet<>();

        //  先建立CFG图(Control Flow Graph)
        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();
            for(IList.INode<Instruction, BasicBlock> instNode : bb.getInsts()){
                Instruction inst = instNode.getValue();
                if(inst instanceof BrInst brInst){
                    if(brInst.isJump()){
                        BasicBlock jumpBb = brInst.getJumpBlock();
                        bb.setNxtBlock(jumpBb);
                        jumpBb.setPreBlock(bb);
                        CFGEdge.add(new Pair<>(bb, jumpBb));
                    }
                    else{
                        BasicBlock left = brInst.getTrueBlock();
                        BasicBlock right = brInst.getFalseBlock();
                        bb.setNxtBlock(left);
                        bb.setNxtBlock(right);
                        left.setPreBlock(bb);
                        right.setPreBlock(bb);
                        CFGEdge.add(new Pair<>(bb, left));
                        CFGEdge.add(new Pair<>(bb, right));
                    }
                }
            }
        }

        //  根据CFG图初始化数据结构
        //  先计算有效的所有block
        q.add(function.getBbEntry());
        allBlocks.add(function.getBbEntry());
        allBlocksSet.add(function.getBbEntry());
        while (!q.isEmpty()){
            BasicBlock nowBb = q.poll();
            for(BasicBlock nxtBb : nowBb.getNxtBlocks()){
                if(!allBlocksSet.contains(nxtBb)){
                    q.add(nxtBb);
                    allBlocks.add(nxtBb);
                    allBlocksSet.add(nxtBb);
                }
            }
        }

        //  顺便把没用的block删了
        for (IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();
            if(!allBlocksSet.contains(bb)){
                deletedBlock.add(bb);
            }
        }
        for(BasicBlock bb : deletedBlock){
            bb.removeSelf();
        }

        for (BasicBlock bb : allBlocks) {
            dom.put(bb, null);
            idoms.put(bb, new ArrayList<>());
            df.put(bb, new ArrayList<>());
        }

        dom.replace(function.getBbEntry(), new HashSet<>());
        dom.get(function.getBbEntry()).add(function.getBbEntry());
        //  计算支配(dom)关系(某基本块被哪些基本块支配)
        //  我们采取迭代的策略：某基本块的dom <- 某基本块所有前驱的dom的交集加上自己本身
        //  直到没有基本块的dom发生变化
        boolean done = false;
        while (!done){
            done = true;
            for(BasicBlock bb : allBlocks){
                //  用temPreBbs记录前驱的交集
                HashSet<BasicBlock> preBbsDom = null;
                for(BasicBlock preBb : bb.getPreBlocks()){
                    if(dom.get(preBb) == null){
                        continue;
                    }
                    //  如果是第一次，给preBbsDom初始化为该前驱的dom
                    if(preBbsDom == null){
                        preBbsDom = new HashSet<>(dom.get(preBb));
                    }
                    //  否则取交集
                    else{
                        preBbsDom.retainAll(dom.get(preBb));
                    }
                }
                if(preBbsDom == null){
                    preBbsDom = new HashSet<>();
                }

                preBbsDom.add(bb);
                if(!preBbsDom.equals(dom.get(bb))){
                    dom.replace(bb, preBbsDom);
                    done = false;
                }
            }
        }

        //  计算直接支配(idom)关系
        //  直接支配关系我们直接按定义来计算
        //  严格支配bb，且不严格支配任何(严格支配bb的节点)的节点
        for (BasicBlock bb : dom.keySet()) {
            HashSet<BasicBlock> tmpDomSet = dom.get(bb);
            if (tmpDomSet.size() == 1) {
                idom.put(bb, null);
            }
            for (BasicBlock mayIDom : tmpDomSet) {
                //  严格支配bb
                if (mayIDom.equals(bb)) {
                    continue;
                }

                boolean isIDom = true;
                for (BasicBlock tmpDomBlock : tmpDomSet) {
                    //  tmpDomBlock严格支配bb的节点 && mayIDom严格支配tmpDomBlock
                    //  的话说明它不直接支配bb
                    if (!tmpDomBlock.equals(bb) &&
                            !tmpDomBlock.equals(mayIDom) &&
                            dom.get(tmpDomBlock).contains(mayIDom)) {
                        isIDom = false;
                        break;
                    }
                }

                if (isIDom) {
                    idom.put(bb, mayIDom);
                    idoms.get(mayIDom).add(bb);
                    break;
                }
            }
        }


        function.setIdoms(idoms);
        function.setDom(dom);

        //  建立支配树
        //  根据直接支配关系(idoms) dfs建立支配树
        BasicBlock bbEntry = function.getBbEntry();
        buildDomTree(bbEntry, 0, function);

        //  计算DF
        //  计算支配边界的原理其实有点类似并查集
        //  考虑到如果存在两个基本块为直接支配关系，那么可以当作它们为一个集合
        //  这样已知向上找，直到不为直接支配关系，就找到了支配边界
        for (BasicBlock bb : allBlocks) {
            if (bb.getPreBlocks().size() > 1) {
                for (BasicBlock p : bb.getPreBlocks()) {
                    BasicBlock runner = p;
                    while (!runner.equals(idom.get(bb))) {
                        df.get(runner).add(bb);
                        runner = idom.get(runner);
                    }
                }
            }
        }

        return new DomAnalysisRes(df, idoms);
    }

    private static void buildDomTree(BasicBlock bb, int domLV, Function function){
        bb.setDomLV(domLV);
        for(BasicBlock sonBb : function.getIdoms().get(bb)){
            buildDomTree(sonBb, domLV + 1, function);
        }
    }

    public static class DomAnalysisRes{
        HashMap<BasicBlock, ArrayList<BasicBlock>> df;
        HashMap<BasicBlock, ArrayList<BasicBlock>> idoms;
        public DomAnalysisRes(HashMap<BasicBlock, ArrayList<BasicBlock>> df,
                              HashMap<BasicBlock, ArrayList<BasicBlock>> idoms){
            this.df = df;
            this.idoms = idoms;
        }

        public HashMap<BasicBlock, ArrayList<BasicBlock>> getDomTree(){
            return idoms;
        }


        public HashMap<BasicBlock, ArrayList<BasicBlock>> getDf(){
            return df;
        }
    }
}
