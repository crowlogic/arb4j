package arb.utensils.treetext;

import java.io.File;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TextTreeTest extends
                          TestCase
{

  public void testPrintTree()
  {
    var                          tm = new FileSystemTreeModel(new File("./docs"));
    TextTree<FileSystemTreeNode> tt = new TextTree<FileSystemTreeNode>(tm);
    System.out.println(tt);
  }

}
