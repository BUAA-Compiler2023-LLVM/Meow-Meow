package Pass.IR.Utils;

import IR.Value.BasicBlock;
import IR.Value.Function;
import Utils.DataStruct.IList;

import java.util.*;

import static Pass.IR.Utils.UtilFunc.initCFG;


public class DomAnalysis{

    public static DomAnalysisRes run(Function function){
        HashMap<BasicBlock, ArrayList<BasicBlock>> df = new HashMap<>();
        //  dom记录每个块被哪些块支配
        HashMap<BasicBlock, HashSet<BasicBlock>> dom = new HashMap<>();
        //  idom记录每个Bb的直接支配者
        HashMap<BasicBlock, BasicBlock> idom = new HashMap<>();
        //  idoms记录每个Bb直接支配哪些块
        HashMap<BasicBlock, ArrayList<BasicBlock>> idoms = new HashMap<>();
        //  allBlocks记录有效的Block(即与bbEntry全联通的BasicBlock)
        ArrayList<BasicBlock> allBlocks;

        //  先建立CFG图(Control Flow Graph)
        initCFG(function);

        //  根据CFG图初始化数据结构
        //  先计算有效的所有block
        allBlocks = getAllBlocks(function);

        //  数据结构初始化
        for (BasicBlock bb : allBlocks) {
            idoms.put(bb, new ArrayList<>());
            df.put(bb, new ArrayList<>());
            dom.put(bb, null);
        }

        //  正式开始计算
        dom.replace(function.getBbEntry(), new HashSet<>());
        dom.get(function.getBbEntry()).add(function.getBbEntry());
        //  计算支配(dom)关系
        //  按逆后序的迭代顺序
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
        ArrayList<BasicBlock> domPostOrder = getDomPostOrder(function);
        df = getDF(domPostOrder);

        return new DomAnalysisRes(df, idoms);
    }

    private static ArrayList<BasicBlock> getAllBlocks(Function function){
        Queue<BasicBlock> q = new LinkedList<>();
        ArrayList<BasicBlock> allBlocks = new ArrayList<>();
        HashSet<BasicBlock> allBlocksSet = new HashSet<>();
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
        ArrayList<BasicBlock> deletedBlock = new ArrayList<>();
        for (IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();
            if(!allBlocksSet.contains(bb)){
                deletedBlock.add(bb);
            }
        }
        for(BasicBlock bb : deletedBlock){
            bb.removeSelf();
        }
        return allBlocks;
    }


    private static HashMap<BasicBlock, ArrayList<BasicBlock>> getDF(ArrayList<BasicBlock> domPostOrder){
        HashMap<BasicBlock, ArrayList<BasicBlock>> df = new HashMap<>();
        for(BasicBlock X : domPostOrder){
            df.put(X, new ArrayList<>());
            //  DF_local(X)
            for(BasicBlock Y : X.getNxtBlocks()){
                if(Y.getIdominator() != X){
                    df.get(X).add(Y);
                }
            }
            //  DF_up(Z)
            for(BasicBlock Z : X.getIdoms()){
                for(BasicBlock Y : df.get(Z)){
                    if(Y.getIdominator() != X){
                        df.get(X).add(Y);
                    }
                }
            }
        }
        return df;
    }

    public static ArrayList<BasicBlock> getDomPostOrder(Function function){
        ArrayList<BasicBlock> postOrder = new ArrayList<>();
        Stack<BasicBlock> stack = new Stack<>();
        HashSet<BasicBlock> visitedAllNxtBbs = new HashSet<>();

        stack.add(function.getBbEntry());
        while (!stack.empty()){
            BasicBlock nowBb = stack.peek();
            if(visitedAllNxtBbs.contains(nowBb)){
                postOrder.add(nowBb);
                stack.pop();
                continue;
            }

            for(BasicBlock sonBb : nowBb.getIdoms()){
                stack.push(sonBb);
            }

            visitedAllNxtBbs.add(nowBb);
        }
        return postOrder;
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
