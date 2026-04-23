package arb.functions;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;


/**
 * Numerical evaluation of the tapered warped Fourier integral
 *
 * G(ν) = ∫_{-∞}^{∞} ζ(½+ⅈt) · √(Θ'(t)) · (1 + Θ(t)²)^(-α)
 *                    · exp(-ⅈ(ν-1)·Θ(t)) dt
 *
 * with Θ(t) := ϑ(t) + C·t and α := 1/12 + ε/2, via the half-line identity
 *
 *   G(ν) = 2 · Re K_T(ν),   K_T(ν) = ∫_{T_0}^{T} h(t) dt
 *
 * (the integrand satisfies h(-t) = conj h(t)). Truncation at finite T is
 * controlled by the envelope bound |h(t)| ⪅ |t|^{-ε}(log|t|)^β of Theorem 1.
 *
 * Uses {@link NumericalComplexFunctionIntegral} via
 * {@link WarpedFourierGFunctional}; the expression compiler handles ζ, ϑ, and
 * diff(·, t) symbolically.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class WarpedFourierGIntegralTest extends
                                        TestCase
{
  static final int    BITS = 128;

  /**
   * Theta-tilt C: must exceed -inf_t ϑ'(t). ϑ'(t) = (1/2) log(t/2π) + O(1/t²);
   * for t ≳ 7 this is already positive, and for smaller t the dip is shallow.
   * Taking C = 1 gives Θ'(t) = ϑ'(t) + 1 ≥ 1 uniformly past the origin region,
   * which is amply sufficient for strict monotonicity of Θ on the support of
   * the half-line integral below (t ≥ T_0 > 0).
   */
  static final double C     = 1.0;

  /**
   * α = 1/12 + ε/2. For ε = 0.1: α = 1/12 + 1/20 = 5/60 + 3/60 = 8/60 = 2/15.
   * We fix ε = 0.1 → α ≈ 0.1333 as a concrete instance of Theorem 1.
   */
  static final double EPS   = 0.1;
  static final double ALPHA = 1.0 / 12.0 + EPS / 2.0;

  /**
   * Convenience: evaluate 2·Re K_T(ν) at a single (ν, T) pair, which equals the
   * symmetric truncation G_T(ν) of the doubly-infinite integral.
   */
  public static double evaluateGTruncation(double nu,
                                           double T0,
                                           double T,
                                           double dt,
                                           int bits)
  {
    try ( Real    nuR = new Real().set(nu);
          Real    T0R = new Real().set(T0);
          Real    dtR = new Real().set(dt);
          Real    xT  = new Real().set(T);
          Complex K   = new Complex())
    {
      WarpedFourierGFunctional G = new WarpedFourierGFunctional(C, ALPHA, T0R, dtR, bits);
      try ( RealToComplexFunction integrator = G.evaluate(nuR, 1, bits, null))
      {
        integrator.evaluate(xT, 1, bits, K);
        return 2.0 * K.getReal().doubleValue();
      }
    }
  }

  /**
   * Smoke test: the integrator constructs, compiles the integrand, and returns
   * a finite complex value at a short upper limit. No claim about the value.
   */
  public void testBuildAndEvaluate()
  {
    double nu = 0.5;  // safely inside the conjectured band [1-τ, 1+τ]
    double T0 = 10.0;
    double T  = 20.0;
    double dt = 0.01;

    try ( Real    nuR = new Real().set(nu);
          Real    T0R = new Real().set(T0);
          Real    dtR = new Real().set(dt);
          Real    xT  = new Real().set(T);
          Complex K   = new Complex())
    {
      WarpedFourierGFunctional G = new WarpedFourierGFunctional(C, ALPHA, T0R, dtR, BITS);
      try ( RealToComplexFunction integrator = G.evaluate(nuR, 1, BITS, null))
      {
        integrator.evaluate(xT, 1, BITS, K);
        double re = K.getReal().doubleValue();
        double im = K.getImag().doubleValue();
        assertFalse("Re K_T(ν) is NaN", Double.isNaN(re));
        assertFalse("Im K_T(ν) is NaN", Double.isNaN(im));
        assertFalse("Re K_T(ν) is infinite", Double.isInfinite(re));
        assertFalse("Im K_T(ν) is infinite", Double.isInfinite(im));
      }
    }
  }

  /**
   * Sweep ν across a window centered at the divergence point ν = 1 and print
   * G_T(ν) = 2·Re K_T(ν) at a fixed truncation T. The integrand is only
   * conditionally convergent at the endpoints; we do not assert decay, only
   * that every computed value is a finite real number.
   *
   * This is the numerical probe of the band-limited support statement
   * supp G ⊆ [1-τ, 1+τ] of Theorem 3: for |ν-1| > τ the truncation should
   * tend to 0 as T → ∞.
   */
  public void testSweepFrequencyAroundOne()
  {
    double   T0  = 10.0;
    double   T   = 60.0;
    double   dt  = 0.05;

    // Centered window around ν = 1 where the integral is defined, plus a few
    // outlier points.
    double[] νs = new double[]
    { -1.0, -0.5, 0.0, 0.25, 0.5, 0.75, 0.9, 1.1, 1.25, 1.5, 2.0, 3.0 };

    try ( Real    T0R = new Real().set(T0);
          Real    dtR = new Real().set(dt);
          Real    xT  = new Real().set(T);
          Complex K   = new Complex())
    {
      WarpedFourierGFunctional Gfun = new WarpedFourierGFunctional(C, ALPHA, T0R, dtR, BITS);

      System.out.format("Warped Fourier G(ν) truncation (T_0=%.1f, T=%.1f, dt=%.3f, C=%.2f, α=%.4f):%n",
                        T0, T, dt, C, ALPHA);
      System.out.format("  ν        Re K_T(ν)       Im K_T(ν)       G_T(ν)=2·Re K_T%n");

      for (double ν : νs)
      {
        try ( Real nuR = new Real().set(ν);
              RealToComplexFunction integrator = Gfun.evaluate(nuR, 1, BITS, null))
        {
          integrator.evaluate(xT, 1, BITS, K);
          double re  = K.getReal().doubleValue();
          double im  = K.getImag().doubleValue();
          double G   = 2.0 * re;
          assertTrue("ν=" + ν + ": Re K_T not finite", Double.isFinite(re));
          assertTrue("ν=" + ν + ": Im K_T not finite", Double.isFinite(im));
          System.out.format("  %5.2f   %+14.6e   %+14.6e   %+14.6e%n", ν, re, im, G);
        }
      }
    }
  }
}
