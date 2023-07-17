package Pass.IR.Utils;

import IR.Value.BasicBlock;
import IR.Value.Function;
import IR.Value.Instructions.Instruction;
import IR.Value.Instructions.BrInst;
import Utils.DataStruct.IList;
import Utils.DataStruct.Pair;

import java.util.*;

import static Pass.IR.Utils.UtilFunc.initCFG;


public class DomAnalysis{

    public static DomAnalysisRes run(Function function){
        HashMap<BasicBlock, ArrayList<BasicBlock>> df = new HashMap<>();
        HashMap<BasicBlock, ArrayList<BasicBlock>> rdf = new HashMap<>();
        //  dom记录每个块被哪些块支配
        HashMap<BasicBlock, HashSet<BasicBlock>> dom = new HashMap<>();
        HashMap<BasicBlock, HashSet<BasicBlock>> pdom = new HashMap<>();
        //  idom记录每个Bb的直接支配者
        HashMap<BasicBlock, BasicBlock> idom = new HashMap<>();
        HashMap<BasicBlock, BasicBlock> pidom = new HashMap<>();
        //  idoms记录每个Bb直接支配哪些块
        HashMap<BasicBlock, ArrayList<BasicBlock>> idoms = new HashMap<>();
        HashMap<BasicBlock, ArrayList<BasicBlock>> pidoms = new HashMap<>();
        //  allBlocks记录有效的Block(即与bbEntry全联通的BasicBlock)
        ArrayList<BasicBlock> allBlocks;
        ArrayList<BasicBlock> endBlocks;

        //  先建立CFG图(Control Flow Graph)
        initCFG(function);

        //  根据CFG图初始化数据结构
        //  先计算有效的所有block
        allBlocks = getAllBlocks(function);
        endBlocks = getEndBlocks(function);

        //  数据结构初始化
        for (BasicBlock bb : allBlocks) {
            idoms.put(bb, new ArrayList<>());
            pidoms.put(bb, new ArrayList<>());
            df.put(bb, new ArrayList<>());
            rdf.put(bb, new ArrayList<>());

            dom.put(bb, null);
            pdom.put(bb, null);
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

        //  计算后支配(pdom)关系
        //  算法同上，只不过是反向CFG

        for(BasicBlock bb : endBlocks){
            pdom.replace(bb, new HashSet<>());
            pdom.get(bb).add(bb);
        }
        done = false;

        ArrayList<BasicBlock> RPOBlocks = getRPOForRCFG(endBlocks);
        while (!done){
            done = true;
            for(BasicBlock bb : RPOBlocks){
                //  用temPreBbs记录前驱的交集
                HashSet<BasicBlock> nxtBbsDom = null;
                for(BasicBlock nxtBb : bb.getNxtBlocks()){
                    if(pdom.get(nxtBb) == null){
                        continue;
                    }
                    //  如果是第一次，给preBbsDom初始化为该前驱的dom
                    if(nxtBbsDom == null){
                        nxtBbsDom = new HashSet<>(pdom.get(nxtBb));
                    }
                    //  否则取交集
                    else{
                        nxtBbsDom.retainAll(pdom.get(nxtBb));
                    }
                }
                if(nxtBbsDom == null){
                    nxtBbsDom = new HashSet<>();
                }

                nxtBbsDom.add(bb);
                HashSet<BasicBlock> s = pdom.get(bb);
                if(!nxtBbsDom.equals(pdom.get(bb))){
                    pdom.replace(bb, nxtBbsDom);
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

        //  计算pidom关系
        for (BasicBlock bb : pdom.keySet()) {
            HashSet<BasicBlock> tmpPDomSet = pdom.get(bb);
            if (tmpPDomSet.size() == 1) {
                pidom.put(bb, null);
            }
            for (BasicBlock mayPIDom : tmpPDomSet) {
                //  严格支配bb
                if (mayPIDom.equals(bb)) {
                    continue;
                }

                boolean isPIDom = true;
                for (BasicBlock tmpPDomBlock : tmpPDomSet) {
                    //  tmpDomBlock严格支配bb的节点 && mayIDom严格支配tmpDomBlock
                    //  的话说明它不直接支配bb
                    if (!tmpPDomBlock.equals(bb) &&
                            !tmpPDomBlock.equals(mayPIDom) &&
                            pdom.get(tmpPDomBlock).contains(mayPIDom)) {
                        isPIDom = false;
                        break;
                    }
                }

                if (isPIDom) {
                    pidom.put(bb, mayPIDom);
                    pidoms.get(mayPIDom).add(bb);
                    break;
                }
            }
        }


        function.setIdoms(idoms);
        function.setDom(dom);

        function.setPIdoms(pidoms);
        function.setPDom(pdom);

        //  建立支配树
        //  根据直接支配关系(idoms) dfs建立支配树
        BasicBlock bbEntry = function.getBbEntry();
        buildDomTree(bbEntry, 0, function);

        //  计算DF
        ArrayList<BasicBlock> domPostOrder = getDomPostOrder(bbEntry);
        df = getDF(domPostOrder);

        //  计算RDF
        ArrayList<BasicBlock> pdomPostOrder = getPDomPostOrder(endBlocks);
        rdf = getRDF(pdomPostOrder);

        return new DomAnalysisRes(df, idoms, rdf);
    }

    //  理论上应该返回Reverse Post-Order，但是要写递归
    //  貌似bfs的preOrder也能用，先不改了
    private static ArrayList<BasicBlock> getRPOForRCFG(ArrayList<BasicBlock> endBlocks){
        Queue<BasicBlock> queue = new LinkedList<>();
        HashSet<BasicBlock> bbSet = new HashSet<>();
        ArrayList<BasicBlock> rAllBlocks = new ArrayList<>();
        for(BasicBlock bb : endBlocks){
            queue.add(bb);
            bbSet.add(bb);
        }

        while (!queue.isEmpty()){
            BasicBlock nowBb = queue.poll();
            rAllBlocks.add(nowBb);
            for(BasicBlock preBb : nowBb.getPreBlocks()){
                if(!bbSet.contains(preBb)){
                    bbSet.add(preBb);
                    queue.add(preBb);
                }
            }
        }
        return rAllBlocks;
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

    private static HashMap<BasicBlock, ArrayList<BasicBlock>> getRDF(ArrayList<BasicBlock> pdomPostOrder){
        HashMap<BasicBlock, ArrayList<BasicBlock>> rdf = new HashMap<>();
        for(BasicBlock X : pdomPostOrder){
            rdf.put(X, new ArrayList<>());
            //  RDF_local(X)
            for(BasicBlock Y : X.getPreBlocks()){
                if(Y.getPIdominator() != X){
                    rdf.get(X).add(Y);
                }
            }
            //  RDF_up(Z)
            for(BasicBlock Z : X.getPIdoms()){
                for(BasicBlock Y : rdf.get(Z)){
                    if(Y.getPIdominator() != X){
                        rdf.get(X).add(Y);
                    }
                }
            }
        }
        return rdf;
    }

    private static ArrayList<BasicBlock> getEndBlocks(Function function){
        ArrayList<BasicBlock> endBlocks = new ArrayList<>();
        for(IList.INode<BasicBlock, Function> bbNode : function.getBbs()){
            BasicBlock bb = bbNode.getValue();
            if(bb.getNxtBlocks().size() == 0){
                endBlocks.add(bb);
            }
        }
        return endBlocks;
    }

    //  pdom支配树不止有一个起始点，因此用bfs
    private static ArrayList<BasicBlock> getPDomPostOrder(ArrayList<BasicBlock> postOrderEntry){
        ArrayList<BasicBlock> postOrder = new ArrayList<>();
        Queue<BasicBlock> queue = new LinkedList<>();
        HashSet<BasicBlock> bbSet = new HashSet<>();
        for(BasicBlock bb : postOrderEntry){
            queue.add(bb);
            bbSet.add(bb);
        }

        while (!queue.isEmpty()){
            BasicBlock nowBb = queue.poll();
            postOrder.add(nowBb);
            for(BasicBlock sonBb : nowBb.getPIdoms()){
                if(!bbSet.contains(sonBb)){
                    queue.add(sonBb);
                    bbSet.add(sonBb);
                }
            }
        }

        Collections.reverse(postOrder);
        return postOrder;
    }

    private static ArrayList<BasicBlock> getDomPostOrder(BasicBlock bb){
        ArrayList<BasicBlock> postOrder = new ArrayList<>();
        for(BasicBlock sonBb : bb.getIdoms()){
            postOrder.addAll(getDomPostOrder(sonBb));
        }
        postOrder.add(bb);
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
        HashMap<BasicBlock, ArrayList<BasicBlock>> rdf;
        HashMap<BasicBlock, ArrayList<BasicBlock>> idoms;
        public DomAnalysisRes(HashMap<BasicBlock, ArrayList<BasicBlock>> df,
                              HashMap<BasicBlock, ArrayList<BasicBlock>> idoms,
                              HashMap<BasicBlock, ArrayList<BasicBlock>> rdf){
            this.df = df;
            this.idoms = idoms;
            this.rdf = rdf;
        }

        public HashMap<BasicBlock, ArrayList<BasicBlock>> getDomTree(){
            return idoms;
        }


        public HashMap<BasicBlock, ArrayList<BasicBlock>> getDf(){
            return df;
        }
        public HashMap<BasicBlock, ArrayList<BasicBlock>> getRDf(){
            return rdf;
        }
    }
}
