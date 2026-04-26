package arb.equations;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexSequence;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Tests for {@link ConstantCoefficientFractionalRiccatiEquation}.
 *
 * <p>
 * Reference: Crowley, qrh.tex (March 2026), §§2–3.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ConstantCoefficientFractionalRiccatiEquationTest extends
                                                              TestCase
{

  /**
   * Smoke test: construction succeeds, the Müntz coefficient sequence compiles,
   * a₁ is accessible. Constants in v: c₀=1, c₁=−1/2, c₂=3/10, μ=0.6.
   *
   * <p>
   * Closed form: a₁ = c₀ / Γ(μ+1) = 1/Γ(1.6) ≈ 1.119184587280...
   */
  public static void testConstructionAndFirstMuntzCoefficient()
  {
    int  bits = 128;
    Real μ    = new Real();
    μ.set("0.6", bits);
    // μ ∈ (0,1) is required by the fractional Riccati problem class so the
    // Caputo derivative compiler can resolve n = ⌈μ⌉ = 1 at compile time.
    μ.setBounds(0, false, 1, true);

    try ( ConstantCoefficientFractionalRiccatiEquation eq = new ConstantCoefficientFractionalRiccatiEquation(μ,
                                                                                                             "1",
                                                                                                             "-1/2",
                                                                                                             "3/10"))
    {
      ComplexSequence a = eq.muntzCoefficients();
      assertNotNull("Müntz coefficient sequence must be compiled", a);

      // Set Context v to any value; for constant inputs a_k does not depend on v.
      eq.v.set(1, 0);

      arb.Integer one = new arb.Integer();
      one.set(1);
      Complex α1 = new Complex();
      a.evaluate(one, 1, bits, α1);

      // 1/Γ(1.6) ≈ 1.119184587280...
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
   * End-to-end test: with r ≡ 0 the Riccati equation reduces to the linear
   * fractional Cauchy problem
   *
   * <pre>
   *   Đ^μ y(t) = p + q·y(t),   y(0) = 0,   μ ∈ (0,1)
   * </pre>
   *
   * whose exact solution is
   *
   * <pre>
   *   y(t) = p · t^μ · E_{μ, μ+1}(q · t^μ)
   * </pre>
   *
   * <p>
   * Sanity-check via the Müntz recurrence the solver uses: with r=0 the
   * convolution sum S(k) is identically zero, so the recurrence telescopes:
   *
   * <pre>
   *   a_k = p · q^{k-1} / Γ(kμ + 1)
   * </pre>
   *
   * and y(t) = Σ a_k t^{kμ} = p · t^μ · Σ_{k≥1} (q t^μ)^{k-1} / Γ(kμ+1)
   *         = p · t^μ · E_{μ, μ+1}(q t^μ).
   * </p>
   *
   * <p>
   * Choice of (p, q, μ): negative q keeps |q t^μ| bounded and the series
   * oscillating, which is the regime where diagonal Padé converges fastest;
   * μ = 0.6 is the same order used in the rough-Heston probe.
   * </p>
   */
  public static void testLinearCaseAgainstMittagLefflerClosedForm()
  {
    int  bits = 256;
    Real μ    = new Real();
    μ.set("0.6", bits);
    μ.setBounds(0, false, 1, true);

    try ( ConstantCoefficientFractionalRiccatiEquation eq = new ConstantCoefficientFractionalRiccatiEquation(μ,
                                                                                                             "2",
                                                                                                             "-3",
                                                                                                             "0"))
    {
      // For r=0 the coefficients are constants in v; pick any v.
      eq.v.set(1, 0);

      // The closed form. ℰ(α,β,z) is the parser's two-parameter Mittag-Leffler.
      // We register no extra context — the literals 0.6 and 1.6 are inlined.
      ComplexFunction yReference = ComplexFunction.express("yRef", "t➔2*t^(0.6)*ℰ(0.6, 1.6, -3*t^(0.6))");

      // Solver. maxOrder=8 sits comfortably below the heap ceiling and is
      // high enough for the diagonal Padé to reconstruct the linear-case
      // Mittag-Leffler closed form to roughly working precision.
      ComplexFunction ySolver = eq.solve(8, bits);

      // Compare at four test points spanning the practical range. Tolerance
      // 1e-8 covers the diagonal Padé truncation error at maxOrder=8 for the
      // linear-case Mittag-Leffler reference. Empirical errors at this
      // maxOrder are
      //   t=0.25 (z=0.43)  ~3.2e-14
      //   t=0.50 (z=0.66)  ~5.2e-12
      //   t=1.00 (z=1.00)  ~4.3e-10
      //   t=1.75 (z=1.40)  ~8.6e-9
      // Padé convergence is fastest near the origin and degrades as |z|
      // approaches the radius of convergence of the underlying Mittag-Leffler
      // series. Pushing the gap to working precision (~1e-77 at bits=256)
      // requires maxOrder ≳ 14, which exceeds the test's heap budget.
      double[] ts        = { 0.25, 0.5, 1.0, 1.75 };
      double   tolerance = 1e-8;
      Complex  zArg      = new Complex();
      Complex  yRef      = new Complex();
      Complex  ySol      = new Complex();
      for (double t : ts)
      {
        zArg.set(t, 0);
        yReference.evaluate(zArg, 1, bits, yRef);
        ySolver.evaluate(zArg, 1, bits, ySol);

        double refRe = yRef.getReal().doubleValue();
        double refIm = yRef.getImag().doubleValue();
        double solRe = ySol.getReal().doubleValue();
        double solIm = ySol.getImag().doubleValue();

        assertEquals("y(" + t + ") real part disagrees",      refRe, solRe, tolerance);
        assertEquals("y(" + t + ") imaginary part disagrees", refIm, solIm, tolerance);
        assertEquals("reference imaginary part must be zero at real t", 0.0, refIm, 1e-30);
      }
    }
    finally
    {
      μ.close();
    }
  }

  /**
   * Quadratic-case test (r ≠ 0). At μ = 1 the Caputo fractional Riccati
   *
   * <pre>
   *   Đ^μ y(t) = p + q·y(t) + r·y(t)²,   y(0) = 0
   * </pre>
   *
   * reduces to the integer-order Riccati. With (p, q, r) = (1, 0, -1) this is
   *
   * <pre>
   *   y'(t) + y(t)² = 1,   y(0) = 0
   * </pre>
   *
   * whose exact closed-form solution is
   *
   * <pre>
   *   y(t) = tanh(t).
   * </pre>
   *
   * <p>
   * Reference: Ali, Jaradat, Alquran, "New computational method for solving
   * fractional Riccati equation", J. Math. Computer Sci. 17 (2017), 106–114,
   * Example 4.2 — D^α y + y² = 1, y(0) = 0, exact at α=1: y(t) = tanh(t).
   * </p>
   *
   * <p>
   * Why this exercises the quadratic branch: the Müntz recurrence at μ=1
   * with q=0 produces a_2 = 0, a_4 = 0, a_6 = 0, ... (S at even k vanishes
   * because every product a_j · a_{k-1-j} pairs an odd index with an even
   * index, and even-indexed a's are all zero). Odd coefficients are driven
   * entirely by r·y² — the r=0 branch would give a_3 = a_5 = a_7 = … = 0
   * and y ≡ 0, so a non-trivial match against tanh(t) at multiple t values
   * cannot be achieved without a correctly assembled r·Σ a_j a_{k-1-j}.
   * Concretely the recurrence yields
   *   a_1 = 1, a_3 = -1/3, a_5 = 2/15, a_7 = -17/315, ...
   * which are the Taylor coefficients of tanh(t).
   * </p>
   *
   * <p>
   * Padé order: maxOrder=8 reproduces tanh on [0, 1.75] to roughly 1e-9.
   * The diagonal (M,M) Padé approximant of tanh has poles on the imaginary
   * axis at ±i·π/2, ±i·3π/2, …, so along the real axis the convergence is
   * geometric and fast — much faster than the linear-Mittag-Leffler case.
   * </p>
   */
  public static void testQuadraticCaseAtIntegerOrderAgainstTanh()
  {
    int  bits = 256;
    Real μ    = new Real();
    μ.set("1", bits);
    // μ = 1 sits at the upper inclusive bound of the open-at-zero interval.
    // The Müntz recurrence and Padé reorganization are continuous in μ; at
    // μ = 1 the fractional Riccati collapses to the classical Riccati.
    μ.setBounds(0, false, 1, true);

    try ( ConstantCoefficientFractionalRiccatiEquation eq = new ConstantCoefficientFractionalRiccatiEquation(μ,
                                                                                                             "1",
                                                                                                             "0",
                                                                                                             "-1"))
    {
      // Coefficients are constants in v; pick any v.
      eq.v.set(1, 0);

      // Closed form: y(t) = tanh(t) at integer order μ=1.
      ComplexFunction yReference = ComplexFunction.express("yRef", "t➔tanh(t)");

      // Solver. maxOrder=8 reproduces tanh on [0, 1.75] to ~1e-9.
      ComplexFunction ySolver = eq.solve(8, bits);

      // Compare at four test points spanning the practical range.
      double[] ts        = { 0.25, 0.5, 1.0, 1.75 };
      double   tolerance = 1e-8;
      Complex  zArg      = new Complex();
      Complex  yRef      = new Complex();
      Complex  ySol      = new Complex();
      for (double t : ts)
      {
        zArg.set(t, 0);
        yReference.evaluate(zArg, 1, bits, yRef);
        ySolver.evaluate(zArg, 1, bits, ySol);

        double refRe = yRef.getReal().doubleValue();
        double refIm = yRef.getImag().doubleValue();
        double solRe = ySol.getReal().doubleValue();
        double solIm = ySol.getImag().doubleValue();

        assertEquals("y(" + t + ") real part disagrees with tanh(" + t + ")",      refRe, solRe, tolerance);
        assertEquals("y(" + t + ") imaginary part disagrees", refIm, solIm, tolerance);
        assertEquals("reference imaginary part must be zero at real t", 0.0, refIm, 1e-30);
      }
    }
    finally
    {
      μ.close();
    }
  }

  /**
   * Padé interpolation defining property (qrh.tex §3.1).
   *
   * <p>
   * The diagonal <code>(M, M)</code> Padé approximant
   * <code>R_M(z) = P_M(z)/Q_M(z)</code> of the Müntz reorganization
   *
   * <pre>
   *   g(z) = y(z^{1/μ}) = Σ_{k≥1} α_k z^k,   α_k = a_k(v)
   * </pre>
   *
   * is, by construction, the unique rational function of type
   * <code>(M, M)</code> with <code>Q_M(0) = 1</code> whose Taylor expansion
   * agrees with <code>g(z)</code> through order <code>z^{2M}</code>.
   * Equivalently, the polynomial residue
   *
   * <pre>
   *   E_M(z) := Q_M(z)·g_{2M}(z) - P_M(z),   g_{2M}(z) = Σ_{k=1}^{2M} α_k z^k,
   * </pre>
   *
   * vanishes at every order <code>z^0, z^1, …, z^{2M}</code>:
   *
   * <pre>
   *   [z^n] E_M(z) = 0   for n = 0, 1, …, 2M.
   * </pre>
   *
   * These <code>2M+1</code> linear constraints are exactly the full system
   * of Padé normal equations:
   * <ul>
   * <li>row <code>n = 0</code> fixes <code>P_M(0) = α_0 = 0</code>;</li>
   * <li>rows <code>n = 1, …, M</code> fix the back-substituted numerator
   * coefficients <code>p_1, …, p_M</code>;</li>
   * <li>rows <code>n = M+1, …, 2M</code> — the Hankel rows — fix the
   * denominator coefficients <code>q_1, …, q_M</code>.</li>
   * </ul>
   * (Beyond <code>z^{2M}</code> there is no constraint and the residue is
   * generically nonzero.) So this test pins the entire algebraic
   * construction implemented by
   * {@link ConstantCoefficientFractionalRiccatiEquation#padePolynomials(int,int)}
   * directly: if any one Hankel row solve, any one back-substitution, or
   * the Q_M(0) = 1 normalization were wrong, at least one of
   * <code>[z^0] E_M, …, [z^{2M}] E_M</code> would fail to vanish.
   * </p>
   *
   * <p>
   * Note. With the Müntz expansion truncated at degree <code>2M</code>
   * (i.e. using <code>g_{2M}(z) = Σ_{k=1}^{2M} α_k z^k</code> in place of
   * the full series <code>g(z)</code>), the residue
   * <code>E_M = Q_M · g_{2M} - P_M</code> is a polynomial of degree
   * <code>3M</code>. The first <code>2M+1</code> coefficients are
   * constrained to vanish by the Padé equations as above; the remaining
   * <code>M</code> coefficients (orders <code>z^{2M+1}, …, z^{3M}</code>)
   * are not constrained — they record what the Padé reorganization is
   * doing past the data window. Were the full series available, the
   * defining property is <code>Q_M · g - P_M = O(z^{2M+1})</code> with the
   * leading non-cancelled term <code>[z^{2M+1}] (Q_M · g) ≠ 0</code>
   * generically; the truncation simply moves the cutoff so the witness
   * lives at <code>z^{2M+1}</code> in the polynomial product as well
   * (the contributions from the missing series tail α_{2M+1}, α_{2M+2}, …
   * would refine the witness coefficient but cannot make it zero in a
   * non-degenerate regime).
   * </p>
   *
   * <p>
   * Non-triviality witness. The interpolation property would also be
   * trivially satisfied by setting <code>P_M = Q_M · g_{2M}</code> as a
   * polynomial of degree <code>3M</code> — that's not the diagonal Padé
   * approximant, that's just polynomial multiplication. To distinguish, we
   * additionally check that <code>E_M(z)</code> is non-trivially nonzero at
   * order <code>z^{2M+1}</code>: this is the leading non-cancelled term,
   * and its non-vanishing is the assertion that <code>P_M</code> has
   * degree at most <code>M</code> rather than degree <code>3M</code>.
   * (The <code>z^{2M+1}</code> coefficient would also be zero in the
   * degenerate case where <code>g(z)</code> already happened to be a
   * rational function of type <code>(M, M)</code>; the rough-Heston-regime
   * parameters chosen below make this degeneracy impossible — the Müntz
   * series is transcendental in <code>v</code>.)
   * </p>
   *
   * <p>
   * Parameter choice. Coefficients <code>(p, q, r) = (1+i, -1/2 + i/3, 3/10)</code>
   * with <code>v = 1</code> and <code>μ = 0.6</code>: all three are nonzero
   * with non-trivial complex values, so the Müntz recurrence exercises
   * every term — the linear part <code>q·a_{k-1}</code>, the convolution
   * <code>r·Σ a_j a_{k-1-j}</code>, and the inhomogeneity
   * <code>p / Γ(μ + 1)</code>. This is the rough-Heston regime, where the
   * Müntz coefficients are complex polynomials in <code>v</code> evaluated
   * at a complex point; the test scope is the algebra of the Padé
   * construction, which is identical at any (p, q, r), but choosing nonzero
   * complex coefficients exercises the complex Hankel solve
   * <code>acb_mat_solve</code> rather than reducing it to a real one.
   * </p>
   *
   * <p>
   * Order <code>M = 4</code>: the test consumes <code>2M = 8</code> Müntz
   * coefficients, builds an <code>M×M = 4×4</code> Hankel solve, and
   * checks <code>2M + 1 = 9</code> vanishing constraints (orders
   * <code>z^0</code> through <code>z^{2M} = z^8</code>) plus one
   * non-triviality constraint at order <code>z^{2M+1} = z^9</code>.
   * Working precision <code>bits = 256</code> is chosen so that the
   * asserted vanishing tolerance is well above the empirical Hankel-solve
   * cancellation noise floor at this <code>M</code> (observed
   * ~<code>10^{-33}</code>, corresponding to roughly <code>110</code> bits
   * of bit loss out of <code>256</code>) and far below the non-triviality
   * witness magnitude at <code>z^{2M+1}</code> (here
   * <code>|[z^9] E_M| ≈ 0.276</code>).
   * </p>
   */
  public static void testPadeInterpolationDefiningProperty()
  {
    int  bits = 256;
    Real μ    = new Real();
    μ.set("0.6", bits);
    μ.setBounds(0, false, 1, true);

    int M = 4;

    try ( ConstantCoefficientFractionalRiccatiEquation eq = new ConstantCoefficientFractionalRiccatiEquation(μ,
                                                                                                             "1 + ⅈ",
                                                                                                             "-1/2 + ⅈ/3",
                                                                                                             "3/10"))
    {
      // Coefficients are constants in v; pick v = 1 so the test is reproducible.
      eq.v.set(1, 0);

      // Stage 1 — the truncated Müntz reorganization
      //   g_{2M}(z) = Σ_{k=1}^{2M} α_k z^k,   α_k = a_k(v).
      // muntzCoefficientsAtV returns α_1..α_{2M} indexed from 0.
      Complex α = eq.muntzCoefficientsAtV(2 * M, bits);

      ComplexPolynomial g = new ComplexPolynomial();
      g.fitLength(2 * M + 1);
      g.setLength(2 * M + 1);
      g.get(0).zero(); // α_0 = 0 by initial condition y(0) = 0
      for (int k = 1; k <= 2 * M; k++)
      {
        g.get(k).set(α.get(k - 1));
      }

      // Stage 2 — the Padé polynomials at the same v.
      ComplexPolynomial[] PQ  = eq.padePolynomials(M, bits);
      ComplexPolynomial   P_M = PQ[0];
      ComplexPolynomial   Q_M = PQ[1];

      // Stage 3 — the polynomial residue
      //   E_M(z) = Q_M(z) · g_{2M}(z) - P_M(z).
      ComplexPolynomial product = new ComplexPolynomial();
      Q_M.mul(g, bits, product);
      ComplexPolynomial E = new ComplexPolynomial();
      product.sub(P_M, bits, E);

      // Stage 4 — assert the 2M + 1 interpolation conditions. Tolerance 1e-30
      // is set above the empirical Hankel-cancellation noise floor for this
      // regime (observed ~1.2e-33 at the worst row at M=4, corresponding to
      // roughly 110 bits of cancellation out of the 256-bit working
      // precision — the expected loss for the condition number of the
      // complex Hankel system) and far below the non-triviality witness
      // magnitude at z^{2M+1} (here ~0.276). The asserted property is exact
      // in infinite precision; the tolerance reflects only the Hankel
      // solve's bit loss propagated through the polynomial product.
      double tolerance = 1e-30;
      for (int n = 0; n <= 2 * M; n++)
      {
        Complex c = E.get(n);
        double  re = c.getReal().doubleValue();
        double  im = c.getImag().doubleValue();
        assertEquals("[z^" + n + "] E_M(z) real part must vanish",      0.0, re, tolerance);
        assertEquals("[z^" + n + "] E_M(z) imaginary part must vanish", 0.0, im, tolerance);
      }

      // Stage 5 — non-triviality witness at order z^{2M+1}.
      // The Padé construction makes E_M vanish through z^{2M} but not
      // z^{2M+1}; a degenerate solver that built P_M = Q_M · g_{2M} as a
      // degree-3M polynomial would also make this coefficient vanish, so
      // checking it is nonzero distinguishes the actual diagonal Padé from
      // the trivial identity-rational fit.
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
