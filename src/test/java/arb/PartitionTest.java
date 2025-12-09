package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings(
{ "unused" })
public class PartitionTest extends
                           TestCase
{
  public static final int prec = 128;

  public void testPartition()

  {
    try ( FloatInterval interval = new FloatInterval(0,
                                                     10);
          FloatPartition partition = interval.partition(500, prec);)
    {
      int i = 0;
      try ( Real mesh = new Real("0.02",
                                 128);)
      {
        assertTrue(mesh.overlaps(partition.δt));
        assertTrue(mesh.contains(partition.δt));
        assertTrue(partition.δt.overlaps(mesh));
      }

      for (Float x : partition)
      {
        i++;
      }
      assertEquals(500, i);
    }

  }
}
