package arb;

import junit.framework.TestCase;

/**
 * Verifies {@link Integer#numberOfPartitions(long, Integer)} against
 * OEIS A000041.
 */
public class ArithNumberOfPartitionsTest extends
                                         TestCase
{
  /** p(0..20) per OEIS A000041. */
  private static final int[] EXPECTED =
  { 1, 1, 2, 3, 5, 7, 11, 15, 22, 30, 42, 56, 77, 101, 135, 176, 231, 297, 385,
    490, 627 };

  public static void testSmallValues()
  {
    try ( Integer p = new Integer())
    {
      for (int n = 0; n < EXPECTED.length; n++)
      {
        Integer.numberOfPartitions(n, p);
        assertEquals("p(" + n + ")", EXPECTED[n], p.getSignedValue());
      }
    }
  }

  /** p(100) = 190569292 fits in a signed int. */
  public static void testOneHundred()
  {
    try ( Integer p = new Integer())
    {
      Integer.numberOfPartitions(100, p);
      assertEquals(190569292, p.getSignedValue());
    }
  }

  /**
   * p(1000) has 32 decimal digits (larger than long) — check the string form.
   */
  public static void testOneThousand()
  {
    try ( Integer p = new Integer())
    {
      Integer.numberOfPartitions(1000, p);
      assertEquals("24061467864032622473692149727991", p.toString());
    }
  }
}
