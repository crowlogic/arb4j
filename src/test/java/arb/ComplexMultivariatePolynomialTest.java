package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexMultivariatePolynomialTest extends TestCase
{
  public void testComplexMultivariatePolynomialParsingArithmeticAndCoefficientAccess()
  {
    try (     var ctx = new ComplexMultivariatePolynomialContext(2,
                                                       128).setVariableNames("z",
                                                                             "w");
    var polynomial = ctx.newPolynomial();
    var zCoefficient = new Complex();
    var square = ctx.newPolynomial();
    var coeff = new Complex();
    var zw = new Complex();
    var ww = new Complex())
    {
      zCoefficient.re().set(1);
      zCoefficient.im().set(1);
      polynomial.setCoefficient(new long[] { 1, 0 },
                          zCoefficient);
      polynomial.setCoefficient(new long[] { 0, 1 },
                          2);

      polynomial.mul(polynomial,
               square);

      polynomial.getCoefficient(new long[] { 1, 0 },
                          coeff);
      assertEquals(1.0,
             coeff.re().doubleValue());
      assertEquals(1.0,
             coeff.im().doubleValue());

      square.getCoefficient(new long[] { 2, 0 },
                      coeff);
      assertEquals(0.0,
             coeff.re().doubleValue());
      assertEquals(2.0,
             coeff.im().doubleValue());

      square.getCoefficient(new long[] { 1, 1 },
                      zw);
      assertEquals(4.0,
             zw.re().doubleValue());
      assertEquals(4.0,
             zw.im().doubleValue());

      square.getCoefficient(new long[] { 0, 2 },
                      ww);
      assertEquals(4.0,
             ww.re().doubleValue());
      assertEquals(0.0,
             ww.im().doubleValue());
    }
  }
}
