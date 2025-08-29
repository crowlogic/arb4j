package arb.functions.complex.numbertheoretic;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.RealToComplexFunction;
import arb.functions.complex.RiemannζFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RiemannζFunctionTest extends
                                  TestCase
{
  public static void testZetaDerivative()
  {
    arb.expressions.Expression.saveClasses = true;
    var f = RealToComplexFunction.express("diff(ζ(½+I*t),t)");
    var y = f.eval(2.3, new Complex());
    assertEquals(4.7, y.re().doubleValue());
  }

  public static void testZeta()
  {

    try ( RiemannζFunction func = new RiemannζFunction(); Complex coordinate = new Complex())
    {
      Complex res = func.evaluate(coordinate.set(2, 0), 2, 128, Complex.newVector(2));
      assertEquals(res.get(0).re().doubleValue(), 1.6449340668482264365, Math.pow(10, -12));
      assertEquals(res.get(1).re().doubleValue(), -0.93754825431584375370, Math.pow(10, -12));

    }
  }
}
