package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LinearRegressionTest extends
                                  TestCase
{
  @Override
  protected void tearDown() throws Exception
  {
    x.close();
    y.close();
    result.close();
  }

  private Real x, y;
  private RealPolynomial result;

  protected void setUp()
  {
    x      = Real.newVector(5);
    y      = Real.newVector(5);
    result = new RealPolynomial(2);    

    for (int i = 0; i < 5; i++)
    {
      x.get(i).set(i + 1);
      y.get(i).set(i + 6);
    }
  }

  final static int bits = 128;

  /**
   * For x=[1,2,3,4,5] and y=[6,7,8,9,10], we would expect the slope m=1 and the
   * intercept c=5 (since y=x+5). The intermediate steps should be calculated as
   * follows:
   *
   * <pre>
   * Sum Σx = 1+2+3+4+5 = 15.
   * Sum Σy = 6+7+8+9+10 = 40.
   * Sum Σ(xy) = 1*6 + 2*7 + 3*8 + 4*9 + 5*10 = 130.
   * Sum Σ(x^2) = 1^2 + 2^2 + 3^2 + 4^2 + 5^2 = 55.
   * N*Σ(xy) = 5 * 130 = 650.
   * Σx*Σy = 15 * 40 = 600.
   * N*Σ(xy) - Σx*Σy = 650 - 600 = 50.
   * N*Σ(x^2) = 5 * 55 = 275.
   * (Σx)^2 = 15^2 = 225.
   * N*Σ(x^2) - (Σx)^2 = 275 - 225 = 50.
   * (N*Σ(xy) - Σx*Σy) / (N*Σ(x^2) - (Σx)^2) = 50 / 50 = 1 (this is the slope, m).
   * m*Σx = 1 * 15 = 15.
   * Σy - m*Σx = 40 - 15 = 25.
   * (Σy - m*Σx) / N = 25 / 5 = 5 (this is the intercept, c).
   * </pre>
   */
  public void testLinearRegression()
  {
    result = x.linearlyRegress(y, bits, result);
    Real expectedSlope     = Real.valueOf(1);
    Real expectedIntercept = Real.valueOf(5);
    assertTrue(result.get(1).equals(expectedSlope));
    assertTrue(result.get(0).equals(expectedIntercept));
  }

}
