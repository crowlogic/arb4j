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

    // For small evaluation (128-bit precision), expect <10K total cache accesses
    // Exponential recomputation shows as 1M+ accesses
    if (totalAccesses > 100_000) {
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
