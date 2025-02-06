package arb.expressions.nodes;

import arb.RationalFunction;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.rational.RationalNullaryFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LiteralConstantTest extends
                                 TestCase
{

  public void testPi()
  {
    var x = RealNullaryFunction.express("pi");
    assertEquals(RealConstants.π, x.evaluate());
  }

  public void testRationalNullaryOneHalfMinusXOver2()
  {
    var              rationalFunctional = RationalNullaryFunction.express("1/2");
    RationalFunction expressed          = rationalFunctional.evaluate(128, new RationalFunction());
    assertEquals("1/2", expressed.toString());

  }

  public void testThreeEightsPlusOneEight()
  {
    var              rationalFunctional = RationalNullaryFunction.express("3/8+1/8");
    RationalFunction expressed          = rationalFunctional.evaluate(128, new RationalFunction());
    assertEquals("1/2", expressed.toString());

  }

}
