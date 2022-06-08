package arb.curves;

import static java.lang.Math.pow;
import static java.lang.System.out;

import arb.*;
import junit.framework.TestCase;

public class CircleTest extends
                        TestCase
{
  @SuppressWarnings("resource")
  public void testCoordinates()
  {
    Circle  circle = new Circle(Constants.ONE);
    Complex point  = circle.evaluate(new Real().pi(256).div(2, 256), 1, 128, new Complex());
    assertEquals(0, point.getReal().doubleValue(), pow(10, -17));
    assertEquals(1, point.getImag().getMid().doubleValue(RoundingMode.Near), pow(10, -17));
  }
}
