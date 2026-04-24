package arb.combinatorics;

import arb.Complex;
import arb.Integer;
import arb.Real;
import junit.framework.TestCase;

/**
 * Tests for {@link MultinomialCoefficient}.
 */
public class MultinomialCoefficientTest extends
                                        TestCase
{
  public static void testEmptyTupleIsOne()
  {
    try (Integer res = new Integer())
    {
      MultinomialCoefficient.of(new long[0], res);
      assertEquals(1L, res.getSignedValue());
    }
  }

  public static void testSingletonIsOne()
  {
    // (n)! / n! = 1.
    try (Integer res = new Integer())
    {
      for (int n = 0; n <= 10; n++)
      {
        MultinomialCoefficient.of(new long[]
        { n }, res);
        assertEquals("(" + n + ")!/" + n + "! = 1",
                     1L,
                     res.getSignedValue());
      }
    }
  }

  public static void testBinomialCase()
  {
    try (Integer res = new Integer())
    {
      // C(5, 3) = 10
      MultinomialCoefficient.of(new long[]
      { 3, 2 }, res);
      assertEquals(10L, res.getSignedValue());
      // C(8, 4) = 70
      MultinomialCoefficient.of(new long[]
      { 4, 4 }, res);
      assertEquals(70L, res.getSignedValue());
      // With a zero: (5, 0) => 5!/(5! 0!) = 1
      MultinomialCoefficient.of(new long[]
      { 5, 0 }, res);
      assertEquals(1L, res.getSignedValue());
    }
  }

  public static void testTrinomialCase()
  {
    // (2, 2, 2) => 6! / (2! 2! 2!) = 720 / 8 = 90.
    try (Integer res = new Integer())
    {
      MultinomialCoefficient.of(new long[]
      { 2, 2, 2 }, res);
      assertEquals(90L, res.getSignedValue());
    }
  }

  public static void testQuadnomialWithZero()
  {
    // (1, 0, 1, 1) => 3! / (1! 0! 1! 1!) = 6.
    try (Integer res = new Integer())
    {
      MultinomialCoefficient.of(new long[]
      { 1, 0, 1, 1 }, res);
      assertEquals(6L, res.getSignedValue());
    }
  }

  public static void testLargeMultinomial()
  {
    // (10, 10, 10) => 30! / (10!)^3 = 5550996791340 (> Integer.MAX_VALUE).
    try (Integer res = new Integer())
    {
      MultinomialCoefficient.of(new long[]
      { 10, 10, 10 }, res);
      assertEquals("5550996791340", res.toString());
    }
  }

  public static void testVeryLargeMultinomial()
  {
    // (15, 15, 15, 15) = 60! / (15!)^4. Computed via
    // Python math.factorial(60)//math.factorial(15)**4.
    try (Integer res = new Integer())
    {
      MultinomialCoefficient.of(new long[]
      { 15, 15, 15, 15 }, res);
      assertEquals("2845616726065971560165538537369600",
                   res.toString());
    }
  }

  public static void testIntArrayOverload()
  {
    try (Integer res = new Integer())
    {
      MultinomialCoefficient.of(new int[]
      { 3, 2 }, res);
      assertEquals(10L, res.getSignedValue());
    }
  }

  public static void testRealOverload()
  {
    try (Real res = new Real())
    {
      MultinomialCoefficient.of(new long[]
      { 3, 2 }, 128, res);
      assertTrue("Real of (3,2) should be 10", res.toString().startsWith("10"));
    }
  }

  public static void testComplexOverload()
  {
    try (Complex res = new Complex())
    {
      MultinomialCoefficient.of(new long[]
      { 2, 2, 2 }, 128, res);
      // Real part ~ 90, imaginary part exactly 0.
      assertTrue("Complex (2,2,2) should have real part starting with 90",
                 res.getReal().toString().startsWith("90"));
      assertTrue("imaginary part exact zero",
                 res.getImag().toString().startsWith("0"));
    }
  }

  public static void testNegativeRejected()
  {
    try (Integer res = new Integer())
    {
      MultinomialCoefficient.of(new long[]
      { -1, 2 }, res);
      fail("expected IllegalArgumentException");
    }
    catch (IllegalArgumentException ok)
    {}
  }
}
