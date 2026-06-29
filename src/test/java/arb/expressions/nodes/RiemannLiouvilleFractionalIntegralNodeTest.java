package arb.expressions.nodes;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/** @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary} */
public class RiemannLiouvilleFractionalIntegralNodeTest extends
                                                      TestCase
{
  public void testFractionalIntegralOfMonomialHasClosedForm()
  {
    var f = RealFunction.express("t➔fracint(t^2,t^½)");
    double actual = f.eval(2.0);
    // I^{1/2}(t^2) = Γ(3)/Γ(7/2) * t^{5/2} = 16/(15√π) * t^{5/2}
    double expected = (16.0 / (15.0 * Math.sqrt(Math.PI))) * Math.pow(2.0, 2.5);
    assertEquals(expected, actual, 1e-10);
  }

  public void testFractionalIntegralOfConstantHasClosedForm()
  {
    var f = RealFunction.express("t➔fracint(5,t^½)");
    double actual = f.eval(4.0);
    // I^{1/2}(5) = 5 * 2√t/√π
    double expected = 5.0 * 2.0 * Math.sqrt(4.0) / Math.sqrt(Math.PI);
    assertEquals(expected, actual, 1e-10);
  }
}
