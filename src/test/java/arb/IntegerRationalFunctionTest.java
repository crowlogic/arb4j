package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegerRationalFunctionTest
                                         extends
                                         TestCase
{

  public void testInitAndToString()
  {
    IntegerRationalFunction f = new IntegerRationalFunction();

    arblib.fmpz_poly_q_init(f);

    IntegerPolynomial numerator   = f.getNumerator();

    IntegerPolynomial denominator = f.getDenominator();
    assertEquals("0", numerator.toString());
    assertEquals("1", denominator.toString());

  }

}
