package arb.expressions;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import arb.Integer;
import arb.Real;
import arb.functions.IndexCache;
import arb.functions.integer.RealSequence;

public class RecurrentSequenceStressTest
{
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

  @Test
  public void directFormula()
  {
    try ( Context ctx = new Context())
    {
      RealSequence f = RealSequence.express("f", "f:n\u2794n+1", ctx);
      resetCounters();
      long ns    = evalAt(f, 50, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("direct f(50): " + ns / 1_000_000.0 + "ms", ns < 200_000_000L);
      System.out.printf("[DIRECT]    f(50) elapsed=%6.2fms hits=%d misses=%d total=%d%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total);
    }
  }

  @Test
  public void selfRecursive()
  {
    try ( Context ctx = new Context())
    {
      RealSequence f = RealSequence.express("f", "f:n\u2794when(n=0,0,else,f(n-1)+1)", ctx);
      resetCounters();
      long ns    = evalAt(f, 50, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("f(50) memoized: " + total + " lookups", total < 10_000);
      System.out.printf("[SELF]      f(50) elapsed=%6.2fms hits=%d misses=%d total=%d%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total);
    }
  }

  @Test
  public void mutualPair()
  {
    try ( Context ctx = new Context())
    {
      ctx.declare("f", Integer.class, Real.class, RealSequence.class);
      ctx.declare("g", Integer.class, Real.class, RealSequence.class);
      RealSequence.express("g", "g:n\u2794when(n=0,0,else,f(n-1)+2)", ctx);
      RealSequence f = RealSequence.express("f", "f:n\u2794when(n=0,0,else,g(n-1)+1)", ctx);

      resetCounters();
      long ns    = evalAt(f, 40, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("f(40) memoized: " + total, total < 10_000);
      System.out.printf("[PAIR]      f(40) elapsed=%6.2fms hits=%d misses=%d total=%d%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total);
    }
  }

  @Test
  public void mutualTriple()
  {
    try ( Context ctx = new Context())
    {
      ctx.declare("a", Integer.class, Real.class, RealSequence.class);
      ctx.declare("b", Integer.class, Real.class, RealSequence.class);
      ctx.declare("c", Integer.class, Real.class, RealSequence.class);
      RealSequence.express("b", "b:n\u2794when(n=0,1,else,c(n-1)+1)", ctx);
      RealSequence.express("c", "c:n\u2794when(n=0,2,else,a(n-1)+1)", ctx);
      RealSequence a = RealSequence.express("a", "a:n\u2794when(n=0,0,else,b(n-1)+1)", ctx);

      resetCounters();
      long ns    = evalAt(a, 30, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("a(30) memoized: " + total, total < 10_000);
      System.out.printf("[TRIPLE]    a(30) elapsed=%6.2fms hits=%d misses=%d total=%d%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total);
    }
  }

  @Test
  public void mutualQuadruple()
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

      resetCounters();
      long ns    = evalAt(w, 25, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("w(25) memoized: " + total, total < 10_000);
      System.out.printf("[QUAD]      w(25) elapsed=%6.2fms hits=%d misses=%d total=%d%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total);
    }
  }

  @Test
  public void threeTermRecurrence()
  {
    try ( Context ctx = new Context())
    {
      RealSequence f = RealSequence.express("f", "f:n\u2794when(n=0,1,n=1,1,else,f(n-1)+f(n-2))", ctx);
      resetCounters();
      long ns    = evalAt(f, 80, 256);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("f(80) memoized: " + total, total < 50_000);
      System.out.printf("[3-TERM]    f(80) elapsed=%6.2fms hits=%d misses=%d total=%d%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total);
    }
  }

  @Test
  public void selfReferentialPlusMutual()
  {
    try ( Context ctx = new Context())
    {
      ctx.declare("p", Integer.class, Real.class, RealSequence.class);
      ctx.declare("q", Integer.class, Real.class, RealSequence.class);
      RealSequence.express("q", "q:n\u2794when(n=0,1,else,q(n-1)+p(n-1))", ctx);
      RealSequence p = RealSequence.express("p", "p:n\u2794when(n=0,1,else,p(n-1)+q(n-1))", ctx);
      resetCounters();
      long ns    = evalAt(p, 40, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("p(40) memoized: " + total, total < 20_000);
      System.out.printf("[SELF+MUT]  p(40) elapsed=%6.2fms hits=%d misses=%d total=%d%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total);
    }
  }

  @Test
  public void twoIndependentPairsInSameContext()
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
      resetCounters();
      long ns    = evalAt(c, 30, 128);
      long total = IndexCache.HITS + IndexCache.MISSES;
      assertTrue("c(30) memoized: " + total, total < 10_000);
      System.out.printf("[2-PAIRS]   c(30) elapsed=%6.2fms hits=%d misses=%d total=%d%n", ns / 1e6, IndexCache.HITS, IndexCache.MISSES, total);
    }
  }
}
