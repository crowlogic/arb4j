package arb.viz;

import static java.lang.System.out;

import arb.*;
import junit.framework.TestCase;

public class PointCacheTest extends
                               TestCase
{
  public void testIt()
  {
    PointCache cache     = new PointCache("test",
                                                250,
                                                125);
    Complex       somePoint = cache.points[17][18];
    out.println("somePoint before=" + somePoint);
    somePoint.set(0.6, 0.9).tan(128);
    out.println("somePoint after=" + somePoint);

    PointCache anotherPointerToTheSamePointCache = new PointCache("test",
                                                                   250,
                                                                   125);
    Complex       samePoint                    = cache.points[17][18];
    out.println("somePoint before=" + somePoint);
    assertEquals(somePoint, samePoint);

  }
}
