package arb.functions.integer;

import arb.Real;
import arb.functions.RealFunctional;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests chained application of a {@link RealFunctionalSequence}: f(n)(t)(q),
 * verifying that the three-level chain int → {@link RealFunctional} →
 * {@link RealFunction} → {@link Real} composes and evaluates correctly
 * end-to-end.
 */
public class ChainedFunctionalEvaluationTest extends
                                             TestCase
{
  static final int BITS = 128;

  /**
   * f: n ➔ t ➔ q ➔ t^(n+q)
   *
   * f(2)(3)(4) = 3^(2+4) = 3^6 = 729
   */
  public static void testChainedApplicationYieldsCorrectValue()
  {
    RealFunctionalSequence seq    = RealFunctionalSequence.express("n➔t➔q➔t^(n+q)");
    Real                   t      = new Real("3",
                                             BITS);
    RealFunctional         f2     = seq.apply(2);
    RealFunction           f2_3   = f2.evaluate(t, BITS);
    double                 result = f2_3.eval(4.0);
    t.close();
    assertEquals(729.0, result, 1e-10);
  }

  /**
   * Verifies that different indices produce independent chains that do not share
   * state:
   * <ul>
   * <li>f(1)(2)(3) = 2^(1+3) = 16</li>
   * <li>f(3)(2)(1) = 2^(3+1) = 16</li>
   * <li>f(2)(3)(1) = 3^(2+1) = 27</li>
   * </ul>
   */
  public static void testIndependentChainsDoNotShareState()
  {
    RealFunctionalSequence seq  = RealFunctionalSequence.express("n➔t➔q➔t^(n+q)");

    Real                   t2   = new Real("2",
                                           BITS);
    Real                   t3   = new Real("3",
                                           BITS);

    RealFunction           f1_2 = seq.apply(1).evaluate(t2, BITS);
    RealFunction           f3_2 = seq.apply(3).evaluate(t2, BITS);
    RealFunction           f2_3 = seq.apply(2).evaluate(t3, BITS);

    double                 r1   = f1_2.eval(3.0);
    double                 r2   = f3_2.eval(1.0);
    double                 r3   = f2_3.eval(1.0);

    t2.close();
    t3.close();

    assertEquals(16.0, r1, 1e-10); // 2^(1+3) = 16
    assertEquals(16.0, r2, 1e-10); // 2^(3+1) = 16
    assertEquals(27.0, r3, 1e-10); // 3^(2+1) = 27
  }
}
