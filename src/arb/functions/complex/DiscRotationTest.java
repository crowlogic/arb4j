package arb.functions.complex;

import arb.*;
import junit.framework.*;

public class DiscRotationTest extends
                              TestCase
{
  @SuppressWarnings("resource")
  public static void testEval()
  {
    Complex basePoint = new Complex();
    basePoint.getReal().set("0.2", 128);
    basePoint.getImag().set("0.4", 128);

    Real         radius = Constants.HALF;

    DiscRotation dr     = new DiscRotation(basePoint,
                                           radius);
    try ( Complex rotatedAndScaledPoint = dr.evaluate(Math.PI / 2, new Complex()))
    {
      basePoint.printPrecision = false;
      System.out.println("basePoint=" + basePoint);
      rotatedAndScaledPoint.printPrecision = false;
      System.out.println("rotatedAndScaledPoint=" + rotatedAndScaledPoint);
      assertEquals(0.2, rotatedAndScaledPoint.getReal().doubleValue(), Math.pow(10, -17));
      assertEquals(0.9, rotatedAndScaledPoint.getImag().getMid().doubleValue(), Math.pow(10, -17));

    }
  }
}
