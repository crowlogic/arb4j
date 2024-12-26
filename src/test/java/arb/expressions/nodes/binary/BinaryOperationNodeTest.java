package arb.expressions.nodes.binary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BinaryOperationNodeTest extends
                                     TestCase
{

  public void testEquals()
  {
    var F = RealFunction.parse("tanh(log(1+x^2))/(1+x^2)").generate();
    var f = F.instantiate();
    var y = f.eval(2.3);
    assertEquals(0.151143929930069, y);
  }

  public void testExpressionCommonSubtreeElimination()
  {
    var F = RealFunction.parse("tanh(log(1+x^2))/(1+x^2)").generate();
    var f = F.instantiate();
    var y = f.eval(2.3);
    assertEquals(0.151143929930069, y);
  }

}
