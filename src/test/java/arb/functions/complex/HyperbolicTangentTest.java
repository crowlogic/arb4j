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
 * This exercises the μ=1 (integer-order) path of the Müntz–Padé pipeline and
 * verifies that the Padé approximant converges to known values of tanh at
 * several test points.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class HyperbolicTangentTest extends
                                   TestCase
{
  private static final int BITS = 128;

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
   * tanh(0) = 0  — the initial condition must be satisfied exactly.
   */
  public void testTanhAtZero()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanhFunctional())
    {
      Complex t   = new Complex();
      t.set(0, 0);
      Complex result = new Complex();
      eq.evaluate(t, 1, BITS, result);
      assertEquals("y(0) should be 0", 0.0, result.getReal().doubleValue(), 1e-12);
      assertEquals("Im y(0) should be 0", 0.0, result.getImag().doubleValue(), 1e-12);
    }
  }

  /**
   * tanh(0.5) ≈ 0.46211715726000975850231848...
   */
  public void testTanhAtHalf()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanhFunctional())
    {
      Complex t = new Complex();
      t.set("0.5", BITS);
      Complex result  = new Complex();
      eq.evaluate(t, 1, BITS, result);
      double  expected = RealNullaryFunction.express("tanh(1/2)").evaluate().doubleValue();
      assertEquals("y(0.5) should equal tanh(0.5)", expected, result.getReal().doubleValue(), 1e-12);
      assertEquals("Im y(0.5) should be 0", 0.0, result.getImag().doubleValue(), 1e-12);
    }
  }

  /**
   * tanh(1) ≈ 0.76159415595576488811945828...
   */
  public void testTanhAtOne()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanhFunctional())
    {
      Complex t = new Complex();
      t.set("1", BITS);
      Complex result  = new Complex();
      eq.evaluate(t, 1, BITS, result);
      double  expected = RealNullaryFunction.express("tanh(1)").evaluate().doubleValue();
      assertEquals("y(1) should equal tanh(1)", expected, result.getReal().doubleValue(), 1e-12);
      assertEquals("Im y(1) should be 0", 0.0, result.getImag().doubleValue(), 1e-12);
    }
  }

  /**
   * tanh(2) ≈ 0.96402758007581688394641372...
   */
  public void testTanhAtTwo()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanhFunctional())
    {
      Complex t = new Complex();
      t.set("2", BITS);
      Complex result  = new Complex();
      eq.evaluate(t, 1, BITS, result);
      double  expected = RealNullaryFunction.express("tanh(2)").evaluate().doubleValue();
      assertEquals("y(2) should equal tanh(2)", expected, result.getReal().doubleValue(), 1e-12);
      assertEquals("Im y(2) should be 0", 0.0, result.getImag().doubleValue(), 1e-12);
    }
  }

  /**
   * Odd symmetry: tanh(-t) = -tanh(t).
   */
  public void testTanhOddSymmetry()
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanhFunctional())
    {
      Complex tPos    = new Complex();
      Complex tNeg    = new Complex();
      tPos.set("0.7", BITS);
      tNeg.set("-0.7", BITS);
      Complex yPos = new Complex();
      Complex yNeg = new Complex();
      eq.evaluate(tPos, 1, BITS, yPos);
      eq.evaluate(tNeg, 1, BITS, yNeg);
      assertEquals("tanh is odd: y(t) = -y(-t) real",
                   yPos.getReal().doubleValue(),
                   -yNeg.getReal().doubleValue(),
                   1e-12);
    }
  }
}
