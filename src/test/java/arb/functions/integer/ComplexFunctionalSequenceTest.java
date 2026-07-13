package arb.functions.integer;

import arb.Complex;
import arb.expressions.Context;
import arb.functions.ComplexFunctional;
import arb.functions.complex.ComplexFunction;
import junit.framework.TestCase;

/**
 * Unit tests for {@link ComplexFunctionalSequence}: a
 * {@link Sequence}&lt;{@link ComplexFunctional}&gt; whose index is an
 * {@link arb.Integer} and whose elements are {@link ComplexFunctional}s (which
 * in turn produce {@link ComplexFunction}s).
 *
 * The arrow chain {@code n➔z➔w➔body} binds:
 * <ul>
 * <li>{@code n} - the Integer sequence index (via {@link Sequence#apply(int)})</li>
 * <li>{@code z} - the ComplexFunctional domain</li>
 * <li>{@code w} - the ComplexFunction domain</li>
 * <li>{@code body} - the Complex-valued result</li>
 * </ul>
 */
public class ComplexFunctionalSequenceTest extends
                                           TestCase
{
  private static Complex evalThree(ComplexFunctionalSequence seq, int n, double z, double w, int bits)
  {
    ComplexFunctional functional = seq.apply(n);
    try ( Complex zz = new Complex(); Complex ww = new Complex(); Complex out = new Complex())
    {
      zz.set(z, 0.0);
      ww.set(w, 0.0);
      ComplexFunction f = functional.evaluate(zz, 1, bits, null);
      return f.evaluate(ww, 1, bits, out.set(0.0, 0.0));
    }
  }

  public void testPowerSequenceMatchesFunctionalSequenceTest()
  {
    var seq = ComplexFunctionalSequence.express("f:n➔t➔q➔t^(n+q)", new Context());
    ComplexFunctional s3 = seq.apply(3);
    try ( Complex two = new Complex("2", 128))
    {
      ComplexFunction f = s3.evaluate(two, 128);
      Complex z = f.eval(1.0);
      assertEquals(16.0, z.re().doubleValue());
      assertTrue(z.im().isZero());
    }
  }

  public void testThreeVariablePower()
  {
    var seq = ComplexFunctionalSequence.express("g:n➔z➔w➔z^(n+w)", new Context());
    Complex result = evalThree(seq, 2, 3.0, 4.0, 128);
    try ( Complex r = result)
    {
      assertEquals(729.0, r.re().doubleValue());
      assertTrue(r.im().isZero());
    }
  }

  public void testNonCommutativeDivision()
  {
    var seq = ComplexFunctionalSequence.express("h:n➔z➔w➔z/w", new Context());
    Complex result = evalThree(seq, 5, 6.0, 3.0, 128);
    try ( Complex r = result)
    {
      assertEquals(2.0, r.re().doubleValue());
      assertTrue(r.im().isZero());
    }
  }

  public void testNonCommutativeDivisionReversedArguments()
  {
    var seq = ComplexFunctionalSequence.express("h:n➔z➔w➔w/z", new Context());
    Complex result = evalThree(seq, 5, 6.0, 3.0, 128);
    try ( Complex r = result)
    {
      assertEquals(0.5, r.re().doubleValue());
      assertTrue(r.im().isZero());
    }
  }

  public void testIndexAppearsInBody()
  {
    var seq = ComplexFunctionalSequence.express("p:n➔z➔w➔(z+w)/n", new Context());
    Complex result = evalThree(seq, 4, 6.0, 2.0, 128);
    try ( Complex r = result)
    {
      assertEquals(2.0, r.re().doubleValue());
      assertTrue(r.im().isZero());
    }
  }

  public void testSumOverIndexRange()
  {
    var seq = ComplexFunctionalSequence.express("s:n➔z➔w➔sum(k➔z+w{k=0..n})", new Context());
    Complex result = evalThree(seq, 2, 2.0, 3.0, 128);
    try ( Complex r = result)
    {
      assertEquals(15.0, r.re().doubleValue());
      assertTrue(r.im().isZero());
    }
  }

  public void testSumNonCommutativeBody()
  {
    var seq = ComplexFunctionalSequence.express("s:n➔z➔w➔sum(k➔z/w{k=0..n})", new Context());
    Complex result = evalThree(seq, 2, 6.0, 3.0, 128);
    try ( Complex r = result)
    {
      assertEquals(6.0, r.re().doubleValue());
      assertTrue(r.im().isZero());
    }
  }
}
