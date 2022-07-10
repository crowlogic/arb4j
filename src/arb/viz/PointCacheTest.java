package arb.viz;

import static java.lang.System.*;

import arb.*;
import junit.framework.*;

public class PointCacheTest extends
                            TestCase
{
  public void testIt()
  {
    try ( PointValueCache cache = new PointValueCache("test",
                                                      250,
                                                      125))
    {
      Complex somePoint = cache.pointAt(0, 17, 18);
      out.println("somePoint before=" + somePoint);
      somePoint.set(0.6, 0.9).tan(128);
      out.println("somePoint after=" + somePoint);

  
      Complex samePoint = cache.pointAt(0, 17, 18);
      out.println("somePoint after from another file=" + somePoint);
      assertEquals(somePoint, samePoint);
    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

  }
}
