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
  public static void testRandomWavePropagator()
  {
    var    f = RealFunction.express("(√(π)*Γ(3/4)*J(1/4, |s|)*2^(1/4))/|s|^(1/4)");
    double y = f.eval(2.3);
    assertEquals(0.5125173326531873041352847860794002126341, y);
  }

  public static void testBetaFunctionReal()
  {
    var oneOverThirthy = new Fraction(1,
                                      30);
    var oneThirtieth   = RealNullaryFunction.express("Beta(5,2)");
    var val            = oneThirtieth.evaluate(128);
    assertEquals(oneOverThirthy.doubleValue(), val.doubleValue());
  }

  public static void testBetaFunctionRational()
  {
    var oneOverThirthy = new Fraction(1,
                                      30);
    var oneThirtieth   = RationalNullaryFunction.express("Beta(5,2)");
    var val            = oneThirtieth.evaluate(128);
    assertEquals(oneOverThirthy, val);
  }

  public static void testJ0Eigenfunctions()
  {
    assert false : "TODO: determine them.. they aren't equal to the uniformly convergent basis functions, expand the eigenfunctions in terms of the basis then solve for coeffecients and determine pattern";
  }

}
