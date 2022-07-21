package arb.functions.complex;

import static java.lang.Math.pow;

import arb.Complex;
import junit.framework.TestCase;

public class ZFunctionTest extends
                           TestCase
{

  public static void testZ()
  {
    Complex   res = Complex.newVector(2);
    ZFunction Z   = new ZFunction();
    try ( Complex z = new Complex();)
    {
      // derivative.init();
      Z.evaluate(z.set(6, 0.4), 2, 128, res);
      System.out.format("Z(%s)=%s\n", z, res);
      Complex derivative = res.get(1);
      System.out.format("Z'(%s)=%s\n", z, derivative);

      double epsilon = pow(10, -13);
      assertEquals(-0.9014750622750403, res.getReal().doubleValue(), epsilon);
      assertEquals(-0.07258030395929498, res.getImag().doubleValue(), epsilon);
      assertEquals(-0.18228733468370215, derivative.getReal().doubleValue(), epsilon);
      assertEquals(-0.011227163332281721, derivative.getImag().doubleValue(), epsilon);
//    
      res.clear();
    }
  }

}
