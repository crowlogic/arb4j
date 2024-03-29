package arb.geometry.curves;

import static java.lang.Math.pow;

import arb.*;
import junit.framework.TestCase;

public class CircleTest extends
                        TestCase
{
  @SuppressWarnings("resource")
  public void testCoordinates()
  {
    Circle circle = new Circle(ComplexConstants.ZERO,
                               RealConstants.one);
    Real   halfpi = new Real();
    halfpi.π(256).div(2, 256);
    Complex point = circle.evaluate(halfpi, 1, 128, new Complex());
    assertEquals(0, point.getReal().doubleValue(), pow(10, -17));
    assertEquals(1, point.getImag().getMid().doubleValue(RoundingMode.Near), pow(10, -17));
  }

  @SuppressWarnings("resource")
  public static void testEval()
  {
    Complex basePoint = new Complex();
    basePoint.getReal().set("0.2", 128);
    basePoint.getImag().set("0.4", 128);

    Real   radius     = RealConstants.half;

    Circle dr         = new Circle(basePoint,
                                   radius);
    Circle unitCircle = new Circle();
    Real   perimeter  = unitCircle.getArcLength(new Real().π(128), 128, new Real());
    assertEquals(Math.PI, perimeter.getMid().doubleValue(), pow(10, -17));
    try ( Complex rotatedAndScaledPoint = dr.evaluate(Math.PI / 2, new Complex()))
    {
      basePoint.printPrecision = false;
      rotatedAndScaledPoint.printPrecision = false;
      assertEquals(0.2, rotatedAndScaledPoint.getReal().doubleValue(RoundingMode.Down), Math.pow(10, -17));
      assertEquals(0.9, rotatedAndScaledPoint.getImag().getMid().doubleValue(RoundingMode.Near), Math.pow(10, -17));

    }
  }

  @SuppressWarnings("resource")
  public static void testComplexEval()
  {
    Complex basePoint = new Complex();
    basePoint.getReal().set("0.2", 128);
    basePoint.getImag().set("0.4", 128);

    Real          radius = RealConstants.half;

    ComplexCircle dr     = new ComplexCircle(basePoint,
                                             radius);
    try ( Complex rotatedAndScaledPoint = dr.evaluate(Math.PI / 2, new Complex()))
    {
      basePoint.printPrecision = false;
      rotatedAndScaledPoint.printPrecision = false;
      assertEquals(0.2, rotatedAndScaledPoint.getReal().doubleValue(RoundingMode.Down), Math.pow(10, -17));
      assertEquals(0.9, rotatedAndScaledPoint.getImag().getMid().doubleValue(RoundingMode.Near), Math.pow(10, -17));

    }
  }
}
