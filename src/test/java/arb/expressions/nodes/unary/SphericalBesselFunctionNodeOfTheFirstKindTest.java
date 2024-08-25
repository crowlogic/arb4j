package arb.expressions.nodes.unary;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SphericalBesselFunctionNodeOfTheFirstKindTest extends
                                                           TestCase
{
  public static void testj0()
  {
    RealFunction j0 = RealFunction.express("j(0,x)");
    System.out.println("j0(2.3)=" + j0.eval(2.3));
  }
}
