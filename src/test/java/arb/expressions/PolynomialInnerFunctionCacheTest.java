package arb.expressions;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import arb.Complex;
import arb.Real;
import arb.functions.IndexCache;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.RiccatiMuntzPadeFunctional;

public class PolynomialInnerFunctionCacheTest
{
  @Test
  public void innerFunctionOnPolynomialCodomainIsValueCached()
  {
    IndexCache.HITS   = 0;
    IndexCache.MISSES = 0;

    try ( RiccatiMuntzPadeFunctional tanh = new RiccatiMuntzPadeFunctional(new Real().set("1", 128),
                                                                           "1",
                                                                           "0",
                                                                           "-1"))
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

    assertTrue("σ-table was not exercised: totalAccesses="
               + total
               total >= 100);

    assertTrue(String.format("Polynomial inner-function recompute regressed (#1034): hits=%d, misses=%d, total=%d. "
                             + "Pre-fix baseline ~30 700; post-fix ~1 700. Bound 10 000.",
                             IndexCache.HITS,
                             IndexCache.MISSES,
                             total),
               total < 10_000);
  }
}
