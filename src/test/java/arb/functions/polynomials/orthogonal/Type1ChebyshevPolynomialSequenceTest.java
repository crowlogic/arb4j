package arb.functions.polynomials.orthogonal;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Type1ChebyshevPolynomialSequenceTest extends
                                                  TestCase
{
  public static void test4thType1ChebyshevPolynomial()
  {
    Type1ChebyshevPolynomialSequence T = new Type1ChebyshevPolynomialSequence();
    try ( Integer n = new Integer(); Real correct = Real.newVector(5);)
    {
      RealPolynomial T4 = T.evaluate(n.set(4), 1, 128, new RealPolynomial());
      correct.set(1, 0, -8, 0, 8);
      assertEquals(T4.getCoeffs(), correct);
    }
  }
}
