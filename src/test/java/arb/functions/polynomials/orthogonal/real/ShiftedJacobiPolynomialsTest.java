package arb.functions.polynomials.orthogonal.real;

import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ShiftedJacobiPolynomialsTest extends
                                          TestCase
{
  public void testShiftedJacobiPolynomials()
  {
    try ( ShiftedJacobiPolynomials P = new ShiftedJacobiPolynomials(RealConstants.negHalf,
                                                                    RealConstants.negHalf))
    {
      var P4 = P.evaluate(8, 128, new RealPolynomial());
      assertEquals("50.2734375*x⁸ - 100.546875*x⁶ + 62.841796875*x⁴ - 12.568359375*x² - 0.60723876953125",
                   P4.toString());
    }
  }
}
