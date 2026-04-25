package arb.equations;

import arb.Complex;
import arb.Real;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;
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
   * a₁(v) is accessible. Constants in v: c₀=1, c₁=−0.5, c₂=0.3, μ=0.6.
   */
  public static void testConstructionAndFirstMuntzCoefficient()
  {
    int  bits = 128;
    Real μ    = new Real();
    μ.set("0.6", bits);

    try ( ConstantCoefficientFractionalRiccatiEquation eq = new ConstantCoefficientFractionalRiccatiEquation(μ,
                                                                                                            "1",
                                                                                                            "-1/2",
                                                                                                            "3/10"))
    {
      ComplexFunctionSequence a = eq.muntzCoefficients();
      assertNotNull("Müntz coefficient sequence must be compiled", a);

      // a₁(v) = c₀(v) / Γ(μ+1) — for c₀=1 this is 1/Γ(1.6).
      arb.Integer one = new arb.Integer();
      one.set(1);
      ComplexFunction a1 = a.evaluate(one, 1, bits, null);
      assertNotNull("a₁ must evaluate", a1);

      Complex v = eq.v;
      v.set(1, 0); // any v works for constant inputs
      Complex α1 = new Complex();
      a1.evaluate(v, 1, bits, α1);

      // Γ(1.6) ≈ 0.8935153492876903... → 1/Γ(1.6) ≈ 1.119184...
      // Just sanity-check it's a finite nonzero complex with imaginary part 0.
      assertTrue("a₁(v) real part should be near 1.119", α1.getReal().doubleValue() > 1.0
                                                        && α1.getReal().doubleValue() < 1.2);
      assertEquals("a₁(v) imaginary part should be 0", 0.0, α1.getImag().doubleValue(), 1e-30);
    }
    finally
    {
      μ.close();
    }
  }
}
