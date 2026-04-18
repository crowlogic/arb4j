package arb.functions;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * Numerical evaluation of
 *
 * K_T(ν) = ∫_{T_0}^{T} ζ(½ + ⅈt) · √(ϑ'(t)) · exp(-ⅈνϑ(t)) dt
 *
 * for a given frequency ν and upper limit T, using the recently committed
 * {@link NumericalRealFunctionIntegral} pattern extended to complex-valued
 * integrands via {@link NumericalComplexFunctionIntegral}.
 *
 * The integrand is parsed directly by the expression compiler as a
 * {@link arb.functions.RealToComplexFunction}; the built-in jet nodes for ζ, ϑ,
 * and diff(·, t) handle the analytic content.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class KTFourierIntegralTest extends
                                   TestCase
{
  static final int    BITS      = 128;

  static final String INTEGRAND = "ζ(½+ⅈ*t)*√(diff(ϑ(t),t))*exp(-ⅈ*ν*ϑ(t))";

  /**
   * Build the K_T(ν) integrator: F(T) = ∫_{T_0}^{T} integrand dt, for a fixed ν.
   *
   * The caller must close the returned object.
   */
  public static NumericalComplexFunctionIntegral build(double nu, double T0, double dt, int bits)
  {
    Context               context   = new Context(Real.named("ν").set(nu));
    RealToComplexFunction integrand = RealToComplexFunction.express(INTEGRAND, context);
    return new NumericalComplexFunctionIntegral(integrand,
                                                T0,
                                                dt,
                                                bits);
  }

  /**
   * Evaluate K_T(ν) at a single (ν, T) pair. Convenience wrapper; internally
   * constructs and disposes a fresh integrator.
   */
  public static Complex evaluateKT(double nu, double T0, double T, double dt, int bits, Complex result)
  {
    try ( NumericalComplexFunctionIntegral F = build(nu, T0, dt, bits); Real xT = new Real().set(T))
    {
      return F.evaluate(xT, 1, bits, result);
    }
  }

  /**
   * Smoke test: the integrator constructs, compiles the integrand, and returns a
   * finite complex value at a short upper limit. No claim about the value.
   */
  public void testBuildAndEvaluate()
  {
    double nu = -1.0;
    double T0 = 10.0;
    double T  = 20.0;
    double dt = 0.01;

    try ( Complex result = new Complex())
    {
      evaluateKT(nu, T0, T, dt, BITS, result);
      double re = result.getReal().doubleValue();
      double im = result.getImag().doubleValue();
      assertFalse("Re K_T(ν) is NaN", Double.isNaN(re));
      assertFalse("Im K_T(ν) is NaN", Double.isNaN(im));
      assertFalse("Re K_T(ν) is infinite", Double.isInfinite(re));
      assertFalse("Im K_T(ν) is infinite", Double.isInfinite(im));
    }
  }

  /**
   * Sweep ν across the band [−2,0] and off the band, printing |K_T(ν)| at a fixed
   * T. Off-band values are expected to decay as T → ∞; this test only asserts
   * that the computation completes and returns finite values, not the decay
   * itself.
   */
  public void testSweepFrequency()
  {
    double   T0  = 10.0;
    double   T   = 11.0;
    double   dt  = 0.1;

    double[] νs = new double[]
    { -3.0, -2.5, -2.0, -1.5, -1.0, -0.5, 0.0, 0.5, 1.0 };

    try ( Complex result = new Complex())
    {
      for (double ν : νs)
      {
        evaluateKT(ν, T0, T, dt, BITS, result);
        var re  = result.getReal();
        var im  = result.getImag();
        var mag = result.abs(BITS, new Real());
        assertTrue("ν=" + ν + ": |K_T| is not finite", mag.isFinite());
        assertFalse("ν=" + ν + ": |K_T| is infinite", mag.isInfinite());
        //System.out.format("K_T(ν=%s) at T=%s: %s + %si   |·|=%s%n", ν, T, re, im, mag);
      }
    }
  }
}
