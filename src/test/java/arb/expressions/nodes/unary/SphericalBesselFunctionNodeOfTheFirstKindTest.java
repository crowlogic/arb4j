package arb.expressions.nodes.unary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SphericalBesselFunctionNodeOfTheFirstKindTest extends
                                                           TestCase
{
  public static void testj0ViaExpression()
  {
    RealFunction j0 = RealFunction.express("j(3,x)");
    double       y  = j0.eval(2.3);
    // System.out.println("j0(2.3)=" + y);
    assertEquals(0.0856499630648839, y);
  }
}
