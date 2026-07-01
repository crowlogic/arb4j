package arb.functions.complex;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Tests for {@link RiccatiMuntzPadeFunctional}.
 *
 * <p>
 * Reference: Crowley, qrh.tex (March 2026), §§2–3.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class RiccatiMittagLefflerFunctionTest extends
                                              TestCase
{

  /**
   * Smoke test: construction succeeds, the Müntz coefficient sequence compiles,
   * a₁ is accessible. Constants in v: c₀=1, c₁=−1/2, c₂=3/10, μ=0.6.
   *
   * <p>
   * Closed form: a₁ = c₀ / Γ(μ+1) = 1/Γ(1.6) ≈ 1.119184587280...
   */
  public void testConstructionAndFirstMuntzCoefficient()
  {
    int  bits = 128;
    Real μ    = new Real();
    μ.set("0.6", bits);
    μ.setBounds(0, false, 1, true);

    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(μ, "1", "-1/2", "3/10"))
    {
      ComplexPolynomialSequence a = eq.muntzBasis();
      assertNotNull("Müntz coefficient sequence must be compiled", a);

      arb.Integer one = new arb.Integer();
      one.set(1);
      Complex v = new Complex();
      v.set(1, 0);
      Complex α1    = new Complex();
      ComplexFunction a1Fn = a.evaluate(one, 1, bits, null);
      a1Fn.evaluate(v, 1, bits, α1);

      double re  = α1.getReal().doubleValue();
      double im  = α1.getImag().doubleValue();
      Real   val = RealNullaryFunction.express("1/Γ(1.6)").evaluate();
      assertEquals("a₁ real part should be 1/Γ(1.6)", val.doubleValue(), re, 1e-30);
      assertEquals("a₁ imaginary part should be 0", 0.0, im, 1e-30);
    }
    finally
    {
      μ.close();
    }
  }

  /**
   * The second Müntz coefficient has the closed form, for the linear fractional
   * equation P(v)=1, Q(v)=−1, R(v)=0,
   *
   * <pre>
   *   a₂ = γ₂·q·a₁,   γ₂ = Γ(μ+1)/Γ(2μ+1),   a₁ = 1/Γ(μ+1)
   *      = −1/Γ(2μ+1).
   * </pre>
   *
   * At μ = 1/2 this is a₂ = −1/Γ(2) = −1 exactly.
   */
  public void testSecondMuntzCoefficientClosedForm()
  {
    int bits = 128;
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1/2", bits), "1", "-1", "0");
          Complex v = new Complex(); Complex a2 = new Complex())
    {
      arb.Integer two = new arb.Integer();
      two.set(2);
      v.set(1, 0);
      ComplexFunction a2Fn = eq.muntzBasis().evaluate(two, 1, bits, null);
      a2Fn.evaluate(v, 1, bits, a2);

      assertEquals("a₂ = −1/Γ(2μ+1) = −1 at μ=1/2", -1.0, a2.getReal().doubleValue(), 1e-25);
      assertEquals("a₂ imaginary part must be 0", 0.0, a2.getImag().doubleValue(), 1e-25);
      two.close();
    }
  }

  /**
   * Fractional closed-form oracle. The linear fractional Riccati (R = 0)
   *
   * <pre>
   *   Đ^μ y(t) = 1 − y(t),   y(0) = 0
   * </pre>
   *
   * has the exact Mittag-Leffler solution
   *
   * <pre>
   *   y(t) = 1 − E_μ(−t^μ).
   * </pre>
   *
   * (At μ = 1 this is the familiar 1 − e^{−t}.) For μ = 1/2 the two-parameter
   * Mittag-Leffler reduction gives y(t) = 1 − e^{t}·erfc(√t). We compare the
   * Müntz–Padé solution against the exact Mittag-Leffler reference E(1/2,·)
   * computed by the expression compiler, at t ∈ {1/2, 1, 2}, to full working
   * precision.
   */
  public void testFractionalLinearMatchesMittagLefflerClosedForm()
  {
    int bits = 192;
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1/2", bits), "1", "-1", "0");
          Complex zeroV = new Complex(); Complex t = new Complex(); Complex y = new Complex())
    {
      zeroV.zero();
      ComplexFunction approx = eq.evaluate(zeroV, 1, bits, null);

      assertMittagLeffler(approx, t, y, "1/2", RealNullaryFunction.express("1-ℰ(1/2,-(1/2)^(1/2))").evaluate(), bits);
      assertMittagLeffler(approx, t, y, "1",   RealNullaryFunction.express("1-ℰ(1/2,-1)").evaluate(),          bits);
      assertMittagLeffler(approx, t, y, "2",   RealNullaryFunction.express("1-ℰ(1/2,-(2)^(1/2))").evaluate(),  bits);
    }
  }

  private static void assertMittagLeffler(ComplexFunction approx, Complex t, Complex y, String tStr, Real reference, int bits)
  {
    t.set(tStr, bits);
    approx.evaluate(t, 1, bits, y);
    assertEquals("y(" + tStr + ") = 1 − E_{1/2}(−√t)", reference.doubleValue(), y.getReal().doubleValue(), 1e-15);
    assertEquals("Im y(" + tStr + ") must be 0", 0.0, y.getImag().doubleValue(), 1e-15);
    reference.close();
  }

  /**
   * The Müntz–Padé ball for the fractional oracle must be a rigorous enclosure:
   * the verified interval returned at t = 1 must actually contain the exact
   * Mittag-Leffler value 1 − E_{1/2}(−1).
   */
  public void testFractionalOracleIsVerifiedEnclosure()
  {
    int bits = 192;
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1/2", bits), "1", "-1", "0");
          Complex zeroV = new Complex(); Complex t = new Complex(); Complex y = new Complex();
          Real reference = RealNullaryFunction.express("1-ℰ(1/2,-1)").evaluate())
    {
      zeroV.zero();
      ComplexFunction approx = eq.evaluate(zeroV, 1, bits, null);
      t.set("1", bits);
      approx.evaluate(t, 1, bits, y);
      assertTrue("verified ball y(1) must enclose the exact 1 − E_{1/2}(−1)",
                 y.getReal().contains(reference));
    }
  }

}
