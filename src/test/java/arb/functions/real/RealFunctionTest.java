package arb.functions.real;

import arb.Fraction;
import arb.expressions.Context;
import junit.framework.TestCase;

@SuppressWarnings(
{ "resource" })
/*
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link
 * TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class RealFunctionTest extends
                              TestCase
{
  public static void testParse()
  {
    var context   = new Context();
    var f         = RealFunction.express("θ:im(lnΓ(¼+I*t/2))-(log(π)/2)*t", context);
    var e         = RealFunction.parse("e:θ(t)-t", context);
    var einstance = e.instantiate();
    assertEquals("e:t➔(θ(t))-t", einstance.toString());
    assertEquals("θ:t➔(im(lnΓ(¼+((ⅈ*t)/2))))-(((log(π))/2)*t)", f.toString());
  }

  public static void testJOneQuarter()
  {
    var    f = RealFunction.express("J(1/4, s)");
    double y = f.eval(2.3);
    assertEquals(0.2443567191733145, y);
  }

  public static void testRandomWavePropagator()
  {
    var    f = RealFunction.express("√(π)*Γ(¾)*J(¼,|s|)*2^¼÷|s|^¼");
    double y = f.eval(2.3);
    assertEquals(0.5125173326531876, y);
  }

  public static void testBetaFunctionReal()
  {
    var oneOverThirty      = new Fraction(1,
                                          30);
    var oneThirtieth       = RealNullaryFunction.express("Beta(5,2)");
    var oneDividedByThirty = oneThirtieth.evaluate(128);
    assertEquals(oneOverThirty.doubleValue(), oneDividedByThirty.doubleValue());
  }

}
