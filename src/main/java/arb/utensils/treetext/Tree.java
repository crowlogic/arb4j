package arb.utensils.treetext;

public interface Tree<R>
{

  public R getRoot();

  public R getNode(R parent, int index);

  public int getNodeCount(R parent);

  public boolean isLeaf(R node);

  public int getNodeIndex(R parent, R child);

}
