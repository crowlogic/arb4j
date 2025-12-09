package arb.functions.integer;

import java.util.List;

import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealPolynomialMonomialsTest extends
                                         TestCase
{

  public void testSeq()
  {
    try ( RealPolynomialMonomials s = new RealPolynomialMonomials())
    {
      List<RealPolynomial> seq = s.enumerate(0, 4);
      assertEquals("[1, x, x², x³, x⁴]", seq.toString());
    }
  }
}
