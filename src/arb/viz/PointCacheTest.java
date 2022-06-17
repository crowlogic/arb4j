package arb.viz;

import static java.lang.System.out;

import arb.Complex;
import junit.framework.TestCase;

public class PointCacheTest extends
                            TestCase
{
  public void testIt()
  {
    PointValueCache cache     = new PointValueCache("test",
                                          250,
                                          125);
    Complex    somePoint = cache.pointAt(0, 17, 18);
    out.println("somePoint before=" + somePoint);
    somePoint.set(0.6, 0.9).tan(128);
    out.println("somePoint after=" + somePoint);

    PointValueCache anotherPointerToTheSamePointCache = new PointValueCache("test",
                                                                  250,
                                                                  125);
    Complex    samePoint                         = cache.pointAt(0, 17, 18);
    out.println("somePoint after from another file=" + somePoint);
    assertEquals(somePoint, samePoint);

  }
}
