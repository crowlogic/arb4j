package arb.equations;

import arb.Complex;
import arb.Real;
import arb.functions.integer.ComplexSequence;
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
   * Smoke test: construction succeeds, the Müntz coefficient sequence
   * compiles, a₁ is accessible. Constants in v: c₀=1, c₁=−1/2, c₂=3/10,
   * μ=0.6.
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
      double re = α1.getReal().doubleValue();
      double im = α1.getImag().doubleValue();
      assertEquals("a₁ real part should be 1/Γ(1.6) ≈ 1.119184587280", 1.11918458728, re, 1e-10);
      assertEquals("a₁ imaginary part should be 0", 0.0, im, 1e-30);
    }
    finally
    {
      μ.close();
    }
  }
}
