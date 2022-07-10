package arb.functions.complex;

import arb.*;
import junit.framework.*;

public class SFunctionTest extends
                           TestCase
{
  public static void testS()
  {

    try ( Complex t = new Complex(); var sFunction = new SFunction();)
    {
      Complex result = sFunction.evaluate(t.set(2, 0.2), 3, 256, Complex.newVector(3));
      System.out.format("S(%s)=%s\n", t, result);

      assertEquals(result.getReal().doubleValue(), 0.8272968560866428);
      assertEquals(result.getImag().doubleValue(), 0.08966870829390232);
      assertEquals(result.get(1).getReal().doubleValue(), 0.38675539544351079481);
      assertEquals(result.get(1).getImag().doubleValue(), -0.26128962310117315);
      assertEquals(result.get(1).getReal().doubleValue(), 0.38675539544351079481);
      assertEquals(result.get(1).getImag().doubleValue(), -0.26128962310117315);
    }
  }

  public static void testInverseFunctions()
  {
    try ( var sFunction = new SFunction())
    {
      for (int i = 0; i < 4; i++)
      {
        ComplexFunction firstInverse = sFunction.inverse(0);

      }
    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }
}
