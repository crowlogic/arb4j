package arb.combinatorics;

import arb.Integer;
import arb.IntegerPolynomial;
import junit.framework.TestCase;

/**
 * Tests for {@link WeightedCompositionCountFunction}.
 */
public class WeightedCompositionCountFunctionTest extends
                                                  TestCase
{
  /** Partitions of n into odd parts (A000009), first entries. */
  private static final int[] ODD_PART_COUNT = { 1, 1, 1, 2, 2, 3, 4, 5, 6, 8,
                                                10, 12 };

  private static IntegerPolynomial polyOf(int... coeffs)
  {
    IntegerPolynomial p = new IntegerPolynomial();
    for (int i = 0; i < coeffs.length; i++)
    {
      p.set(i, coeffs[i]);
    }
    return p;
  }

  public static void testEmptyPolynomialIsTotalZero()
  {
    // An empty polynomial (length 0) denotes total=0 with no weights, i.e.
    // exactly the empty composition: count = 1.
    try (Integer res = new Integer(); WeightedCompositionCountFunction f =
                                                                        new WeightedCompositionCountFunction())
    {
      IntegerPolynomial in = new IntegerPolynomial();
      f.evaluate(in, 0, 64, res);
      assertEquals(1L, res.getSignedValue());
    }
  }

  public static void testSingleWeightImpossibleTotal()
  {
    // [5, 2]: total=5, weight={2}. No composition. Count = 0.
    try (Integer res = new Integer(); WeightedCompositionCountFunction f =
                                                                        new WeightedCompositionCountFunction())
    {
      IntegerPolynomial in = polyOf(5, 2);
      f.evaluate(in, 0, 64, res);
      assertEquals(0L, res.getSignedValue());
    }
  }

  public static void testOddWeightsCountsAgainstA000009()
  {
    // IntegerPolynomial [n, 1, 3, 5, 7, 9, 11] for each n in the table.
    try (Integer res = new Integer(); WeightedCompositionCountFunction f =
                                                                        new WeightedCompositionCountFunction())
    {
      for (int n = 0; n < ODD_PART_COUNT.length; n++)
      {
        int maxOdd = (n % 2 == 0) ? Math.max(1, n - 1) : n;
        int oddCount = (maxOdd + 1) / 2;
        int[] coeffs = new int[1 + oddCount];
        coeffs[0] = n;
        for (int i = 0; i < oddCount; i++)
        {
          coeffs[i + 1] = 2 * i + 1;
        }
        IntegerPolynomial in = polyOf(coeffs);
        f.evaluate(in, 0, 64, res);
        assertEquals("count for n=" + n,
                     ODD_PART_COUNT[n],
                     res.getSignedValue());
      }
    }
  }

  public static void testEvenWeightsCountEqualsPartitionsOfHalf()
  {
    // Partitions of 2k into even parts = p(k).
    int[] pk = { 1, 1, 2, 3, 5, 7, 11 };
    try (Integer res = new Integer(); WeightedCompositionCountFunction f =
                                                                        new WeightedCompositionCountFunction())
    {
      for (int k = 0; k < pk.length; k++)
      {
        int total = 2 * k;
        int evenCount = Math.max(1, k); // weights 2,4,...,2k (empty if k==0)
        int[] coeffs;
        if (k == 0)
        {
          coeffs = new int[]
          { 0, 2 }; // need at least one weight
        }
        else
        {
          coeffs = new int[1 + k];
          coeffs[0] = total;
          for (int i = 0; i < k; i++)
          {
            coeffs[i + 1] = 2 * (i + 1);
          }
        }
        IntegerPolynomial in = polyOf(coeffs);
        f.evaluate(in, 0, 64, res);
        assertEquals("p(" + k + ")", pk[k], res.getSignedValue());
      }
    }
  }

  public static void testRejectsNegativeTotal()
  {
    try (Integer res = new Integer(); WeightedCompositionCountFunction f =
                                                                        new WeightedCompositionCountFunction())
    {
      IntegerPolynomial in = polyOf(-1, 1);
      f.evaluate(in, 0, 64, res);
      fail("expected IllegalArgumentException");
    }
    catch (IllegalArgumentException ok)
    {}
  }

  public static void testRejectsNonAscendingWeights()
  {
    try (Integer res = new Integer(); WeightedCompositionCountFunction f =
                                                                        new WeightedCompositionCountFunction())
    {
      IntegerPolynomial in = polyOf(3, 2, 2);
      f.evaluate(in, 0, 64, res);
      fail("expected IllegalArgumentException");
    }
    catch (IllegalArgumentException ok)
    {}
  }

  public static void testDomainAndCoDomainTypes()
  {
    try (WeightedCompositionCountFunction f =
                                             new WeightedCompositionCountFunction())
    {
      assertEquals(IntegerPolynomial.class, f.domainType());
      assertEquals(Integer.class, f.coDomainType());
    }
  }
}
