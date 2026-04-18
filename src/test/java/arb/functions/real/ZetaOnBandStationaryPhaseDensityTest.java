package arb.functions.real;

import arb.Real;
import junit.framework.TestCase;

/**
 * Tests for {@link ZetaOnBandStationaryPhaseDensity}.
 *
 * <p>
 * The evaluator is the analytic stationary-phase / frequency-matching formula
 * of Theorem "On-band density" (Block C) in
 * {@code docs/RiemannHypothesisProof.tex}, expressed declaratively through the
 * arb4j {@link arb.expressions Expression Compiler}. These tests verify the
 * identities the compiled expressions encode:
 *
 * <ul>
 * <li>the saddle-mode identity n₀(t, ν) = exp((1-|ν|)·ϑ'(t));</li>
 * <li>the frequency-matching identity σ·(1 - log(n₀)/ϑ'(t)) = ν for σ = sgn(ν)
 *     — the repo-grounded stationary-phase condition;</li>
 * <li>symmetry of the density under ν → -ν;</li>
 * <li>finiteness and reproducibility of the evaluator;</li>
 * <li>rejection of out-of-band ν.</li>
 * </ul>
 *
 * <p>
 * {@link #testNumericalGaussianConfirmation()} is the only test that uses
 * numerical integration, and purely as an <em>optional confirmation</em> that
 * the stationary-phase amplitude matches the Gaussian integral it is derived
 * from. The evaluator itself contains no numerical integration.
 */
@SuppressWarnings("resource")
public class ZetaOnBandStationaryPhaseDensityTest extends
                                                 TestCase
{
  private static final int BITS = 128;

  public void testSaddleModeIdentity()
  {
    try ( var ev = new ZetaOnBandStationaryPhaseDensity();
          Real ν0 = new Real().set(0.3);
          Real t0 = new Real().set(500);
          Real n0 = new Real();
          Real jet = Real.newVector(2))
    {
      ev.saddleMode(ν0, t0, BITS, n0);

      try ( var θ = new RiemannSiegelThetaFunction())
      {
        θ.evaluate(t0, 2, BITS, jet);
        double θp       = jet.get(1).doubleValue();
        double expected = Math.exp((1 - Math.abs(0.3)) * θp);
        assertEquals("n₀ = exp((1-|ν|)·ϑ'(t))", expected, n0.doubleValue(), expected * 1e-12);
      }
    }
  }

  public void testFrequencyMatchingAtSaddleMode()
  {
    try ( var ev = new ZetaOnBandStationaryPhaseDensity();
          Real t0 = new Real().set(500))
    {
      double[] νs = { -0.75, -0.3, 0.1, 0.42, 0.9 };
      for (double νd : νs)
      {
        try ( Real ν0 = new Real().set(νd);
              Real freq = new Real())
        {
          ev.instantaneousFrequency(ν0, t0, BITS, freq);
          assertEquals("frequency-matching at ν=" + νd, νd, freq.doubleValue(), 1e-12);
        }
      }
    }
  }

  public void testEvaluatorIsFiniteAndReproducible()
  {
    try ( var ev = new ZetaOnBandStationaryPhaseDensity();
          Real ν0 = new Real().set(0.42);
          Real t0 = new Real().set(500);
          Real first = new Real();
          Real second = new Real())
    {
      ev.evaluate(ν0, t0, BITS, first);
      ev.evaluate(ν0, t0, BITS, second);
      double a = first.doubleValue();
      double b = second.doubleValue();
      assertTrue("evaluator produced a finite density; got " + a, Double.isFinite(a));
      assertEquals("repeated evaluation reproduces the same value", a, b, 0.0);
    }
  }

  public void testDensitySymmetryUnderFrequencyReflection()
  {
    try ( var ev = new ZetaOnBandStationaryPhaseDensity();
          Real ν0 = new Real().set(0.55);
          Real ν0neg = new Real().set(-0.55);
          Real t0 = new Real().set(500);
          Real pos = new Real();
          Real neg = new Real())
    {
      ev.evaluate(ν0, t0, BITS, pos);
      ev.evaluate(ν0neg, t0, BITS, neg);
      double p     = pos.doubleValue();
      double n     = neg.doubleValue();
      double scale = Math.max(Math.abs(p), 1.0);
      assertEquals("K_∞(ν;t) = K_∞(-ν;t) (real warped signal)", p, n, scale * 1e-30);
    }
  }

  public void testRejectsFrequencyAtOrOutsideBand()
  {
    try ( var ev = new ZetaOnBandStationaryPhaseDensity();
          Real t0 = new Real().set(500);
          Real res = new Real())
    {
      double[] bad = { -1.5, -1.0, 0.0, 1.0, 1.7 };
      for (double νd : bad)
      {
        try ( Real ν0 = new Real().set(νd))
        {
          try
          {
            ev.evaluate(ν0, t0, BITS, res);
            fail("expected IllegalArgumentException for ν = " + νd);
          }
          catch (IllegalArgumentException expected)
          {
            // ok
          }
        }
      }
    }
  }

  /**
   * Optional numerical-integration confirmation: the stationary-phase
   * amplitude of a pure Gaussian-phase oscillatory integral equals
   * (2π/|Φ''|)^{1/2}. This test computes a fine trapezoidal approximation to
   *
   * <pre>
   *   I = ∫_{-L}^{L} exp(i · ½ Φ'' · x²) dx
   * </pre>
   *
   * for |Φ''| = |ϑ''(500)| and checks its modulus against the closed-form
   * (2π/|Φ''|)^{1/2} used inside the compiled density expression. The
   * evaluator itself does no numerical integration.
   */
  public void testNumericalGaussianConfirmation()
  {
    try ( Real t0 = new Real().set(500);
          Real jet = Real.newVector(3);
          var θ = new RiemannSiegelThetaFunction())
    {
      θ.evaluate(t0, 3, BITS, jet);
      double absΦpp = Math.abs(2.0 * jet.get(2).doubleValue());

      double L  = 400.0 / Math.sqrt(absΦpp);
      int    N  = 200_000;
      double dx = (2 * L) / N;

      double re = 0, im = 0;
      for (int k = 0; k <= N; k++)
      {
        double x   = -L + k * dx;
        double arg = 0.5 * absΦpp * x * x;
        double w   = (k == 0 || k == N) ? 0.5 : 1.0;
        re += w * Math.cos(arg);
        im += w * Math.sin(arg);
      }
      re *= dx;
      im *= dx;

      double numerical = Math.hypot(re, im);
      double analytic  = Math.sqrt(2 * Math.PI / absΦpp);

      assertEquals("‖∫ e^{i½Φ''x²}dx‖ matches (2π/|Φ''|)^{1/2}", analytic, numerical, analytic * 1e-2);
    }
  }
}
