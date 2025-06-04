package arb.expressions.nodes;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FractionalDerivativeNodeTest extends
                                          TestCase
{
  public static void testFractionalDerivative()
  {
    var expr = RealFunction.express("Đᵅsin(t)", new Context(Real.named("α").set(RealConstants.half)));
    System.out.println(expr);
  }
}
