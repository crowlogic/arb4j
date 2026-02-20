package arb.functions.integer;

import arb.RealConstants;
import arb.functions.RealFunctional;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class RealFunctionalSequenceTest extends
                                        TestCase
{
  public static void testRealFunctionalSequence()
  {
    var seq = RealFunctionalSequence.express("n->t->q->t^(n+q)");
    RealFunctional s3 = seq.apply(3);
    RealFunction f = s3.evaluate(RealConstants.two, 128);
    var y = f.eval(1.0);
    assertEquals( 16.0, y );
  }
}
