package arb.expressions;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import arb.Complex;
import arb.Real;
import arb.functions.IndexCache;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.RiccatiMuntzPadeFunctional;

/**
 * Regression test for the inner-curry value-backing cache on Polynomial codomains.
 *
 * <p>
 * Before the fix, {@code shouldCacheValueBacking()} required the inner curry
 * body's codomain to implement {@link arb.Field}. Polynomial-valued sequences
 * (e.g. {@code k\u2192v\u2192a\u2096(v)} with {@code a\u2096 : ComplexPolynomial}) were excluded
 * because {@link arb.ComplexPolynomial} does not implement {@link arb.Field}.
 * The inner curry body therefore re-evaluated the entire recurrence expression
 * on every call \u2014 each nested {@code a(j)(v)\u00b7a(k-1-j)(v)} inside the {@code \u03a3}
 * triggered a fresh polynomial-arithmetic recomputation.
 *
 * <p>
 * With the fix, {@code shouldCacheValueBacking()} also returns true when the
 * codomain implements {@link arb.Polynomial}. The single
 * {@code (lastV, cachedResult)} pair short-circuits repeat calls with the same
 * {@code v} by reference identity, collapsing the redundant inner work.
 *
 * <p>
 * The test exercises {@link RiccatiMuntzPadeFunctional} \u2014 whose M\u00fcntz coefficient
 * sequence is a {@link arb.functions.integer.ComplexPolynomialSequence} \u2014 and
 * asserts the {@link IndexCache} access count stays below the pre-fix baseline.
 * Pre-fix: ~30 700 total accesses. Post-fix: ~1 700 total accesses. The bound
 * here (10 000) is set well above the post-fix count and well below the pre-fix
 * count so a regression in {@code shouldCacheValueBacking} fails this test
 * deterministically.
 */
public class PolynomialInnerCurryCacheTest
{
  @Test
  public void innerCurryOnPolynomialCodomainIsValueCached()
  {
    IndexCache.HITS   = 0;
    IndexCache.MISSES = 0;

    try (RiccatiMuntzPadeFunctional tanh = new RiccatiMuntzPadeFunctional(new Real().set("1", 128), "1", "0", "-1"))
    {
      Complex         zeroV       = new Complex();
      ComplexFunction approximant = tanh.evaluate(zeroV, 1, 128, null);
      Complex         t           = new Complex();
      t.set("0.5", 128);
      Complex result = new Complex();
      approximant.evaluate(t, 1, 128, result);
      t.close();
      result.close();
      zeroV.close();
    }

    long total = IndexCache.HITS + IndexCache.MISSES;

    assertTrue("\u03c3-table was not exercised: totalAccesses=" + total
                  + " \u2014 the test measured nothing and must NOT pass as green",
               total >= 100);

    assertTrue(String.format("Polynomial inner-curry recompute regressed (#1034): hits=%d, misses=%d, total=%d. "
                  + "Pre-fix baseline ~30 700; post-fix ~1 700. Bound 10 000.",
                             IndexCache.HITS,
                             IndexCache.MISSES,
                             total),
               total < 10_000);
  }
}
