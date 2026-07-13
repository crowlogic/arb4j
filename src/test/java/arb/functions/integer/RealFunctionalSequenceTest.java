package arb.functions.integer;

import arb.Real;
import arb.expressions.Context;
import arb.functions.RealFunctional;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Unit tests for {@link RealFunctionalSequence}: a
 * {@link Sequence}&lt;{@link RealFunctional}&gt; whose index is an
 * {@link arb.Integer} and whose elements are {@link RealFunctional}s (which in
 * turn produce {@link RealFunction}s).
 *
 * The arrow chain {@code n➔z➔w➔body} binds:
 * <ul>
 * <li>{@code n} - the Integer sequence index (via {@link Sequence#apply(int)})</li>
 * <li>{@code z} - the RealFunctional domain</li>
 * <li>{@code w} - the RealFunction domain</li>
 * <li>{@code body} - the Real-valued result</li>
 * </ul>
 */
public class RealFunctionalSequenceTest extends
                                        TestCase
{
  private static double evalThree(RealFunctionalSequence seq, int n, double z, double w, int bits)
  {
    RealFunctional functional = seq.apply(n);
    try ( Real zz = Real.valueOf(z); Real ww = Real.valueOf(w); Real out = new Real())
    {
      RealFunction f = functional.evaluate(zz, 1, bits, null);
      return f.evaluate(ww, 1, bits, out).doubleValue();
    }
  }

  public void testPowerSequenceMatchesFunctionalSequenceTest()
  {
    var seq = RealFunctionalSequence.express("f:n➔t➔q➔t^(n+q)");
    RealFunctional s3 = seq.apply(3);
    RealFunction f = s3.evaluate(Real.valueOf(2.0), 128);
    assertEquals(16.0, f.eval(1.0));
  }

  public void testThreeVariablePower()
  {
    var seq = RealFunctionalSequence.express("g:n➔z➔w➔z^(n+w)", new Context());
    assertEquals(729.0, evalThree(seq, 2, 3.0, 4.0, 128));
  }

  public void testNonCommutativeDivision()
  {
    var seq = RealFunctionalSequence.express("h:n➔z➔w➔z/w", new Context());
    assertEquals(2.0, evalThree(seq, 5, 6.0, 3.0, 128));
  }

  public void testNonCommutativeDivisionReversedArguments()
  {
    var seq = RealFunctionalSequence.express("h:n➔z➔w➔w/z", new Context());
    assertEquals(0.5, evalThree(seq, 5, 6.0, 3.0, 128));
  }

  public void testIndexAppearsInBody()
  {
    var seq = RealFunctionalSequence.express("p:n➔z➔w➔(z+w)/n", new Context());
    assertEquals(2.0, evalThree(seq, 4, 6.0, 2.0, 128));
  }

  public void testSumOverIndexRange()
  {
    var seq = RealFunctionalSequence.express("s:n➔z➔w➔sum(k➔z+w{k=0..n})", new Context());
    assertEquals(15.0, evalThree(seq, 2, 2.0, 3.0, 128));
  }

  public void testSumNonCommutativeBody()
  {
    var seq = RealFunctionalSequence.express("s:n➔z➔w➔sum(k➔z/w{k=0..n})", new Context());
    assertEquals(6.0, evalThree(seq, 2, 6.0, 3.0, 128));
  }
}
