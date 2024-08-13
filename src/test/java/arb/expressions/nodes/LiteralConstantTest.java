package arb.expressions.nodes;

import arb.RationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.rational.RationalNullaryFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LiteralConstantTest
                                 extends
                                 TestCase
{

  public void testRationalNullaryOneHalfMinusXOver2()
  {
      var              rationalFunctional      = RationalNullaryFunction.express("1/2");
      RationalFunction expressed = rationalFunctional.evaluate(128, new RationalFunction());
      assertEquals("1/2", expressed.toString());
    
  }
  
  public void testThreeEightsPlusOneEight()
  {
      var              rationalFunctional      = RationalNullaryFunction.express("3/8+1/8");
      RationalFunction expressed = rationalFunctional.evaluate(128, new RationalFunction());
      assertEquals("1/2", expressed.toString());
    
  }

}
