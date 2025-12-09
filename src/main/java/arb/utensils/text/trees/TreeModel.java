package arb.utensils.text.trees;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface TreeModel<R>
{

  public R getRoot();

  public R getNode(R parent, int index);

  public char getNodeSymbol(R node);
  
  public int getNodeCount(R parent);

  public boolean isLeaf(R node);


}
