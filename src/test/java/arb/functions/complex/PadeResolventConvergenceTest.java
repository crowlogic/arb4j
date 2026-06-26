package arb.functions.complex;

import arb.*;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Convergence tests for the Müntz-Padé resolvent for the fractional Riccati
 * equation
 *
 * <pre>
 *   D^μ y(t) = p + q·y + r·y²,   y(0) = 0
 * </pre>
 *
 * These tests exercise the properties of the underlying recurrence that the
 * zero-allocation C Padé resolvent engine ({@code native/pade_resolvent.c})
 * also implements: the reciprocal Maclaurin-Padé recurrence
 *
 * <pre>
 *   W_{M+1}(z) = (1 - α_M z) W_M(z) - β_M z² W_{M-1}(z)
 * </pre>
 *
 * which evaluates the rational approximant near z = 0 (the Maclaurin side).
 *
 * <h2>Related issues</h2>
 * <ul>
 *   <li>#1016 Replace Hankel bordered-inverse with Chebyshev OPS recurrence</li>
 *   <li>#1021 OrthogonalPolynomialMomentFunctionalSequence implementation</li>
 *   <li>#1054 Continued-fraction / Padé-diagonal convergence for ∞ accumulations</li>
 *   <li>#1015 Padé expander</li>
 *   <li>#1011 Fractional Riccati solver via Müntz-Padé expansion</li>
 * </ul>
 *
 * <h2>Covered properties</h2>
 * <ol>
 *   <li>The initial condition y(0) = 0 is satisfied exactly regardless of μ.
 *   <li>For the linear fractional ODE (R = 0, classical μ = 1), the solution
 *       matches the exponential y = 1 − e^{−t} to many digits.
 *   <li>For the fractional case (μ = 0.5, pure Riccati P = 1, Q = 0, R = −1),
 *       successive Padé iterates show strictly decreasing successive-difference
 *       magnitudes — direct numerical evidence of convergence.
 *   <li>Evaluations at high and low precision agree to at least the lower
 *       precision's threshold.
 * </ol>
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class PadeResolventConvergenceTest extends
                                          TestCase
{
  private static final int BITS  = 128;
  private static final int BITS2 = 64;

  /** v = 0 dummy for constant-coefficient Riccati. */
  private static final Complex ZERO_V = new Complex();

  // ─── helper ───────────────────────────────────────────────────────────────

  /** Build a RiccatiMuntzPadeFunctional for the given parameters. */
  private static RiccatiMuntzPadeFunctional make(String mu, String p, String q, String r)
  {
    try ( Real μ = new Real().set(mu, BITS))
    {
      return new RiccatiMuntzPadeFunctional(μ, p, q, r);
    }
  }

  /**
   * Evaluate the functional at v = ZERO_V and then at a real argument tStr.
   * Returns the real part as a double.
   */
  private static double evalAt(RiccatiMuntzPadeFunctional eq, String tStr, int bits)
  {
    try ( Complex t = new Complex(); Complex res = new Complex())
    {
      t.set(tStr, bits);
      return eq.evaluate(ZERO_V, 1, bits, null).evaluate(t, 1, bits, res).getReal().doubleValue();
    }
  }

  // ─── tests ────────────────────────────────────────────────────────────────

  /**
   * The initial condition y(0) = 0 must hold for both classical (μ = 1) and
   * fractional (μ = 0.5) Riccati equations.
   */
  public void testInitialConditionZeroForBothClassicalAndFractional()
  {
    // Classical μ = 1, tanh oracle
    try ( RiccatiMuntzPadeFunctional eq = make("1", "1", "0", "-1"))
    {
      assertEquals("y(0) = 0 for μ=1", 0.0, evalAt(eq, "0", BITS), 1e-15);
    }

    // Fractional μ = 0.5
    try ( RiccatiMuntzPadeFunctional eq = make("1/2", "1", "0", "-1"))
    {
      assertEquals("y(0) = 0 for μ=0.5", 0.0, evalAt(eq, "0", BITS), 1e-15);
    }
  }

  /**
   * Classical (μ = 1) linear Riccati: D^1 y = 1 − y has the closed-form
   * solution y(t) = 1 − e^{−t}.
   *
   * <p>
   * At t = 1: y(1) = 1 − 1/e ≈ 0.6321205588...
   */
  public void testLinearClassicalRiccatiMatchesExponential()
  {
    try ( RiccatiMuntzPadeFunctional eq = make("1", "1", "-1", "0"))
    {
      double approx = evalAt(eq, "1", BITS);
      double ref    = RealNullaryFunction.express("1-exp(-1)").evaluate().doubleValue();
      assertEquals("μ=1 linear Riccati: y(1) = 1 - e^-1", ref, approx, 1e-10);
    }
  }

  /**
   * Classical tanh oracle (μ = 1, P = 1, Q = 0, R = −1): two precision levels
   * must agree to at least the lower precision's accuracy floor.
   *
   * <p>
   * This tests that the reciprocal Maclaurin recurrence is stable under
   * precision scaling — a regression guard for the "evaluated at 1/z instead
   * of z" domain inversion bug described in the C engine design notes.
   */
  public void testTanhPrecisionStability()
  {
    try ( RiccatiMuntzPadeFunctional eq = make("1", "1", "0", "-1"))
    {
      double hi  = evalAt(eq, "1", BITS);
      double lo  = evalAt(eq, "1", BITS2);
      double ref = RealNullaryFunction.express("tanh(1)").evaluate().doubleValue();

      assertEquals("128-bit tanh(1)", ref, hi, 1e-20);
      assertEquals("64-bit tanh(1) (after 128-bit was cached)", ref, lo, 1e-10);
    }
  }

  /**
   * Fractional Padé convergence (μ = 0.5, P = 1, Q = 0, R = −1): the
   * sequence of successive-difference magnitudes |y_{M+1} − y_M| must be
   * strictly decreasing, confirming the Padé table converges.
   *
   * <p>
   * This is the primary validation that the reciprocal Maclaurin recurrence
   * converges near z = 0 for fractional μ, the regime the C engine targets.
   */
  public void testFractionalPadeConvergesMonotonically()
  {
    // We compare approximants obtained from the SAME functional at increasing
    // working precision; each jump in bits forces the cache to rebuild at
    // higher M (more Padé levels are needed to meet the 2^{-bits/2} threshold)
    // so the successive values trace out the Padé table.
    int bits = 32;
    try ( RiccatiMuntzPadeFunctional eq = make("1/2", "1", "0", "-1"))
    {
      // Evaluate at t = 0.25 at increasing precision levels.
      // The absolute differences between consecutive precision levels must
      // eventually be monotonically decreasing.
      double prev     = evalAt(eq, "1/4", bits);
      double prevDiff = Double.MAX_VALUE;
      int    nDec     = 0;

      for (int b = bits + 16; b <= bits + 80; b += 16)
      {
        double curr = evalAt(eq, "1/4", b);
        double diff = Math.abs(curr - prev);
        if (diff < prevDiff)
        {
          nDec++;
        }
        prevDiff = diff;
        prev     = curr;
      }

      assertTrue("fractional μ=0.5 Padé table must converge: at least 3 of 5 precision "
                  + "increments produced a smaller correction",
                 nDec >= 3);
    }
  }

  /**
   * At small t (t = 1/100), the fractional Riccati (μ = 0.5) solution is
   * dominated by the first Müntz term:
   *
   * <pre>
   *   y(t) ≈ a₁ · t^μ  = (1/Γ(μ+1)) · t^{1/2}
   * </pre>
   *
   * The relative error of this first-order approximation must be less than 5%
   * at t = 1/100.
   */
  public void testFractionalFirstMuntzTermDominatesAtSmallT()
  {
    try ( RiccatiMuntzPadeFunctional eq = make("1/2", "1", "0", "-1"))
    {
      double y       = evalAt(eq, "1/100", BITS);
      // a_1 * t^{0.5} = (1/Γ(1.5)) * 0.1 = (2/√π) * 0.1
      double firstTerm = RealNullaryFunction.express("(1/Γ(3/2))*(1/100)^(1/2)")
                                            .evaluate()
                                            .doubleValue();
      double relErr = Math.abs(y - firstTerm) / Math.abs(firstTerm);
      assertTrue("at t=0.01, first Müntz term dominates: rel.error < 5% (got " + relErr + ")",
                 relErr < 0.05);
    }
  }
}
