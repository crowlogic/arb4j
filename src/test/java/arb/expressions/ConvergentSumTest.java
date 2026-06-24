package arb.expressions;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Verifies that the inline Aitken-Δ² convergence acceleration built into
 * {@link arb.expressions.nodes.nary.NAryOperationNode} correctly evaluates the
 * exponential series
 *
 * <pre>
 *   Σ_{k=0..∞} x^k / k!  =  e^x
 * </pre>
 *
 * The upper limit {@code ∞} triggers the Aitken path: the loop runs until the
 * accelerated partial-sum estimate ŝ_n stabilises to within the requested
 * precision, so no fixed truncation cap or {@code ~} suffix is needed or used.
 */
public class ConvergentSumTest extends
                               TestCase
{

  /**
   * Σ_{k=0..∞} 1^k / k! = e at x = 1.
   * Converges absolutely; Aitken acceleration should stabilise within ~20 terms.
   */
  public void testExponentialSeriesAtOne()
  {
    try ( Real x = new Real(); Real result = new Real() )
    {
      RealFunction f = RealFunction.express("exp:x➔Σk➔x^k/k!{k=0..∞}");
      x.one();
      f.evaluate(x, 1, 128, result);
      try ( Real e = new Real(); Real diff = new Real() )
      {
        e.one().exp(128, e);
        result.sub(e, 128, diff).abs();
        assertTrue("Σ 1^k/k! = " + result + ", expected e = " + e + ", |Δ| = " + diff,
                   diff.compareTo(Real.valueOf("1e-15", 128)) < 0);
      }
    }
  }

  /**
   * Σ_{k=0..∞} 0^k / k! = 1 at x = 0 (only the k=0 term is non-zero).
   */
  public void testExponentialSeriesAtZero()
  {
    try ( Real x = new Real(); Real result = new Real() )
    {
      RealFunction f = RealFunction.express("expZ:x➔Σk➔x^k/k!{k=0..∞}");
      x.zero();
      f.evaluate(x, 1, 128, result);
      try ( Real diff = new Real() )
      {
        result.sub(Real.valueOf("1.0", 128), 128, diff).abs();
        assertTrue("Σ 0^k/k! = " + result + ", expected 1, |Δ| = " + diff,
                   diff.compareTo(Real.valueOf("1e-15", 128)) < 0);
      }
    }
  }

  /**
   * Σ_{k=0..∞} 2^k / k! = e² at x = 2.
   */
  public void testExponentialSeriesAtTwo()
  {
    try ( Real x = new Real(); Real result = new Real() )
    {
      RealFunction f = RealFunction.express("expT:x➔Σk➔x^k/k!{k=0..∞}");
      x.set("2", 128);
      f.evaluate(x, 1, 128, result);
      try ( Real e2 = new Real(); Real diff = new Real() )
      {
        e2.set("2", 128).exp(128, e2);
        result.sub(e2, 128, diff).abs();
        assertTrue("Σ 2^k/k! = " + result + ", expected e² = " + e2 + ", |Δ| = " + diff,
                   diff.compareTo(Real.valueOf("1e-15", 128)) < 0);
      }
    }
  }
}
