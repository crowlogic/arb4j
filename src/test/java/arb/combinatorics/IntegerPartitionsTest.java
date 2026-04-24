package arb.combinatorics;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import arb.Integer;
import junit.framework.TestCase;

/**
 * Tests for {@link IntegerPartitions} and {@link IntegerPartition}.
 */
public class IntegerPartitionsTest extends
                                   TestCase
{
  /** p(0..20) per OEIS A000041. */
  private static final int[] P_N = { 1, 1, 2, 3, 5, 7, 11, 15, 22, 30, 42, 56,
                                     77, 101, 135, 176, 231, 297, 385, 490,
                                     627 };

  public static void testPartitionOfZero()
  {
    Iterator<IntegerPartition> it = IntegerPartitions.of(0);
    assertTrue(it.hasNext());
    IntegerPartition p = it.next();
    assertEquals(0, p.n());
    assertEquals(0, p.length());
    assertFalse(it.hasNext());
  }

  public static void testSmallEnumeration()
  {
    // p(4) = 5: (4), (3+1), (2+2), (2+1+1), (1+1+1+1) in descending-lex order
    List<IntegerPartition> four = collect(IntegerPartitions.of(4));
    assertEquals(5, four.size());
    assertEquals("(4)", four.get(0).toString());
    assertEquals("(3+1)", four.get(1).toString());
    assertEquals("(2+2)", four.get(2).toString());
    assertEquals("(2+1+1)", four.get(3).toString());
    assertEquals("(1+1+1+1)", four.get(4).toString());
  }

  public static void testEnumerationCountMatchesPN()
  {
    for (int n = 0; n <= 20; n++)
    {
      int count = 0;
      int sum   = 0;
      Iterator<IntegerPartition> it = IntegerPartitions.of(n);
      while (it.hasNext())
      {
        IntegerPartition p = it.next();
        assertEquals("partition sums to n for n=" + n, n, p.n());
        count++;
        sum++;
      }
      assertEquals("p(" + n + ")", P_N[n], count);
      assertEquals(P_N[n], sum);
    }
  }

  public static void testEnumerationCountMatchesFlintCount()
  {
    try ( Integer flintCount = new Integer())
    {
      for (int n = 0; n <= 15; n++)
      {
        int enumerated = 0;
        Iterator<IntegerPartition> it = IntegerPartitions.of(n);
        while (it.hasNext())
        {
          it.next();
          enumerated++;
        }
        IntegerPartitions.count(n, flintCount);
        assertEquals("enumeration vs FLINT p(" + n + ")",
                     flintCount.getSignedValue(),
                     enumerated);
      }
    }
  }

  public static void testDescendingLexOrder()
  {
    // For every n in 1..15, each successive partition must be strictly
    // smaller than its predecessor under descending-lex order.
    for (int n = 1; n <= 15; n++)
    {
      IntegerPartition prev = null;
      Iterator<IntegerPartition> it = IntegerPartitions.of(n);
      while (it.hasNext())
      {
        IntegerPartition p = it.next();
        if (prev != null)
        {
          assertTrue("descending-lex violated at n=" + n + ": " + prev
                     + " !> " + p, descLexCompare(prev, p) > 0);
        }
        prev = p;
      }
    }
  }

  public static void testBoundedLengthCount()
  {
    // Partitions of 6 with at most 3 parts: (6), (5+1), (4+2), (4+1+1),
    // (3+3), (3+2+1), (2+2+2) = 7
    List<IntegerPartition> got = collect(IntegerPartitions.of(6, 3));
    assertEquals(7, got.size());
    for (IntegerPartition p : got)
    {
      assertEquals(6, p.n());
      assertTrue(p.length() <= 3);
    }
    // Spot-check first and last in descending-lex.
    assertEquals("(6)", got.get(0).toString());
    assertEquals("(2+2+2)", got.get(6).toString());
  }

  public static void testBoundedLengthExcludesLongerPartitions()
  {
    // Partitions of 5 with at most 2 parts: (5), (4+1), (3+2) — 3 total.
    List<IntegerPartition> got = collect(IntegerPartitions.of(5, 2));
    assertEquals(3, got.size());
    for (IntegerPartition p : got)
    {
      assertTrue(p.length() <= 2);
    }
  }

  public static void testBoundedLengthZero()
  {
    // maxLength=0: only the empty partition when n=0, nothing for n>0.
    assertTrue(IntegerPartitions.of(0, 0).hasNext());
    assertFalse(IntegerPartitions.of(5, 0).hasNext());
  }

  public static void testConjugate()
  {
    // Conjugate of (4,2,1) is (3,2,1,1): column counts of
    //   ####
    //   ##
    //   #
    IntegerPartition p = new IntegerPartition(new int[]
    { 4, 2, 1 });
    IntegerPartition c = p.conjugate();
    assertEquals("(3+2+1+1)", c.toString());
    // Double conjugate is identity.
    assertEquals(p, c.conjugate());
  }

  public static void testMultiplicities()
  {
    IntegerPartition p = new IntegerPartition(new int[]
    { 4, 2, 2, 1 });
    int[] m = p.multiplicities();
    // m[0] = # of 1s, m[1] = # of 2s, m[3] = # of 4s
    assertEquals(9, m.length); // length = n = 9
    assertEquals(1, m[0]);
    assertEquals(2, m[1]);
    assertEquals(0, m[2]);
    assertEquals(1, m[3]);
  }

  public static void testInvalidConstruction()
  {
    try
    {
      new IntegerPartition(new int[]
      { 3, 4 }); // not descending
      fail("expected IllegalArgumentException");
    }
    catch (IllegalArgumentException ok)
    {}
    try
    {
      new IntegerPartition(new int[]
      { 3, 0 }); // non-positive
      fail("expected IllegalArgumentException");
    }
    catch (IllegalArgumentException ok)
    {}
  }

  private static List<IntegerPartition>
         collect(Iterator<IntegerPartition> it)
  {
    List<IntegerPartition> out = new ArrayList<>();
    while (it.hasNext())
    {
      out.add(it.next());
    }
    return out;
  }

  /** Descending-lex: compare part-by-part, longer partitions come later. */
  private static int descLexCompare(IntegerPartition a, IntegerPartition b)
  {
    int len = Math.min(a.length(), b.length());
    for (int i = 0; i < len; i++)
    {
      if (a.get(i) != b.get(i))
      {
        return java.lang.Integer.compare(a.get(i), b.get(i));
      }
    }
    // Prefix-equal: the shorter one is lex-greater in descending-lex.
    return java.lang.Integer.compare(b.length(), a.length());
  }
}
