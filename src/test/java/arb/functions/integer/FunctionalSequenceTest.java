package arb.functions.integer;

import arb.Complex;
import arb.RealConstants;
import arb.expressions.Context;
import arb.functions.ComplexFunctional;
import arb.functions.RealFunctional;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class FunctionalSequenceTest extends
                                    TestCase
{
  public static void testRealFunctionalSequence()
  {
    var            seq = RealFunctionalSequence.express("n➔t➔q➔t^(n+q)");

    RealFunctional s3  = seq.apply(3);
    RealFunction   f   = s3.evaluate(RealConstants.two, 128);
    var            y   = f.eval(1.0);
    assertEquals(16.0, y);
  }

  public static void testComplexFunctionalSequence()
  {
    var               context = new Context();
    var               seq     = ComplexFunctionalSequence.express("f:n➔t➔q➔t^(n+q)", context);
    ComplexFunctional s3      = seq.apply(3);
    ComplexFunction   f       = s3.evaluate(new Complex("2",
                                                        128),
                                            128);
    Complex           z       = f.eval(1.0);
    var               y       = z.re().doubleValue();
    assertEquals(16.0, y);
    assertTrue(z.im().isZero());
  }

}
