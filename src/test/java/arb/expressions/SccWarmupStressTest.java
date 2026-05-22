package arb.expressions;

import static org.junit.Assert.assertTrue;

import java.util.Set;

import org.junit.Test;

import arb.Integer;
import arb.Real;
import arb.functions.IndexCache;
import arb.functions.integer.RealSequence;

/**
 * Stress suite for the generic {@link Context#warmToBottomUp} path introduced
 * for #1034. Each test:
 * <ol>
 * <li>Constructs a mutually-recursive integer-domain sequence cluster of a
 *     distinct topology (deep self-recursion, 2-cycle, 3-cycle, 4-cycle,
 *     mixed-arity, nested-via-cycle).</li>
 * <li>Asserts {@link Context#sccOf} identifies the cluster correctly via the
 *     Tarjan partition.</li>
 * <li>Drives the cluster's terminal member at increasing index to exercise the
 *     warm-up path.</li>
 * <li>Captures {@link IndexCache#HITS} / {@link IndexCache#MISSES} and wall-clock
 *     latency; asserts traffic stays polynomial (no exponential blow-up).</li>
 * </ol>
 */
public class SccWarmupStressTest
{
  /** Reset cache counters. */
  private static void resetCounters()
  {
    IndexCache.HITS   = 0;
    IndexCache.MISSES = 0;
  }

  private static long evalAt(RealSequence seq, int idx, int bits)
  {
    long t0 = System.nanoTime();
    try ( Integer k = new Integer(); Real r = new Real())
    {
      k.set(idx);
      seq.evaluate(k, 1, bits, r);
    }
    return System.nanoTime() - t0;
  }

  /** Trivial acyclic baseline: warmToBottomUp must no-op (cluster size 1, no self-edge). */
  @Test
  public void acyclicBaselineNoOp()
  {
    try ( Context ctx = new Context())
    {
      RealSequence f = RealSequence.express("f", "f:n\u2794n+1", ctx);
      assertTrue(ctx.sccOf("f").size() == 1);
      assertTrue("acyclic f must not be flagged as in-cycle", !ctx.isInCycle("f"));
      resetCounters();
      long ns = evalAt(f, 50, 128);
      // Acyclic — warmToBottomUp returns immediately; only the user's own evaluate runs.
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("acyclic f at n=50 should be cheap: " + ns / 1_000_000.0 + "ms", ns < 200_000_000L);
      System.out.printf("[ACYCLIC]   f(50) elapsed=%6.2fms hits=%d misses=%d total=%d%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total);
    }
  }

  /** Self-recursive 1-cycle: f(n) = f(n-1) + 1, f(0) = 0. */
  @Test
  public void selfRecursiveOneCycle()
  {
    try ( Context ctx = new Context())
    {
      RealSequence f = RealSequence.express("f", "f:n\u2794when(n=0,0,else,f(n-1)+1)", ctx);
      Set<String>  scc = ctx.sccOf("f");
      assertTrue("self-recursive f must be flagged as in-cycle", ctx.isInCycle("f"));
      resetCounters();
      long ns    = evalAt(f, 50, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("self-recursive f(50) should be polynomial: " + total + " lookups", total < 10_000);
      System.out.printf("[1-CYCLE]   f(50) elapsed=%6.2fms hits=%d misses=%d total=%d scc=%s%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total, scc);
    }
  }

  /** 2-cycle: f \u2194 g. f(n) = g(n-1) + 1, g(n) = f(n-1) + 2. */
  @Test
  public void mutualTwoCycle()
  {
    try ( Context ctx = new Context())
    {
      ctx.declare("f", Integer.class, Real.class, RealSequence.class);
      ctx.declare("g", Integer.class, Real.class, RealSequence.class);
      RealSequence.express("g", "g:n\u2794when(n=0,0,else,f(n-1)+2)", ctx);
      RealSequence f = RealSequence.express("f", "f:n\u2794when(n=0,0,else,g(n-1)+1)", ctx);

      Set<String> scc = ctx.sccOf("f");
      assertTrue("f and g must be in same SCC: " + scc, scc.contains("f") && scc.contains("g"));
      assertTrue("SCC size must be 2: " + scc, scc.size() == 2);

      resetCounters();
      long ns    = evalAt(f, 40, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("2-cycle f(40) polynomial: " + total, total < 10_000);
      System.out.printf("[2-CYCLE]   f(40) elapsed=%6.2fms hits=%d misses=%d total=%d scc=%s%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total, scc);
    }
  }

  /** 3-cycle: a \u2192 b \u2192 c \u2192 a. */
  @Test
  public void mutualThreeCycle()
  {
    try ( Context ctx = new Context())
    {
      ctx.declare("a", Integer.class, Real.class, RealSequence.class);
      ctx.declare("b", Integer.class, Real.class, RealSequence.class);
      ctx.declare("c", Integer.class, Real.class, RealSequence.class);
      RealSequence.express("b", "b:n\u2794when(n=0,1,else,c(n-1)+1)", ctx);
      RealSequence.express("c", "c:n\u2794when(n=0,2,else,a(n-1)+1)", ctx);
      RealSequence a = RealSequence.express("a", "a:n\u2794when(n=0,0,else,b(n-1)+1)", ctx);

      Set<String> scc = ctx.sccOf("a");
      assertTrue("3-cycle SCC: " + scc, scc.size() == 3);
      assertTrue(scc.contains("a") && scc.contains("b") && scc.contains("c"));

      resetCounters();
      long ns    = evalAt(a, 30, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("3-cycle a(30) polynomial: " + total, total < 10_000);
      System.out.printf("[3-CYCLE]   a(30) elapsed=%6.2fms hits=%d misses=%d total=%d scc=%s%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total, scc);
    }
  }

  /** 4-cycle: w \u2192 x \u2192 y \u2192 z \u2192 w. */
  @Test
  public void mutualFourCycle()
  {
    try ( Context ctx = new Context())
    {
      ctx.declare("w", Integer.class, Real.class, RealSequence.class);
      ctx.declare("x", Integer.class, Real.class, RealSequence.class);
      ctx.declare("y", Integer.class, Real.class, RealSequence.class);
      ctx.declare("z", Integer.class, Real.class, RealSequence.class);
      RealSequence.express("x", "x:n\u2794when(n=0,1,else,y(n-1)+1)", ctx);
      RealSequence.express("y", "y:n\u2794when(n=0,2,else,z(n-1)+1)", ctx);
      RealSequence.express("z", "z:n\u2794when(n=0,3,else,w(n-1)+1)", ctx);
      RealSequence w = RealSequence.express("w", "w:n\u2794when(n=0,0,else,x(n-1)+1)", ctx);

      Set<String> scc = ctx.sccOf("w");
      assertTrue("4-cycle SCC size: " + scc, scc.size() == 4);

      resetCounters();
      long ns    = evalAt(w, 25, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("4-cycle w(25) polynomial: " + total, total < 10_000);
      System.out.printf("[4-CYCLE]   w(25) elapsed=%6.2fms hits=%d misses=%d total=%d scc=%s%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total, scc);
    }
  }

  /** Deep nested cycle: f references itself with 3-term recurrence (fibonacci-like). */
  @Test
  public void deepThreeTermRecurrence()
  {
    try ( Context ctx = new Context())
    {
      RealSequence f = RealSequence.express("f", "f:n\u2794when(n=0,1,n=1,1,else,f(n-1)+f(n-2))", ctx);
      assertTrue("3-term self-recursive in-cycle", ctx.isInCycle("f"));
      resetCounters();
      long ns    = evalAt(f, 80, 256);
      long total = IndexCache.HITS + IndexCache.MISSES;
      // Without memoization this is \u03c6^80 \u2248 2.4e16 calls; with memoization < 1000 cache ops.
      assertTrue("fibonacci-shaped f(80) must be polynomial, got " + total, total < 50_000);
      System.out.printf("[3-TERM]    f(80) elapsed=%6.2fms hits=%d misses=%d total=%d%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total);
    }
  }

  /** Asymmetric 2-cycle with self-edges on both members. */
  @Test
  public void selfEdgesPlusMutual()
  {
    try ( Context ctx = new Context())
    {
      ctx.declare("p", Integer.class, Real.class, RealSequence.class);
      ctx.declare("q", Integer.class, Real.class, RealSequence.class);
      RealSequence.express("q", "q:n\u2794when(n=0,1,else,q(n-1)+p(n-1))", ctx);
      RealSequence p = RealSequence.express("p", "p:n\u2794when(n=0,1,else,p(n-1)+q(n-1))", ctx);
      Set<String>  scc = ctx.sccOf("p");
      assertTrue("p,q in same SCC: " + scc, scc.size() == 2);
      resetCounters();
      long ns    = evalAt(p, 40, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("p(40) polynomial: " + total, total < 20_000);
      System.out.printf("[SELF+MUT]  p(40) elapsed=%6.2fms hits=%d misses=%d total=%d%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total);
    }
  }

  /** Two independent SCCs in the same Context \u2014 partition must separate them. */
  @Test
  public void twoIndependentSccsInSameContext()
  {
    try ( Context ctx = new Context())
    {
      ctx.declare("a", Integer.class, Real.class, RealSequence.class);
      ctx.declare("b", Integer.class, Real.class, RealSequence.class);
      ctx.declare("c", Integer.class, Real.class, RealSequence.class);
      ctx.declare("d", Integer.class, Real.class, RealSequence.class);
      RealSequence.express("b", "b:n\u2794when(n=0,1,else,a(n-1)+1)", ctx);
      RealSequence.express("a", "a:n\u2794when(n=0,0,else,b(n-1)+1)", ctx);
      RealSequence.express("d", "d:n\u2794when(n=0,1,else,c(n-1)+1)", ctx);
      RealSequence c = RealSequence.express("c", "c:n\u2794when(n=0,0,else,d(n-1)+1)", ctx);
      Set<String>  sccAB = ctx.sccOf("a");
      Set<String>  sccCD = ctx.sccOf("c");
      assertTrue("{a,b} SCC: " + sccAB, sccAB.size() == 2 && sccAB.contains("a") && sccAB.contains("b"));
      assertTrue("{c,d} SCC: " + sccCD, sccCD.size() == 2 && sccCD.contains("c") && sccCD.contains("d"));
      assertTrue("SCCs must be disjoint", java.util.Collections.disjoint(sccAB, sccCD));
      resetCounters();
      long ns    = evalAt(c, 30, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      System.out.printf("[2-SCCS]    c(30) elapsed=%6.2fms hits=%d misses=%d total=%d sccAB=%s sccCD=%s%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total, sccAB, sccCD);
    }
  }
}
