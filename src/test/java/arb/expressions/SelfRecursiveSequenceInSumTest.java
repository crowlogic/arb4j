package arb.expressions;

import org.junit.Test;

import arb.Integer;
import arb.Real;
import arb.functions.integer.RealSequence;
import junit.framework.TestCase;

/**
 * Reproduces a self-recursive {@link RealSequence} whose recursive reference
 * occurs <em>inside a Σ operand</em> whose upper bound is the index variable —
 * the shape of the Blinnikov–Moessner Edgeworth coefficient recurrence
 * {@code c:n➔when(n<3,…,else,(1/n)·Σk➔k·c(n-k){k=3..n})}. The recursive call
 * {@code c(n-k)} sits in a nested sum operand sub-expression, so it must route
 * through the memoizing per-cluster peer allocation rather than
 * re-entering the same instance's guarded {@code evaluate()}.
 */
public class SelfRecursiveSequenceInSumTest extends
                                            TestCase
{
  @Test
  public void testRecursionInsideSumOperand()
  {
    try ( Context ctx = new Context())
    {
      // d(n) = 1 for n≥3, base cases d(0)=1,d(1)=0,d(2)=0; recurrence over a sum
      // whose upper bound is the index n and whose operand references d(n-k).
      RealSequence d = RealSequence.express("d", "d:n➔when(n=0,1,n<3,0,else,(1/n)*Σk➔k*d(n-k){k=3..n})", ctx);

      try ( Integer n = new Integer(); Real r = new Real(); Real one = new Real("1", 128);
            Real diff = new Real(); Real tol = new Real().one().mul2e(-100, new Real()) )
      {
        // d(3) = (1/3)·(3·d(0)) = (1/3)·3 = 1
        n.set(3);
        d.evaluate(n, 1, 128, r);
        r.sub(one, 128, diff).abs(128, diff);
        assertTrue("d(3) expected 1, got " + r, diff.compareTo(tol) < 0);
      }
    }
  }
}
