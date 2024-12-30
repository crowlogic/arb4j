package arb.functions.real;

import arb.Fraction;
import arb.functions.rational.RationalNullaryFunction;
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
    var cool = "🤙";
    
    var oneOverThirty      = new Fraction(1,
                                          30);
    var oneThirtieth       = RealNullaryFunction.express("Beta(5,2)");
    var oneDividedByThirty = oneThirtieth.evaluate(128);
    assertEquals(oneOverThirty.doubleValue(), oneDividedByThirty.doubleValue());
  }

  public static void testBetaFunctionRational()
  {
    var oneOverThirthy = new Fraction(1,
                                      30);
    var oneThirtieth   = RationalNullaryFunction.express("Beta(5,2)");
    var val            = oneThirtieth.evaluate(128);
    assertEquals(oneOverThirthy, val);
  }

  public static void testRandomWaveEigenfunctions()
  {
    assert false : "TODO: complete https://github.com/crowlogic/arb4j/issues/531 including extracting the latex snippets hastily strewn together on the mobile";
  }

}
