package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FloatIntervalTest extends
                               TestCase
{
  public static final int prec = 128;

  public static void testRealInterval()
  {
    FloatInterval interval = new FloatInterval(0,
                                               10);

    try ( RealPartition partition = new RealPartition(interval,
                                                      prec,
                                                      10,
                                                      true))
    {
      assertEquals(new Real("4.5 +/- 0.5",
                            44),
                   partition.T.get(4));
      assertEquals(new Real("9.5 +/- 0.5",
                            44),
                   partition.T.get(9));
    }

  }
}
