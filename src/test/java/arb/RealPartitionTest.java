package arb;

import org.junit.*;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings(
{ "unused" })
public class RealPartitionTest extends
                               TestCase
{

  private RealPartition rp;
  private boolean       includeError;

  @Before
  public void setUp() throws Exception
  {
    FloatInterval interval = new FloatInterval(0,
                                               1);
    int           prec     = 128;
    int           n        = 5;
    includeError = true;
    rp           = new RealPartition(interval,
                                     prec,
                                     n,
                                     includeError);
  }

  @After
  public void tearDown() throws Exception
  {
    rp.close();
  }

  @Test
  public void testCount()
  {
    assertEquals(5, rp.count());
  }

  @Test
  public void testIterator()
  {
    int i = 1;
    for (Real r : rp)
    {
      assertEquals(0.1 * i, r.getMid().doubleValue(), 0.001);
      i += 2;
    }
  }

  @Test
  public void testGet()
  {
    assertEquals(0.1, rp.get(0).getMid().doubleValue(), 0.001);
    assertEquals(0.3, rp.get(1).getMid().doubleValue(), 0.001);
    assertEquals(0.5, rp.get(2).getMid().doubleValue(), 0.001);
    assertEquals(0.7, rp.get(3).getMid().doubleValue(), 0.001);
    assertEquals(0.9, rp.get(4).getMid().doubleValue(), 0.001);
  }

  @Test
  public void testIteratorMagnitude()
  {
    includeError = true;
    rp           = new RealPartition(new FloatInterval(0,
                                                       1),
                                     128,
                                     5,
                                     includeError);
    int i = 0;
    for (Real r : rp)
    {
      assertEquals(rp.halfdt.doubleValue(), r.getRad().doubleValue(), 0.0000000001);
      i++;
    }

    includeError = false;
    rp           = new RealPartition(new FloatInterval(0,
                                                       1),
                                     128,
                                     5,
                                     includeError);
    i            = 0;
    for (Real r : rp)
    {
      assertEquals(0.0, r.getRad().doubleValue(), 0.001);
      i++;
    }
  }
}
