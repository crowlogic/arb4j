package arb.functions.real;

import arb.Complex;
import arb.Fraction;
import arb.arblib;
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
