package arb.functions.real;

import arb.Real;
import junit.framework.TestCase;

/**
 * Verifies that the additive-shift monotonization Φ(t) = ϑ(t) + c·t with
 * default c = 3 has strictly positive derivative on [0, ∞).
 *
 * @author Stephen Crowley ©2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class MonotonicRiemannSiegelThetaFunctionTest extends
                                                     TestCase
{
  public static void testDerivativePositiveOnHalfLine()
  {
    int  prec   = 128;
    var  Φ      = new MonotonicRiemannSiegelThetaFunction();
    var  Φprime = Φ.derivative();

    double[] samples =
    { 0.0, 1.0e-3, 0.1, 1.0, 5.0, 14.134725, 50.0, 200.0, 1000.0 };

    try ( Real t = Real.valueOf(0.0); Real out = Real.newVector(2))
    {
      for (double s : samples)
      {
        t.set(s);
        Φprime.evaluate(t, 2, prec, out);
        double d = out.get(0).doubleValue();
        assertTrue(String.format("Φ′(%g) = %g should be > 0", s, d), d > 0);
      }
    }
  }

  public static void testEvaluationMatchesThetaPlusCT()
  {
    int  prec  = 128;
    var  Φ     = new MonotonicRiemannSiegelThetaFunction();
    var  ϑ     = new RiemannSiegelThetaFunction();
    double cVal = Φ.c().doubleValue();

    double[] samples =
    { 0.0, 1.0, 14.134725, 100.0 };

    try ( Real t = Real.valueOf(0.0); Real lhs = Real.newVector(2); Real rhs = Real.newVector(2))
    {
      for (double s : samples)
      {
        t.set(s);
        Φ.evaluate(t, 2, prec, lhs);
        ϑ.evaluate(t, 2, prec, rhs);
        double diff = lhs.get(0).doubleValue() - rhs.get(0).doubleValue() - cVal * s;
        assertEquals(String.format("Φ(%g) − ϑ(%g) − c·%g should be 0", s, s, s),
                     0.0,
                     diff,
                     1e-12);
      }
    }
  }
}
