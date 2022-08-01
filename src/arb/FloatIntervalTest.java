package arb;

import static arb.utensils.Utilities.println;

import junit.framework.TestCase;

public class FloatIntervalTest extends
                               TestCase
{
  public static final int prec = 128;

  public static void testRealInterval()
  {
    FloatInterval interval = new FloatInterval(0,
                                               10);
    System.out.println(interval);

    try ( RealPartition partition = new RealPartition(interval,
                                                      prec,
                                                      10))
    {
      for (Real x : partition)
      {
        x.printPrecision = true;
        println(x);
      }
      assertEquals(new Real("9.5 +/- 0.5",
                            128),
                   partition.T.get(9));
    }

  }
}
