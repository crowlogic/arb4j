package arb.functions.complex;

import arb.Complex;
import arb.Integer;
import junit.framework.TestCase;

public class ZetaStieltjesMomentTest extends
                                    TestCase
{
  /**
   * Instantiation triggers compilation of all three expressions (Θ, h, μ).
   * This is the "see what the expression compiler throws" test.
   */
  public void testInstantiate()
  {
    ZetaStieltjesMoment moment = new ZetaStieltjesMoment();
    System.out.println("Θ = " + moment.Θ);
    System.out.println("ζ = " + moment.ζ);
    System.out.println("μ = " + moment.μ);
  }

  /**
   * Attempt to evaluate μ(1). This exercises the compiled integral.
   */
  public void testEvaluateFirstMoment() throws Exception
  {
    ZetaStieltjesMoment moment = new ZetaStieltjesMoment();
    try (Integer n = new Integer(1); Complex result = new Complex())
    {
      moment.evaluate(n, 1, 128, result);
      System.out.println("μ(1) = " + result);
    }
  }
}
