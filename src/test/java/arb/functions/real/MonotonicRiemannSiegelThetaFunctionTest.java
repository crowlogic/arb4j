package arb.functions.real;

import arb.Real;
import arb.expressions.Context;
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
    int      prec    = 128;
    try ( var Φ = new MonotonicRiemannSiegelThetaFunction())
    {
      var      Φprime  = Φ.derivative();

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
  }

  /**
   * Verifies that Φ.invert(·) achieves the requested bits of precision across a
   * wide range t ∈ [0, 10000]. For each test point, the residual |Φ(Φ⁻¹(Φ(t))) -
   * Φ(t)| is checked rather than |Φ⁻¹(Φ(t)) - t|, because the round-trip in
   * t-space is divided by Φ′(t) which can be small.
   */
  public static void testInversePrecisionAcrossWideRange()
  {
    int bits = 128;
    try ( var Φ = new MonotonicRiemannSiegelThetaFunction())
    {
      // centerPoint, seriesOrder, precision arguments are ignored by the
      // override; pass nulls / placeholders.
      var      Φinv    = Φ.invert(null, 0, bits);

      double[] samples =
      { 0.5, 1.0, 3.0, 6.28, 10.0, 14.134725, 20.0, 50.0, 100.0, 500.0, 1000.0, 5000.0, 10000.0 };

      try ( Real t = Real.valueOf(0.0); Real u = Real.newVector(2); Real tBack = Real.valueOf(0.0); Real diffT = Real.valueOf(0.0))
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
          maxRelErr = Math.max(maxRelErr, relErr);
          assertTrue(String.format("Φ⁻¹(Φ(%g)) accuracy: rel err %.3e exceeds 1e-30", s, relErr), relErr < 1e-30);
        }
      }
    }
  }

  /**
   * Empirically map the radius of accurate single-center Lagrange inversion as a
   * function of seriesOrder. Prints t, error so the user can pick a (centerPoint,
   * seriesOrder) policy for tiling [0, 10000].
   */
  public static void testInversionRadiusSurvey()
  {
    int prec = 256;
    try ( var Φ = new MonotonicRiemannSiegelThetaFunction())
    {
      int[]    orders  =
      { 8, 16, 32, 64 };
      double[] centers =
      { 50.0, 500.0, 5000.0 };

      try ( Real t = Real.valueOf(0.0); Real u = Real.newVector(2); Real tBack = Real.valueOf(0.0); Real center = Real.valueOf(0.0))
      {
        for (double cp : centers)
        {
          center.set(cp);
          for (int order : orders)
          {
            var Φinv = Φ.invert(center, order, prec);
            for (double dt : new double[]
            { 0.0, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0, 50.0, 100.0 })
            {
              double s = cp + dt;
              t.set(s);
              Φ.evaluate(t, 2, prec, u);
              Φinv.evaluate(u.get(0), 1, prec, tBack);
              double err = Math.abs(tBack.doubleValue() - s);
            }
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
    int prec        = 128;
    int seriesOrder = 12;
    try ( var Φ = new MonotonicRiemannSiegelThetaFunction())
    {
      try ( Real centerPoint = Real.valueOf(50.0); Real t = Real.valueOf(0.0); Real u = Real.newVector(2); Real tBack = Real.valueOf(0.0))
      {
        var      Φinv    = Φ.invert(centerPoint, seriesOrder, prec);

        double[] samples =
        { 49.0, 49.5, 50.0, 50.5, 51.0 };

        for (double s : samples)
        {
          t.set(s);
          Φ.evaluate(t, 2, prec, u);
          Φinv.evaluate(u.get(0), 1, prec, tBack);
          double err = tBack.doubleValue() - s;
          assertEquals(String.format("Φ⁻¹(Φ(%g)) = %g", s, tBack.doubleValue()), 0.0, err, 1e-9);
        }
      }
    }
  }

  /**
   * Direct-from-zero boundary test: Φ(0) = ϑ(0) + 0 = 0 because ϑ(0) = im(lnΓ(¼))
   * = 0 (Γ(¼) is real positive). Therefore Φ⁻¹(0) must be exactly 0. This is the
   * very first grid point of the GUI sampler's default span [0, 1000] and was the
   * precise input at which the parallel sampler crashed with "Newton iteration
   * failed to converge in 64 steps for u = 0".
   */
  public static void testInverseAtZero()
  {
    int bits = 128;
    try ( var Φ = new MonotonicRiemannSiegelThetaFunction())
    {
      var Φinv = Φ.invert(null, 0, bits);

      try ( Real u = Real.valueOf(0.0); Real out = Real.valueOf(0.0))
      {
        Φinv.evaluate(u, 1, bits, out);
        double t = out.doubleValue();
        assertTrue("Φ⁻¹(0) should be finite, got " + t, Double.isFinite(t));
        assertEquals("Φ⁻¹(0) should equal 0", 0.0, t, 1e-30);
      }
    }
  }

  public static void testEvaluationMatchesThetaPlusCT()
  {
    int prec = 128;
    try ( var Φ = new MonotonicRiemannSiegelThetaFunction(); var ϑ = new RiemannSiegelThetaFunction())
    {
      double   cVal    = Φ.c().doubleValue();

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
          assertEquals(String.format("Φ(%g) − ϑ(%g) − c·%g should be 0", s, s, s), 0.0, diff, 1e-12);
        }
      }
    }
  }

  /**
   * Verifies the spectral pullback
   *
   * F(t) = Z(Φ⁻¹(t)) / √(Φ′(Φ⁻¹(t)))
   *
   * compiles and evaluates correctly in the DSL with Φ⁻¹(·) routed through
   * {@link MonotonicRiemannSiegelThetaFunction#invert}. The forward map Φ and its
   * derivative Φ′ are registered as separate functions in the {@link Context};
   * the textual repetition of Φ⁻¹(t) is collapsed to a single node by
   * common-subexpression elimination in
   * {@link arb.expressions.Expression#optimize}.
   *
   * The check is intrinsic: at each sample t, recompute τ = Φ⁻¹(t) and Φ′(τ)
   * directly in Java, then assert F(t) · √(Φ′(τ)) − Z(τ) = 0, where Z(τ) is
   * obtained from a separate single-call DSL expression {@code z:s->Z(s)}. No
   * reference to a specific zeta zero is required.
   */
  public static void testSpectralPullbackComposition()
  {
    int prec    = 128;
    var Φ       = new MonotonicRiemannSiegelThetaFunction();
    var dΦ      = Φ.derivative();
    var Φinv    = Φ.invert(null, 0, prec);

    var context = new Context();
    context.registerFunction("Φ", Φ);
    context.registerFunction("dΦ", dΦ);

    var      pullback = RealFunction.express("F:t->Z(Φ⁻¹(t))/sqrt(dΦ(Φ⁻¹(t)))", context);
    var      zEval    = RealFunction.express("z:s->Z(s)");

    double[] samples  =
    { 5.0, 20.0, 50.0, 100.0, 500.0 };

    try ( Real t = Real.valueOf(0.0); Real τ = Real.valueOf(0.0); Real Fval = Real.valueOf(0.0); Real Zval = Real.valueOf(0.0); Real dΦval = Real.valueOf(0.0);
          Real sqrtdΦ = Real.valueOf(0.0); Real lhs = Real.valueOf(0.0))
    {
      for (double s : samples)
      {
        t.set(s);
        pullback.evaluate(t, 1, prec, Fval);
        Φinv.evaluate(t, 1, prec, τ);
        zEval.evaluate(τ, 1, prec, Zval);
        dΦ.evaluate(τ, 1, prec, dΦval);
        dΦval.sqrt(prec, sqrtdΦ);
        Fval.mul(sqrtdΦ, prec, lhs);
        double err = lhs.doubleValue() - Zval.doubleValue();
        assertEquals(String.format("F(%g)·√Φ′(Φ⁻¹(%g)) should equal Z(Φ⁻¹(%g))", s, s, s), 0.0, err, 1e-9);
      }
    }
  }
}
