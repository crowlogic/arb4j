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

  /**
   * Padé interpolation defining property. The diagonal (M, M) Padé approximant
   * of the Müntz reorganization g(z) = y(z^{1/μ}) = Σ α_k z^k must satisfy
   *
   * <pre>
   *   E_M(z) := Q_M(z)·g_{2M}(z) - P_M(z),    [z^n] E_M = 0 for n = 0..2M
   * </pre>
   *
   * plus a non-triviality witness at z^{2M+1}. This test does not depend on
   * order selection or evaluate — it pins the algebra of padePolynomials and
   * muntzCoefficientsAtV directly.
   */
  public void testPadeInterpolationDefiningProperty()
  {
    int  bits = 256;
    Real μ    = new Real();
    μ.set("0.6", bits);
    μ.setBounds(0, false, 1, true);

    int M = 4;

    try ( RiccatiMittagLefflerFunction eq = new RiccatiMittagLefflerFunction(μ,
                                                                             "1 + ⅈ",
                                                                             "-1/2 + ⅈ/3",
                                                                             "3/10"))
    {
      Complex v = new Complex();
      v.set(1, 0);

      // Stage 1 — the truncated Müntz reorganization at v.
      Complex α = Complex.newVector(2 * M);
      eq.coefficientsAt(v, 2 * M, bits, α);

      ComplexPolynomial g = new ComplexPolynomial();
      g.fitLength(2 * M + 1);
      g.setLength(2 * M + 1);
      g.get(0).zero();
      for (int k = 1; k <= 2 * M; k++)
      {
        g.get(k).set(α.get(k - 1));
      }

      // Stage 2 — Padé polynomials at the same v.
      ComplexPolynomial   P_M = new ComplexPolynomial();
      ComplexPolynomial   Q_M = new ComplexPolynomial();
      ComplexPolynomial[] PQ  = new ComplexPolynomial[]
      { P_M, Q_M };
      eq.padePolynomials(v, M, bits, PQ);

      // Stage 3 — polynomial residue.
      ComplexPolynomial product = new ComplexPolynomial();
      Q_M.mul(g, bits, product);
      ComplexPolynomial E = new ComplexPolynomial();
      product.sub(P_M, bits, E);

      // Stage 4 — interpolation conditions.
      double tolerance = 1e-30;
      for (int n = 0; n <= 2 * M; n++)
      {
        Complex c  = E.get(n);
        double  re = c.getReal().doubleValue();
        double  im = c.getImag().doubleValue();
        assertEquals("[z^" + n + "] E_M(z) real part must vanish",      0.0, re, tolerance);
        assertEquals("[z^" + n + "] E_M(z) imaginary part must vanish", 0.0, im, tolerance);
      }

      // Stage 5 — non-triviality witness.
      Complex cWitness = E.get(2 * M + 1);
      Real    mod      = new Real();
      cWitness.abs(bits, mod);
      double witnessSize = mod.doubleValue();
      assertTrue("[z^" + (2 * M + 1) + "] E_M(z) must be nonzero (non-triviality witness), got |c| = "
                 + witnessSize,
                 witnessSize > 1e-3);
    }
    finally
    {
      μ.close();
    }
  }

}
