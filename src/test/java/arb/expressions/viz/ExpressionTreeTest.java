package arb.expressions.viz;

import java.io.File;

import arb.RationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import javafx.scene.control.Tab;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExpressionTreeTest extends
                                TestCase
{

  public static void testLoad()
  {
    var                     expressor      =
                                      new Expressor<Object, RationalFunction, Function<Object, RationalFunction>>();
    Tab                     tab            = new Tab();
    ExpressionTree<?, ?, ?> expressionTree = new ExpressionTree<>(expressor,
                                                                  tab);
    expressionTree.load(new File("expressions/RationalFunctionDerivative.yaml"));
    assert false : "cool" ;
    
  }

}
