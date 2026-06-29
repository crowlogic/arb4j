package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealMultivariatePolynomialTest extends TestCase
{
  public void testRealMultivariatePolynomialArithmeticAndCoefficientAccess()
  {
    try ( var ctx = new RealMultivariatePolynomialContext(2,
                                                          128).setVariableNames("x",
                                                                                "y");
          var x = ctx.newPolynomial().generator(0);
          var y = ctx.newPolynomial().generator(1);
          var sum = ctx.newPolynomial();
          var product = ctx.newPolynomial();
          var coeff = new Real())
    {
      x.add(y,
            sum);
      sum.mul(sum,
              product);

      assertEquals("x + y", sum.toString());
      assertEquals("x^2 + 2.00000000000000000000000000000000000000*x*y + y^2",
                   product.toString());

      product.getCoefficient(new long[] { 1, 1 },
                             coeff);
      assertEquals(2.0,
                   coeff.doubleValue());
    }
  }
}
