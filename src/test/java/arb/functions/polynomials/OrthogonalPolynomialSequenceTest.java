package arb.functions.polynomials;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.real.RealChebyshevPolynomialsOfTheFirstKind;
import arb.functions.polynomials.orthogonal.real.RealHermitePolynomials;
import arb.functions.polynomials.orthogonal.real.RealLegendrePolynomials;
import arb.functions.polynomials.orthogonal.real.RealType1ChebyshevPolynomials;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class OrthogonalPolynomialSequenceTest extends
                                              TestCase
{

  public static void test4thType1ChebyshevPolynomial()
  {
    try ( RealChebyshevPolynomialsOfTheFirstKind T = new RealChebyshevPolynomialsOfTheFirstKind(); Integer n = new Integer();
          Real correct = Real.newVector(5);)
    {
      RealPolynomial T4 = T.evaluate(n.set(4), 1, 128, new RealPolynomial());
      correct.set(1, 0, -8, 0, 8);
      assertEquals(T4.getCoeffs(), correct);
    }
  }

  public static void testLegendrePolynomials()
  {
    try ( RealLegendrePolynomials P = new RealLegendrePolynomials(128))

    {

      for (int i = 0; i < 10; i++)
      {
        RealPolynomial r = P.evaluate(i, 128);
        // System.out.format("P[%d]=%s\n", i, r);
        if (i == 9)
        {
          assertEquals("94.9609375*x⁹ - 201.09375*x⁷ + 140.765625*x⁵ - 36.09375*x³ + 2.4609375*x", r.toString());
        }
      }
    }
  }

  public void testHermitePolynomials()
  {
    try ( RealHermitePolynomials H = new RealHermitePolynomials(128))

    {

      for (int i = 0; i < 10; i++)
      {
        RealPolynomial r = H.evaluate(i, 128);
        // System.out.format("H[%d]=%s\n", i, r);
        if (i == 9)
        {
          assertEquals("512*x⁹ - 9216*x⁷ + 48384*x⁵ - 80640*x³ + 30240*x", r.toString());
        }
      }
    }
  }

  public void testType1ChebyshevPolynomials()
  {
    try ( RealType1ChebyshevPolynomials T = new RealType1ChebyshevPolynomials(128))

    {

      for (int i = 0; i < 10; i++)
      {
        RealPolynomial r = T.evaluate(i, 128);
        if (i == 9)
        {
          assertEquals("256*x⁹ - 576*x⁷ + 432*x⁵ - 120*x³ + 9*x", r.toString());
        }
      }
    }
  }

  public void testChebyshevPolynomialsOfTheFirstKind()
  {
    try ( RealChebyshevPolynomialsOfTheFirstKind T = new RealChebyshevPolynomialsOfTheFirstKind(128))
    {
      for (int i = 0; i < 10; i++)
      {
        RealPolynomial r = T.evaluate(i, 128);
        if (i == 9)
        {
          assertEquals("256*x⁹ - 576*x⁷ + 432*x⁵ - 120*x³ + 9*x", r.toString());
        }
      }
    }
  }

}
