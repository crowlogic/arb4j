package arb.expressions;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests the inline Aitken-Δ² (= Shanks e₁ = Wynn ε₂) codegen wired into
 * {@link arb.expressions.nodes.nary.NAryOperationNode} for {@code Σ{a..∞}}
 * with an {@code add} operation.
 *
 * <p>Predicate: ŝ_n := s_n − (s_n − s_{n-1})² / (s_n − 2·s_{n-1} + s_{n-2});
 * loop terminates when the accumulator stops changing under the operand's
 * own ball-arithmetic precision. Under linear convergence
 * {@code s_n − s = c·λⁿ (1 + o(1))} (Brezinski 1971 Théorème 2), the
 * remainder is bounded by |ŝ_n − s_n|.
 *
 * <p>See {@code docs/AitkenShanksPadeIdentification.tex} in the bonanzai
 * sibling repo.
 */
public class AitkenInfiniteSumTest extends
                                   TestCase
{

  /**
   * Σ_{k=0..∞} x^k = 1/(1-x) at x=1/2 should equal 2.
   * Geometric series, rate λ = 1/2.
   */
  public void testGeometricSeriesAtOneHalf()
  {
    try ( Real x = new Real(); Real result = new Real() )
    {
      RealFunction f = RealFunction.express("f:x➔Σk➔x^k{k=0..∞}");
      x.set("0.5", 128);
      f.evaluate(x, 1, 64, result);
      Real expected = Real.valueOf("2.0", 128);
      try ( Real diff = new Real() )
      {
        result.sub(expected, 128, diff).abs();
        assertTrue("Σ (1/2)^k = " + result + ", expected 2, |Δ| = " + diff,
                   diff.compareTo(Real.valueOf("1e-10", 128)) < 0);
      }
      expected.close();
    }
  }

  /**
   * Σ_{k=0..∞} 1/2^k = 2 — Fraction-typed operand body inside a Real-codomain
   * Σ. Verifies that the operand-value field is loaded at its declared type
   * (Fraction) and combined into the Real accumulator via
   * {@code Real.add(Fraction,int,Real)}.
   */
  public void testGeometricHalvesSum()
  {
    try ( Real result = new Real(); Real x = new Real() )
    {
      RealFunction f = RealFunction.express("g:x➔Σk➔1/2^k{k=0..∞}");
      x.zero();
      f.evaluate(x, 1, 64, result);
      Real expected = Real.valueOf("2.0", 128);
      try ( Real diff = new Real() )
      {
        result.sub(expected, 128, diff).abs();
        assertTrue("Σ 1/2^k = " + result + ", expected 2, |Δ| = " + diff,
                   diff.compareTo(Real.valueOf("1e-10", 128)) < 0);
      }
      expected.close();
    }
  }
}
