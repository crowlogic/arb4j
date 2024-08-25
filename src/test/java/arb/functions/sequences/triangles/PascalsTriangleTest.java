package arb.functions.sequences.triangles;

import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.sequences.integer.PascalsTriangle;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class PascalsTriangleTest extends
                                 TestCase
{

  public void testGenerationOfPascalsTriangleOfBinomialCoeffecients()
  {
    try ( PascalsTriangle pascalsTriangle = new PascalsTriangle())
    {
      RealPolynomial row = pascalsTriangle.evaluate(10, 128, new RealPolynomial());
      assertEquals("10*x⁹ + 45*x⁸ + 120*x⁷ + 210*x⁶ + 252*x⁵ + 210*x⁴ + 120*x³ + 45*x² + 10*x + 1", row.toString());
    }
  }

}
