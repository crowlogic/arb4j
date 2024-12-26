package arb.functions.polynomials;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.real.ChebyshevPolynomialsOfTheFirstKind;
import arb.functions.polynomials.orthogonal.real.HermitePolynomials;
import arb.functions.polynomials.orthogonal.real.LaguerrePolynomials;
import arb.functions.polynomials.orthogonal.real.LegendrePolynomials;
import arb.functions.polynomials.orthogonal.real.Type1ChebyshevPolynomials;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class OrthogonalPolynomialSequenceTest extends
                                              TestCase
{

  public static void testLaguerrePolynomials()
  {
    try ( LaguerrePolynomials P = new LaguerrePolynomials(128))

    {
      RealPolynomial r = P.evaluate(2, 128);
      assertEquals("0.5*x² - 2*x + 1", r.toString());

    }
  }

  public static void test4thType1ChebyshevPolynomial()
  {
    try ( ChebyshevPolynomialsOfTheFirstKind T = new ChebyshevPolynomialsOfTheFirstKind(); Integer n = new Integer();
          Real correct = Real.newVector(5);)
    {
      RealPolynomial T4 = T.evaluate(n.set(4), 1, 128, new RealPolynomial());
      correct.set(1, 0, -8, 0, 8);
      assertEquals(T4.getCoeffs(), correct);
    }
  }

  public static void testLegendrePolynomials()
  {
    try ( LegendrePolynomials P = new LegendrePolynomials(128))

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
    try ( HermitePolynomials H = new HermitePolynomials(128))

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
    try ( Type1ChebyshevPolynomials T = new Type1ChebyshevPolynomials(128))

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
    try ( ChebyshevPolynomialsOfTheFirstKind T = new ChebyshevPolynomialsOfTheFirstKind(128))
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
