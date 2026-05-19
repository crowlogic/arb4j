package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Oracle test for {@link RiccatiMuntzPadeFunctional}: the classical (μ=1)
 * Riccati equation y' = 1 - y² with y(0)=0 has the exact closed-form solution
 * y(t) = tanh(t).
 *
 * <p>
 * Parameters: P = 1, Q = 0, R = -1, μ = 1.
 *
 * <p>
 * The functional is a two-level curried object:
 * <pre>
 *   functional.evaluate(v, ...) → MuntzPadeApproximant  (curried on v)
 *   approximant.evaluate(t, ...) → Complex               (value at t)
 * </pre>
 * Because P, Q, R are all constant in v, the parameter v is a dummy zero here.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class HyperbolicTangentTest extends
                                   TestCase
{
  private static final int BITS = 128;

  /** Dummy v=0 used when currying the functional (constants in v). */
  private static final Complex ZERO_V = new Complex();

  /**
   * Build the FRMP functional for y' = 1 − y², y(0) = 0  →  y(t) = tanh(t).
   */
  private static RiccatiMuntzPadeFunctional makeTanhFunctional()
  {
    Real μ = new Real();
    μ.set("1", BITS);
    return new RiccatiMuntzPadeFunctional(μ, "1", "0", "-1");
  }

  /**
   * Evaluate the functional at parameter v=0 to get the approximant, then
   * evaluate the approximant at the given real point t.
   */
  private static double evalAt(RiccatiMuntzPadeFunctional eq, String tStr)
  {
    ComplexFunction approximant = eq.evaluate(ZERO_V, 1, BITS, null);
    Complex t = new Complex();
    t.set(tStr, BITS);
    Complex result = new Complex();
    approximant.evaluate(t, 1, BITS, result);
    return result.getReal().doubleValue();
  }

  /** tanh(0) = 0  — the initial condition must be satisfied exactly. */
  public void testTanhAtZero()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanhFunctional())
    {
      assertEquals("y(0) should be 0", 0.0, evalAt(eq, "0"), 1e-12);
    }
  }

  /** tanh(0.5) ≈ 0.46211715726000975... */
  public void testTanhAtHalf()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanhFunctional())
    {
      double expected = RealNullaryFunction.express("tanh(1/2)").evaluate().doubleValue();
      assertEquals("y(0.5) should equal tanh(0.5)", expected, evalAt(eq, "0.5"), 1e-12);
    }
  }

  /** tanh(1) ≈ 0.76159415595576488... */
  public void testTanhAtOne()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanhFunctional())
    {
      double expected = RealNullaryFunction.express("tanh(1)").evaluate().doubleValue();
      assertEquals("y(1) should equal tanh(1)", expected, evalAt(eq, "1"), 1e-12);
    }
  }

  /** tanh(2) ≈ 0.96402758007581688... */
  public void testTanhAtTwo()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanhFunctional())
    {
      double expected = RealNullaryFunction.express("tanh(2)").evaluate().doubleValue();
      assertEquals("y(2) should equal tanh(2)", expected, evalAt(eq, "2"), 1e-12);
    }
  }

  /** Odd symmetry: tanh(-t) = -tanh(t). */
  public void testTanhOddSymmetry()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanhFunctional())
    {
      ComplexFunction approx = eq.evaluate(ZERO_V, 1, BITS, null);
      Complex tPos = new Complex();
      Complex tNeg = new Complex();
      tPos.set("0.7", BITS);
      tNeg.set("-0.7", BITS);
      Complex yPos = new Complex();
      Complex yNeg = new Complex();
      approx.evaluate(tPos, 1, BITS, yPos);
      approx.evaluate(tNeg, 1, BITS, yNeg);
      assertEquals("tanh is odd: y(t) = -y(-t)",
                   yPos.getReal().doubleValue(),
                   -yNeg.getReal().doubleValue(),
                   1e-12);
    }
  }
}
