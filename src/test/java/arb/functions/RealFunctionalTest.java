package arb.functions;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class RealFunctionalTest extends
                                TestCase
{
  public static void testRealFunctional()
  {
    var            expr = Function.parse(Real.class,
                                         RealFunction.class,
                                         RealFunctional.class,
                                         "x➔t➔(x-t)^2");
    RealFunctional f    = expr.instantiate();
    RealFunction   g    = f.evaluate(Real.valueOf("5", 128), 128);
    double         y    = g.eval(3);
    assertEquals(4.0, y);
  }

}
