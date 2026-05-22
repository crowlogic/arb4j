package arb.expressions;

import org.junit.Test;
import static org.junit.Assert.*;
import arb.functions.IndexCache;
import arb.functions.complex.RiccatiMuntzPadeFunctional;
import arb.functions.complex.ComplexFunction;
import arb.*;

/**
 * Detects exponential σ-table recomputation (#1034) via IndexCache hit/miss counts.
 *
 * The σ-table's 3-term recurrence should cache ~O(n*m) values.
 * Without proper caching, it generates millions of cache accesses = exponential recomputation.
 */
public class SigmaTableCacheEfficiencyTest
{
  @Test
  public void testCacheHitsDetectExponentialRecomputation()
  {
    // Reset counters
    IndexCache.HITS = 0;
    IndexCache.MISSES = 0;

    // HyperbolicTangent uses σ-table internally; evaluate it to trigger caching
    try (RiccatiMuntzPadeFunctional tanh = new RiccatiMuntzPadeFunctional(
          new Real().set("1", 128), "1", "0", "-1"))
    {
      Complex zeroV = new Complex();
      ComplexFunction approximant = tanh.evaluate(zeroV, 1, 128, null);

      // Evaluate at a test point
      Complex t = new Complex();
      t.set("0.5", 128);
      Complex result = new Complex();
      approximant.evaluate(t, 1, 128, result);
    }

    long totalAccesses = IndexCache.HITS + IndexCache.MISSES;
    long hitRate = totalAccesses > 0 ? (IndexCache.HITS * 100) / totalAccesses : 0;

    // Guard against a vacuous pass: if the σ-table was never exercised (build
    // broke, IndexCache unused, counters not wired), totalAccesses is 0 and the
    // upper-bound check below trivially passes — the test would go green having
    // measured nothing. A correct run does ~137 accesses, so demand well above 0.
    assertTrue("σ-table was not exercised: totalAccesses=" + totalAccesses
               + " — the test measured nothing and must NOT pass as green",
               totalAccesses >= 100);

    // For small evaluation (128-bit precision), expect <10K total cache accesses
    // (a properly-cached σ-table is ~137 lookups, flat across precision). The
    // previous 100K bound was a false negative: the 128-bit exponential count
    // (~73K accesses for ~180 distinct values) sits under 100K, so the test
    // PASSED while the σfunc no-caching defect (#1034) was still unfixed. The
    // bound is its own stated expectation — 10K.
    if (totalAccesses > 10_000) {
      fail(String.format(
        "EXPONENTIAL RECOMPUTATION DETECTED (#1034):\n" +
        "  Cache Hits:    %,d\n" +
        "  Cache Misses:  %,d\n" +
        "  Total Access:  %,d\n" +
        "  Hit Rate:      %d%%\n" +
        "Expected: <10K accesses for 128-bit evaluation\n" +
        "Exponential pattern: millions of hits for hundreds of cached values",
        IndexCache.HITS, IndexCache.MISSES, totalAccesses, hitRate
      ));
    }
  }
}
