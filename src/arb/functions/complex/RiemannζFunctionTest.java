package arb.functions.complex;

import arb.*;
import junit.framework.*;

public class RiemannζFunctionTest extends
                                  TestCase
{
  public static void testZeta()
  {
    RiemannζFunction func = new RiemannζFunction();
    try ( Complex coordinate = new Complex())
    {
      Complex res = func.evaluate(coordinate.set(2, 0), 2, 128, Complex.newVector(2));
      assertEquals(res.get(0).getReal().doubleValue(), 1.6449340668482264365, Math.pow(10, -12));
      assertEquals(res.get(1).getReal().doubleValue(), -0.93754825431584375370, Math.pow(10, -12));

      System.out.println("res=" + res);
    }
  }
}
