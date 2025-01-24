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
    ShiftedJacobiPolynomials P  = new ShiftedJacobiPolynomials(RealConstants.negHalf,
                                                               RealConstants.negHalf);
    var                      P4 = P.evaluate(8, 128, new RealPolynomial());
    System.out.println("P4=" + P4);
  }
}
