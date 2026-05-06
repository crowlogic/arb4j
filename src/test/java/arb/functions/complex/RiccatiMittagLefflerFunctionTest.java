package arb.functions.complex;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Tests for {@link RiccatiMittagLefflerFunction}.
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

    try ( RiccatiMittagLefflerFunction eq = new RiccatiMittagLefflerFunction(μ, "1", "-1/2", "3/10"))
    {
      ComplexFunctionSequence a = eq.muntzBasis();
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
   * Order-from-bits selection. The function
   * {@link RiccatiMittagLefflerFunction#chooseOrderForPrecision(Complex, int)}
   * returns the smallest Padé order M for which the successive-difference
   * bound at the test point z falls below 2^(−bits).
   *
   * <p>
   * The asserted properties at fixed v and z, varying bits:
   *
   * <ol>
   * <li>M ≥ 2 always (the bound itself requires M ≥ 2).</li>
   * <li>M is monotonically non-decreasing in bits — a higher precision target
   * cannot be reached at a lower order.</li>
   * <li>At low precision (bits = 8) the linear-case Riccati at moderate z
   * should converge in a small order (M ≤ 10 here).</li>
   * </ol>
   * </p>
   *
   * <p>
   * Linear case (r ≡ 0) is used because the closed-form solution
   * y(t) = p · t^μ · E_{μ, μ+1}(q · t^μ) is entire, the Padé reorganization
   * has no nearby poles, and convergence is geometric. Empirically the bound
   * drops by a factor of ~10 per increment in M in this regime.
   * </p>
   */
  public void testChooseOrderForPrecisionMonotoneInBits()
  {
    int  baseBits = 64;
    Real μ        = new Real();
    μ.set("0.6", baseBits);
    μ.setBounds(0, false, 1, true);

    try ( RiccatiMittagLefflerFunction eq = new RiccatiMittagLefflerFunction(μ, "2", "-3", "0");
          Complex                      v  = new Complex();
          Complex                      z  = new Complex())
    {
      v.set(1, 0);

      // z = 0.5^0.6 ≈ 0.659753 — moderate, well inside the convergence radius
      // of the linear-case Mittag-Leffler series at q = -3.
      z.set(0.659753, 0);

      int M8  = eq.chooseOrderForPrecision(v, z, 8);
      int M16 = eq.chooseOrderForPrecision(v, z, 16);
      int M32 = eq.chooseOrderForPrecision(v, z, 32);

      assertTrue("M(8 bits) must be ≥ 2, got " + M8, M8 >= 2);
      assertTrue("M(8 bits) must be ≤ 10 in the linear regime, got " + M8, M8 <= 10);
      assertTrue("M monotone: M(16) ≥ M(8), got M(8)=" + M8 + " M(16)=" + M16, M16 >= M8);
      assertTrue("M monotone: M(32) ≥ M(16), got M(16)=" + M16 + " M(32)=" + M32, M32 >= M16);
    }
    finally
    {
      μ.close();
    }
  }


}
