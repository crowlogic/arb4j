package arb.utensils.treetext;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Tree<R>
{

  public R getRoot();

  public R getNode(R parent, int index);

  public int getNodeCount(R parent);

  public boolean isLeaf(R node);

  public int getNodeIndex(R parent, R child);

}
