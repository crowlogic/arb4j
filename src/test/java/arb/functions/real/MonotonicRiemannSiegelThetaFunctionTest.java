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

  /**
   * Round-trip test of the local Lagrange inversion of Φ around a centerpoint:
   * for t near the centerpoint, Φ⁻¹(Φ(t)) ≈ t.
   */
  public static void testInversionRoundTripNearCenter()
  {
    int  prec        = 128;
    int  seriesOrder = 12;
    var  Φ           = new MonotonicRiemannSiegelThetaFunction();

    try ( Real centerPoint = Real.valueOf(50.0);
          Real t           = Real.valueOf(0.0);
          Real u           = Real.newVector(2);
          Real tBack       = Real.valueOf(0.0))
    {
      var Φinv = Φ.invert(centerPoint, seriesOrder, prec);

      double[] samples =
      { 49.0, 49.5, 50.0, 50.5, 51.0 };

      for (double s : samples)
      {
        t.set(s);
        Φ.evaluate(t, 2, prec, u);
        Φinv.evaluate(u.get(0), 1, prec, tBack);
        double err = tBack.doubleValue() - s;
        assertEquals(String.format("Φ⁻¹(Φ(%g)) = %g", s, tBack.doubleValue()),
                     0.0,
                     err,
                     1e-9);
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
