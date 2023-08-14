package arb.functions.complex;

import arb.Complex;
import arb.RealConstants;
import junit.framework.TestCase;

public class SFunctionTest extends
                           TestCase
{
  public static void testS()
  {

    try ( Complex t = new Complex(); var sFunction = new SFunction();)
    {
      Complex result = sFunction.evaluate(t.set(2, 0.2), 3, 256, Complex.newVector(3));
      // System.out.format("S(%s)=%s\n", t, result);

      assertEquals(0.8272968560866428, result.getReal().doubleValue());
      assertEquals(0.08966870829390232, result.getImag().doubleValue());
      assertEquals(0.38675539544351079481, result.get(1).getReal().doubleValue());
      assertEquals(-0.26128962310117315, result.get(1).getImag().doubleValue());
      assertEquals(-1.076121385336162441636203719876, result.get(2).getReal().doubleValue());
      assertEquals(0.8891161743087089, result.get(2).getImag().doubleValue());
      assertEquals(2.0, t.getReal().doubleValue());
      assertEquals(0.2, t.getImag().doubleValue());
      assertTrue(sFunction.scale.equals(RealConstants.one));
    }
  }

  public static void testInverseFunctions()
  {
    try ( var sFunction = new SFunction())
    {
      for (int i = 0; i < 4; i++)
      {
        HolomorphicFunction firstInverse = sFunction.inverse(0);

      }
    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }
}
