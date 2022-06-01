package arb.functions.complex;

import arb.Complex;
import junit.framework.TestCase;

public class SFunctionTest extends
                           TestCase
{
  public static void testS()
  {
    SFunction sFunction = new SFunction();
    try ( Complex t = new Complex().set(2, 0.2);)
    {
      Complex result = sFunction.evaluate(t, 3, 256, Complex.newVector(3));
      System.out.format("S(%s)=%s\n", t, result);

      assertEquals(result.getReal().doubleValue(), 0.8272968560866428);
      assertEquals(result.getImag().doubleValue(), 0.08966870829390232);
      assertEquals(result.get(1).getReal().doubleValue(), 0.38675539544351079481);
      assertEquals(result.get(1).getImag().doubleValue(), -0.26128962310117315);
      assertEquals(result.get(1).getReal().doubleValue(), 0.38675539544351079481);
      assertEquals(result.get(1).getImag().doubleValue(), -0.26128962310117315);
    }
  }
  
    

}
