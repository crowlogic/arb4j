package arb.viz;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class PointCacheTest extends
                            TestCase
{
  public void testCache()
  {
    try ( PointValueCache cache = new PointValueCache("test",
                                                      250,
                                                      125,
                                                      true))
    {
      Complex somePoint = cache.pointAt(0, 17, 18);
      somePoint.set(0.6, 0.9).tan(128);

      Complex samePoint = cache.pointAt(0, 17, 18);

      assertEquals(somePoint, samePoint);

    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

  }
}
