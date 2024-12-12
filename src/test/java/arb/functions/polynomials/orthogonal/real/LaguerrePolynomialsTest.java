package arb.functions.polynomials.orthogonal.real;

import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LaguerrePolynomialsTest extends
                                     TestCase
{
  public void testLaguerrePolynomials()
  {
    try ( var L = new LaguerrePolynomials())
    {
      var L2 = L.evaluate(2, 128);
      assertEquals("0.5*x² - 2*x + 1", L2.toString());
    }
  }
}
