package arb.expressions.nodes.unary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BetaFunctionNodeTest extends
                                  TestCase
{
  public void testBetaFunc()
  {
    var f = RealNullaryFunction.express("Beta(1.2,2.3)");
    var y = f.eval();
    assertEquals(0.3223368257714494301489366396995434828153, y);
  }
}
