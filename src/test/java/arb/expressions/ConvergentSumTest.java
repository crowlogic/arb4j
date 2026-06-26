package arb.expressions;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class ConvergentSumTest extends
                               TestCase
{
  public void testOptimallyTruncatedConvergentSum()
  {
    try ( Real x = new Real(); Real result = new Real(); Real e = new Real(); Real diff = new Real())
    {
      RealFunction f = RealFunction.express("f:x➔Σk➔(x^k/k!){k=0…40~}");
      x.one();
      f.evaluate(x, 1, 128, result);
      e.one().exp(128, e);
      result.sub(e, 128, diff).abs();
      assertTrue(String.format("Σ x^k/k!{k=0…40~} at x=1 = %s, e = %s, |Δ| = %s", result, e, diff),
                 diff.compareTo(Real.valueOf("1e-18", 128)) < 0);
    }
  }

  public void testFixedBoundSumUnchanged()
  {
    try ( Real x = new Real(); Real result = new Real())
    {
      RealFunction f = RealFunction.express("g:x➔Σk➔(x^k/k!){k=0…10}");
      x.zero();
      f.evaluate(x, 1, 128, result);
      assertEquals(1.0, result.doubleValue(), 1e-15);
    }
  }
}
