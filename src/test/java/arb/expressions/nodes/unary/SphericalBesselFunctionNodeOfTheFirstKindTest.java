package arb.expressions.nodes.unary;

import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.RealPolynomialSequence;
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
    RealPolynomialSequence j0 = RealPolynomialSequence.express("k->j(k,x)");
    RealPolynomial         y  = j0.evaluate(1, 128);
    // System.out.println("j0(2.3)=" + y);
    assertEquals(0.0856499630648839, y.get(0).doubleValue());
  }

  public static void testj0ViaRealFunction()
  {
    RealFunction j0 = RealFunction.express("j(3,x)");
    double       y  = j0.eval(2.3);
    // System.out.println("j0(2.3)=" + y);
    assertEquals(0.0856499630648839, y);
  }
}
