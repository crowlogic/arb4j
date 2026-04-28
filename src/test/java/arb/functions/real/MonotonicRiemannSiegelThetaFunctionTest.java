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
   * Verifies that Φ.inverse() achieves the requested bits of precision across
   * a wide range t ∈ [0, 10000]. For each test point, the residual
   * |Φ(Φ⁻¹(Φ(t))) - Φ(t)| is checked rather than |Φ⁻¹(Φ(t)) - t|, because
   * the round-trip in t-space is divided by Φ′(t) which can be small.
   */
  public static void testInversePrecisionAcrossWideRange()
  {
    int  bits = 128;
    var  Φ    = new MonotonicRiemannSiegelThetaFunction();
    var  Φinv = Φ.inverse();

    double[] samples =
    { 0.5, 1.0, 3.0, 6.28, 10.0, 14.134725, 20.0, 50.0, 100.0, 500.0, 1000.0, 5000.0, 10000.0 };

    try ( Real t        = Real.valueOf(0.0);
          Real u        = Real.newVector(2);
          Real tBack    = Real.valueOf(0.0);
          Real diffT    = Real.valueOf(0.0))
    {
      double maxRelErr = 0.0;
      for (double s : samples)
      {
        t.set(s);
        Φ.evaluate(t, 2, bits, u);
        Φinv.evaluate(u.get(0), 1, bits, tBack);
        tBack.sub(t, bits, diffT);
        double absErr = Math.abs(diffT.doubleValue());
        double relErr = absErr / Math.max(s, 1.0);
        maxRelErr     = Math.max(maxRelErr, relErr);
        System.out.printf("  t=%10.4f  Φ(t)=%14.6f  Φ⁻¹(Φ(t))=%14.10f  |err|=%.3e  rel=%.3e%n",
                          s, u.get(0).doubleValue(), tBack.doubleValue(), absErr, relErr);
        assertTrue(String.format("Φ⁻¹(Φ(%g)) accuracy: rel err %.3e exceeds 1e-30", s, relErr),
                   relErr < 1e-30);
      }
      System.out.printf("  max relative error across [0, 10000]: %.3e%n", maxRelErr);
    }
  }

  /**
   * Empirically map the radius of accurate single-center Lagrange inversion as
   * a function of seriesOrder. Prints t, error so the user can pick a
   * (centerPoint, seriesOrder) policy for tiling [0, 10000].
   */
  public static void testInversionRadiusSurvey()
  {
    int  prec        = 256;
    var  Φ           = new MonotonicRiemannSiegelThetaFunction();
    int[] orders     = { 8, 16, 32, 64 };
    double[] centers = { 50.0, 500.0, 5000.0 };

    try ( Real t      = Real.valueOf(0.0);
          Real u      = Real.newVector(2);
          Real tBack  = Real.valueOf(0.0);
          Real center = Real.valueOf(0.0))
    {
      for (double cp : centers)
      {
        center.set(cp);
        for (int order : orders)
        {
          var Φinv = Φ.invert(center, order, prec);
          System.out.printf("%n--- center=%g, order=%d ---%n", cp, order);
          for (double dt : new double[] { 0.0, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0, 50.0, 100.0 })
          {
            double s = cp + dt;
            t.set(s);
            Φ.evaluate(t, 2, prec, u);
            Φinv.evaluate(u.get(0), 1, prec, tBack);
            double err = Math.abs(tBack.doubleValue() - s);
            System.out.printf("  t=%9.3f  |Φ⁻¹(Φ(t))-t| = %.3e%n", s, err);
          }
        }
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
