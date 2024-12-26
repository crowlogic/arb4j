package arb.functions.polynomials.orthogonal;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.complex.ComplexBesselPolynomials;
import arb.functions.polynomials.orthogonal.real.BesselPolynomials;
import arb.functions.polynomials.orthogonal.real.RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BesselPolynomialsTest extends
                                   TestCase
{

  public void testComplexBesselPolynomials()
  {

    try ( ComplexBesselPolynomials y = new ComplexBesselPolynomials(128))
    {
      for (int i = 0; i < 10; i++)
      {
        var p = y.evaluate(i, 128);
        if (i == 5)
        {
          assertEquals("945*x⁵ + 945*x⁴ + 420*x³ + 105*x² + 15*x + 1", p.toString());
        }
      }

    }
  }

  public void testBesselPolynomials()
  {

    try ( RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence y = new BesselPolynomials(128))
    {
      for (int i = 0; i < 10; i++)
      {
        var p = y.evaluate(i, 128);
        if (i == 5)
        {
          assertEquals("945*x⁵ + 945*x⁴ + 420*x³ + 105*x² + 15*x + 1", p.toString());
        }
      }

    }
  }

}
