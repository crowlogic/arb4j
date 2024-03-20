package arb.utensils.treetext;

import java.io.File;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TextTreeTest extends
                          TestCase
{
  public void testPrintAbstractSyntaxTree()
  {
    Expression<Real,
                  Real,
                  RealFunction>          expression = Expression.compile("S",
                                                                         "tanh(log(1+x^2))",
                                                                         null,
                                                                         Real.class,
                                                                         Real.class,
                                                                         RealFunction.class,
                                                                         false);
    var                                  model      = expression.newSyntaxTree();
    var                                  tree       = new TextTree<>(model);
    System.out.println(tree);
  }

  public void testPrintTree()
  {
    var                          tm = new FileSystemTreeModel(new File("./docs"));
    TextTree<FileSystemTreeNode> tt = new TextTree<FileSystemTreeNode>(tm);
    System.out.println(tt);
  }

}
