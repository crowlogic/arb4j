package arb.functions.complex;

import arb.Complex;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
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
      assertEquals(0.08966870829390233, result.getImag().doubleValue());
      assertEquals(0.38675539544351079481, result.get(1).getReal().doubleValue());
      assertEquals(-0.2612896231011732, result.get(1).getImag().doubleValue());
      assertEquals(-1.0761213853361624, result.get(2).getReal().doubleValue());
      assertEquals(0.889116174308709, result.get(2).getImag().doubleValue());
      assertEquals(2.0, t.getReal().doubleValue());
      assertEquals(0.2, t.getImag().doubleValue());
      assertTrue(sFunction.scale.equals(RealConstants.one));
    }
  }
//
//  public static void testInverseFunctions()
//  {
//    try ( var sFunction = new SFunction())
//    {
//      for (int i = 0; i < 4; i++)
//      {
//        ComplexFunction firstInverse = sFunction.inverse(0);
//
//      }
//    }
//    catch (Exception e)
//    {
//      // TODO Auto-generated catch block
//      e.printStackTrace();
//    }
//  }
}
