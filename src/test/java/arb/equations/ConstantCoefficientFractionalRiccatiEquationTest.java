package arb.equations;

import arb.Complex;
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
}
