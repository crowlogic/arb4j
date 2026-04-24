package arb.combinatorics;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import junit.framework.TestCase;

/**
 * Tests for {@link WeightedComposition} and {@link WeightedCompositions}.
 */
public class WeightedCompositionsTest extends
                                      TestCase
{
  /**
   * Partitions of n into odd parts (equivalently into distinct parts, by
   * Euler's theorem). OEIS A000009, first entries.
   */
  private static final int[] ODD_PART_COUNT = { 1, 1, 1, 2, 2, 3, 4, 5, 6, 8,
                                                10, 12, 15, 18, 22, 27 };

  /**
   * Partitions of n. OEIS A000041.
   */
  private static final int[] P_N = { 1, 1, 2, 3, 5, 7, 11, 15, 22, 30, 42, 56,
                                     77, 101, 135, 176, 231, 297, 385, 490,
                                     627 };

  public static void testOddWeightsCountsMatchOEISA000009()
  {
    for (int n = 0; n < ODD_PART_COUNT.length; n++)
    {
      int got = WeightedCompositions.countOfOddWeights(n);
      assertEquals("|{odd-weight comps of " + n + "}|", ODD_PART_COUNT[n], got);
    }
  }

  public static void testOddWeightsEnumerationDistinctAndSummingCorrectly()
  {
    for (int n = 0; n <= 10; n++)
    {
      Set<WeightedComposition>  seen = new HashSet<>();
      Iterator<WeightedComposition> it = WeightedCompositions.ofOddWeights(n);
      while (it.hasNext())
      {
        WeightedComposition c = it.next();
        assertEquals("composition sums to n", n, c.totalWeight());
        for (int i = 0; i < c.length(); i++)
        {
          assertTrue("odd weight",  c.weight(i) % 2 == 1);
          assertTrue("positive mult", c.multiplicity(i) > 0);
        }
        assertTrue("distinct comp", seen.add(c));
      }
    }
  }

  public static void testEvenWeightsCountsMatchPartitionsOfHalf()
  {
    // Partitions of 2k into even parts correspond bijectively to partitions
    // of k (divide each part by 2), hence count = p(k).
    for (int k = 0; k <= 10; k++)
    {
      int got = WeightedCompositions.countOfEvenWeights(2 * k);
      assertEquals("|{even-weight comps of " + (2 * k) + "}| = p(" + k + ")",
                   P_N[k],
                   got);
    }
  }

  public static void testEvenWeightsOddTotalIsEmpty()
  {
    // A composition of an odd total using only even weights is impossible.
    for (int n = 1; n <= 15; n += 2)
    {
      Iterator<WeightedComposition> it = WeightedCompositions.ofEvenWeights(n);
      assertFalse("odd total " + n + " over even weights should be empty",
                  it.hasNext());
    }
  }

  public static void testEvenWeightsTotalZero()
  {
    Iterator<WeightedComposition> it = WeightedCompositions.ofEvenWeights(0);
    assertTrue(it.hasNext());
    WeightedComposition c = it.next();
    assertEquals(0, c.totalWeight());
    assertEquals(0, c.length());
    assertFalse(it.hasNext());
  }

  public static void testSmallEnumerationOdd3()
  {
    // total=3 over odd weights {1,3}: (3) and (3*1).  Two compositions.
    List<WeightedComposition> got = collect(WeightedCompositions.ofOddWeights(3));
    assertEquals(2, got.size());
    Set<String> strings = new HashSet<>();
    for (WeightedComposition c : got)
    {
      strings.add(c.toString());
      assertEquals(3, c.totalWeight());
    }
    assertTrue(strings.contains("(1*3)"));
    assertTrue(strings.contains("(3*1)"));
  }

  public static void testSmallEnumerationEven6()
  {
    // total=6 over even weights {2,4,6}: compositions are 3*2, 1*2+1*4,
    // 1*6.  That is 3 = p(3).
    List<WeightedComposition> got = collect(WeightedCompositions.ofEvenWeights(6));
    assertEquals(3, got.size());
    for (WeightedComposition c : got)
    {
      assertEquals(6, c.totalWeight());
      for (int i = 0; i < c.length(); i++)
      {
        assertTrue(c.weight(i) % 2 == 0);
      }
    }
  }

  public static void testGeneralOverAllWeights()
  {
    // Over weights {1,2,3,4,5}, number of compositions of n equals p(n) for
    // n <= 5 (all partitions fit since max part <= n).
    for (int n = 0; n <= 5; n++)
    {
      int[] w = new int[n > 0 ? n : 1];
      for (int i = 0; i < w.length; i++)
      {
        w[i] = i + 1;
      }
      int got = WeightedCompositions.count(w, n);
      assertEquals("all-weights count for n=" + n, P_N[n], got);
    }
  }

  public static void testMultinomialPermutationCount()
  {
    // (m_1, m_3) = (2, 1): total = 2+3 = 5, number of parts = 3,
    // permutationCount = 3! / (2! 1!) = 3.
    WeightedComposition c = new WeightedComposition(new int[]
    { 1, 3 }, new int[]
    { 2, 1 });
    assertEquals(5, c.totalWeight());
    assertEquals(3, c.numberOfParts());
    assertEquals(3L, c.permutationCount());
  }

  public static void testNumberOfParts()
  {
    WeightedComposition c = new WeightedComposition(new int[]
    { 2, 4, 6 }, new int[]
    { 3, 1, 2 });
    assertEquals(6, c.numberOfParts());
    assertEquals(3 * 2 + 1 * 4 + 2 * 6, c.totalWeight()); // 22
    assertEquals(22, c.totalWeight());
  }

  public static void testInvalidConstruction()
  {
    try
    {
      new WeightedComposition(new int[]
      { 1, 2 }, new int[]
      { 1 }); // length mismatch
      fail("expected IllegalArgumentException for length mismatch");
    }
    catch (IllegalArgumentException ok)
    {}
    try
    {
      new WeightedComposition(new int[]
      { 2, 2 }, new int[]
      { 1, 1 }); // not strictly ascending
      fail("expected IllegalArgumentException for non-ascending weights");
    }
    catch (IllegalArgumentException ok)
    {}
    try
    {
      new WeightedComposition(new int[]
      { 1 }, new int[]
      { 0 }); // non-positive multiplicity
      fail("expected IllegalArgumentException for zero multiplicity");
    }
    catch (IllegalArgumentException ok)
    {}
    try
    {
      new WeightedComposition(new int[]
      { 0 }, new int[]
      { 1 }); // non-positive weight
      fail("expected IllegalArgumentException for zero weight");
    }
    catch (IllegalArgumentException ok)
    {}
  }

  public static void testEqualsAndHashCode()
  {
    WeightedComposition a = new WeightedComposition(new int[]
    { 1, 3 }, new int[]
    { 2, 1 });
    WeightedComposition b = new WeightedComposition(new int[]
    { 1, 3 }, new int[]
    { 2, 1 });
    WeightedComposition c = new WeightedComposition(new int[]
    { 1, 3 }, new int[]
    { 1, 1 });
    assertEquals(a, b);
    assertEquals(a.hashCode(), b.hashCode());
    assertFalse(a.equals(c));
  }

  private static List<WeightedComposition>
         collect(Iterator<WeightedComposition> it)
  {
    List<WeightedComposition> out = new ArrayList<>();
    while (it.hasNext())
    {
      out.add(it.next());
    }
    return out;
  }
}
