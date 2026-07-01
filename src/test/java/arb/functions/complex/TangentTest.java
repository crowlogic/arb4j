package arb.functions.complex;

import arb.*;
import junit.framework.TestCase;

/**
 * Oracle test for {@link RiccatiMuntzPadeFunctional}: the classical (μ=1)
 * Riccati equation y′ = 1 + y² with y(0)=0 has the exact closed-form solution
 * y(t) = tan(t).
 *
 * <p>
 * Parameters: P = 1, Q = 0, R = +1, μ = 1.
 *
 * <p>
 * Unlike the {@link HyperbolicTangentTest} oracle (y′ = 1 − y² → tanh, an entire
 * function with no real singularities), tan(t) has a pole at t = π/2 ≈ 1.5708.
 * The Müntz–Padé resolvent analytically continues <em>through</em> that pole: the
 * value at t = 2.0 lies on the next branch, where tan(2) ≈ −2.18503986…, with the
 * opposite sign of the t &lt; π/2 values. This is the headline behaviour the
 * spectral Padé construction exists to provide — the Maclaurin series of tan
 * diverges for |t| ≥ π/2, yet the rational approximant converges past it.
 *
 * <p>
 * The functional is the same two-level indexed object used by the tanh oracle:
 *
 * <pre>
 *   functional.evaluate(v, ...) → ComplexFunction        (parameterised on v)
 *   function.evaluate(t, ...)   → Complex                (value at t)
 * </pre>
 *
 * Because P, Q, R are all constant in v, the parameter v is a dummy zero here.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class TangentTest extends
                         TestCase
{
  private static final int     BITS   = 256;

  /** Dummy v=0 used when parameterising the functional (constants in v). */
  private static final Complex ZERO_V = new Complex();

  /**
   * Build the FRMP functional for y′ = 1 + y², y(0) = 0 → y(t) = tan(t).
   * Fractional exponent μ = 1 (the classical, non-fractional Riccati).
   */
  private static RiccatiMuntzPadeFunctional makeTanFunctional()
  {
    return new RiccatiMuntzPadeFunctional(new Real().set("1", BITS),
                                          "1",
                                          "0",
                                          "1");
  }

  /**
   * Evaluate the functional at parameter v=0 to get the approximant, then
   * evaluate the approximant at the given real point t.
   */
  private static double evalAt(RiccatiMuntzPadeFunctional eq, String tStr)
  {
    ComplexFunction approximant = eq.evaluate(ZERO_V, 1, BITS, null);
    try ( Complex t = new Complex(); Complex result = new Complex())
    {
      t.set(tStr, BITS);
      approximant.evaluate(t, 1, BITS, result);
      return result.getReal().doubleValue();
    }
  }

  /** Reference value tan(tStr) computed directly at full working precision. */
  private static double tan(String tStr)
  {
    try ( Real t = new Real().set(tStr, BITS); Real r = new Real())
    {
      return t.tan(BITS, r).doubleValue();
    }
  }

  /** tan(0) = 0 — the initial condition must be satisfied exactly. */
  public void testTanAtZero()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanFunctional())
    {
      assertEquals("y(0) should be 0", 0.0, evalAt(eq, "0"), 1e-12);
    }
  }

  /** tan(0.5) ≈ 0.5463024898437905… (well inside the radius of convergence). */
  public void testTanAtHalf()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanFunctional())
    {
      assertEquals("y(0.5) should equal tan(0.5)", tan("0.5"), evalAt(eq, "0.5"), 1e-12);
    }
  }

  /** tan(1) ≈ 1.5574077246549022… */
  public void testTanAtOne()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanFunctional())
    {
      assertEquals("y(1) should equal tan(1)", tan("1"), evalAt(eq, "1"), 1e-12);
    }
  }

  /**
   * tan(1.5) ≈ 14.1014199471719… — just below the pole at π/2, where the
   * solution blows up. The approximant must track the steep approach to the
   * singularity.
   */
  public void testTanJustBelowSingularity()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanFunctional())
    {
      assertEquals("y(1.5) should equal tan(1.5)", tan("1.5"), evalAt(eq, "1.5"), 1e-9);
    }
  }

  /**
   * tan(2.0) ≈ −2.1850398632615190… — <em>past</em> the pole at π/2. This is the
   * key property: the Maclaurin series of tan diverges here, yet the Müntz–Padé
   * resolvent analytically continues onto the next branch and recovers the
   * correct (negative) value.
   */
  public void testTanPastSingularity()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanFunctional())
    {
      double y = evalAt(eq, "2");
      assertTrue("y(2) must be on the continued branch (negative)", y < 0);
      assertEquals("y(2) should equal tan(2) past the π/2 singularity", tan("2"), y, 1e-12);
    }
  }

  /** tan(2.5) ≈ −0.7470222972386602… and tan(3) ≈ −0.1425465430742778…, both
   * on the same continued branch past π/2. */
  public void testTanFurtherPastSingularity()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanFunctional())
    {
      assertEquals("y(2.5) should equal tan(2.5)", tan("2.5"), evalAt(eq, "2.5"), 1e-12);
      assertEquals("y(3) should equal tan(3)",     tan("3"),   evalAt(eq, "3"),   1e-12);
    }
  }

  /**
   * The approximant is a rigorous ball, not a floating-point guess: the verified
   * interval returned at t = 2.0 must actually <em>enclose</em> the true tan(2).
   * This is what distinguishes the arb/FLINT evaluation from an ordinary
   * double-precision recurrence — the radius is a certified error bound.
   */
  public void testTanPastSingularityIsVerifiedEnclosure()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanFunctional();
          Complex t        = new Complex();
          Complex result   = new Complex();
          Real    tanTwo   = new Real();
          Real    two      = new Real().set("2", BITS))
    {
      ComplexFunction approximant = eq.evaluate(ZERO_V, 1, BITS, null);
      t.set("2", BITS);
      approximant.evaluate(t, 1, BITS, result);
      two.tan(BITS, tanTwo);
      assertTrue("verified ball y(2) must enclose the exact tan(2)",
                 result.getReal().contains(tanTwo));
    }
  }

  /** Odd symmetry: tan(−t) = −tan(t). */
  public void testTanOddSymmetry()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanFunctional())
    {
      ComplexFunction approx = eq.evaluate(ZERO_V, 1, BITS, null);
      try ( Complex tPos = new Complex(); Complex tNeg = new Complex(); Complex yPos = new Complex(); Complex yNeg = new Complex())
      {
        tPos.set("0.7", BITS);
        tNeg.set("-0.7", BITS);
        approx.evaluate(tPos, 1, BITS, yPos);
        approx.evaluate(tNeg, 1, BITS, yNeg);
        assertEquals("tan is odd: y(t) = -y(-t)",
                     yPos.getReal().doubleValue(),
                     -yNeg.getReal().doubleValue(),
                     1e-12);
      }
    }
  }
}
