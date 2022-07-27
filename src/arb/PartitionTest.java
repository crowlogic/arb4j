package arb;

import junit.framework.*;

public class PartitionTest extends
                           TestCase
{
  public static final int prec = 128;

  public void testPartition()
  {
    try ( FloatInterval interval = new FloatInterval(0,
                                                     10);
          Partition partition = interval.partition(500, prec);)
    {
      int i = 0;
      for (Float x : partition)
      {
        System.out.println(i + " -> " + x);
        i++;
      }
    }

  }
}
