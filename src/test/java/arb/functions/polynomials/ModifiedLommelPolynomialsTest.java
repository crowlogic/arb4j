package arb.functions.polynomials;

import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ModifiedLommelPolynomialsTest extends
                                           TestCase
{

  /**
   * <pre>
   * 0 = 1,
   * 1 = z, 
   * 2 = 3*z^2-1, 
   * 3 = 15*z^3-6*z, 
   * 4 = 105*z^4-45*z^ 2+1, 
   * 5 = 945*z^5-420*z^3+15*z, 
   * 6 = 10395*z^6-4725*z^4+210*z^2-1, 
   * 7 = 135135*z^7 -62370*z^5+3150*z^3-28*z, 
   * 8 = 2027025*z^8-945945*z^6+51975*z^4-630*z^2+1, 
   * 9 = 34459425*z^9-16216200*z^7+945945*z^5-13860*z^3+45*z
   * </pre>
   */
  public void testModifiedLommelPolynomials()
  {
    try ( ModifiedLommelPolynomials m = new ModifiedLommelPolynomials())
    {
      for (int i = 0; i < 10; i++)
      {
        RealPolynomial p = m.evaluate(i, 128);
        if ( i == 3 )
        {
          System.out.println("h[" + i + "]=" + p );
        }
        if (i == 9)
        {
          assertEquals("34459425*x⁹ - 16216200*x⁷ + 945945*x⁵ - 13860*x³ + 45*x", p.toString());
        }
      }
    }

  }

  
}
