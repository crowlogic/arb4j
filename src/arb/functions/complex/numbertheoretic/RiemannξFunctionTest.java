package arb.functions.complex.numbertheoretic;

import arb.Complex;
import junit.framework.TestCase;

public class RiemannξFunctionTest extends
                                  TestCase
{
  public static void testZeta()
  {
    RiemannξFunction func = new RiemannξFunction();
    try ( Complex coordinate = new Complex())
    {
      Complex res = func.evaluate(coordinate.set(2, 0.1), 2, 128, new Complex());
      assertEquals(0.52346662017975487124, res.getReal().doubleValue(), Math.pow(10, -12));
      assertEquals(0.00361550088503716227, res.getImag().doubleValue(), Math.pow(10, -12));

    }
  }
}
