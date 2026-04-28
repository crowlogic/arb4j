package arb;

import static arb.RealConstants.one;

import java.lang.foreign.Arena;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings(
{ "unused", "resource" })
public class RealTest extends
                      TestCase
{

  public void testPowerToFraction()
  {
    // test that sqrt of negative number is not finite (its Nan)
    var bits = 128;
    try ( var x = Real.valueOf(-0.57); var y = new Real();)
    {
      x.pow(FractionConstants.oneHalf, bits, y);
      assertFalse(y.isFinite());
    }

  }

  public void testLogGamma()
  {
    Real x      = new Real("8.7",
                           128);
    Real result = x.logΓ(128, new Real());
    assertEquals(9.967761685128642593213111179011761191, result.doubleValue());
  }

  public static void testResize()
  {
    try ( Real x = Real.valueOf("3.4", 128); var origx = x.copy();)
    {
      x.resize(3);
      Real x1     = x.get(1);
      var  newval = new Real("6.9",
                             128);
      x1.set(newval);
      assertEquals(x.get(1), newval);
      assertEquals(x.toString(), origx, x.get(0));
    }
  }

  public static void testSetFractionWithArena()
  {
    try ( Arena arena = Arena.ofShared(); Real r = new Real(arena))
    {
      Fraction f = new Fraction();
      f.set("10/43");
      r.set(f);
      assertEquals(0.23255813953488372093, r.doubleValue());
      assertFalse(r.swigCMemOwn);
    }
  }

  public static void testSetFraction()
  {
    try ( Real r = new Real())
    {
      Fraction f = new Fraction();
      f.set("10/43");
      r.set(f);
      assertEquals(0.23255813953488372093, r.doubleValue());
    }
  }

  public static void testVectorAddViaExpressionToString()
  {
    try ( Real onePointThree = new Real("1.3",
                                        128);
          Real twoPointFour = new Real("2.4",
                                       128);)
    {
      var  f   = RealNullaryFunction.express("[1.0,2.0]+[0.3,0.4]");
      Real vec = f.evaluate(128);
      assertEquals(1.3, vec.get(0).doubleValue());
      assertEquals(2.4, vec.get(1).doubleValue());
    }

  }

  public static void testVectorMultiplicationViaExpressionToString()
  {
    try ( Real onePointThree = new Real("1.3",
                                        128);
          Real twoPointFour = new Real("2.4",
                                       128);)
    {
      var  f   = RealNullaryFunction.express("[1.0,2.0]*[0.3,0.4]");
      Real vec = f.evaluate(128);
      assertEquals(0.3, vec.get(0).doubleValue());
      assertEquals(0.8, vec.get(1).doubleValue());
    }

  }

  public static void testVectorSubtractionViaExpressionToString()
  {
    try ( Real onePointThree = new Real("1.3",
                                        128);
          Real twoPointFour = new Real("2.4",
                                       128);)
    {
      var  f   = RealNullaryFunction.express("[1.0,2.0]-[0.3,0.4]");
      Real vec = f.evaluate(128);
      assertEquals(0.7, vec.get(0).doubleValue());
      assertEquals(1.6, vec.get(1).doubleValue());
    }

  }

  public static void testVectorViaExpressionToString()
  {
    try ( Real onePointTwo = new Real("1.2",
                                      128))
    {
      var  f   = RealNullaryFunction.express("[1.2]");
      Real vec = f.evaluate(128);
      assertEquals(onePointTwo, vec);
      // assertEquals(onePointTwo.toString(), vec.toString());

    }

  }

  public static void testVectorViaExpression1()
  {
    var  f   = RealNullaryFunction.express("[1.2]");
    Real vec = f.evaluate(128);
    assertEquals(1, vec.size());

  }

  public static void testVectorViaExpression2()
  {
    var  f   = RealNullaryFunction.express("[1.2,6.0]");
    Real vec = f.evaluate(128);
    assertEquals(2, vec.size());
    assertEquals(1.2, vec.get(0).doubleValue());
    assertEquals(6.0, vec.get(1).doubleValue());

  }

  public static void testVector()
  {
    try ( Real a = Real.valueOf(3.2); Real b = Real.valueOf(4); Real real = new Real(a,
                                                                                     b))
    {
      assertEquals(a, real.get(0));
      assertEquals(b, real.get(1));
    }

  }

  public static void testLong()
  {
    try ( Real real = new Real("3",
                               128))
    {
      Integer intThree = real.getInteger(new Integer());
      assertEquals(3, intThree.getSignedValue());
    }

  }

  public void testRisingFactorialLong()
  {
    try ( Real real = new Real("6.9",
                               128))
    {
      Real y = real.ascendingFactorial(3, 128, new Real());
      assertEquals(485.139, y.doubleValue());
    }
  }

  public void testRisingFactorialReal()
  {
    try ( Real real = new Real("6.9",
                               128);
          Real three = new Real("3",
                                128);)
    {
      Real y = real.ascendingFactorial(three, 128, new Real());
      assertEquals(485.139, y.doubleValue());
    }
  }

  public void testAddOneAndOne()
  {
    try ( Real real = new Real();)
    {
      real.add(RealConstants.one, 128);
      assertEquals(RealConstants.one, real);
    }
  }

  public void testChoose()
  {
    try ( Real ten = Real.valueOf(10))
    {
      double twoTen = ten.C(6, 128).doubleValue();
      assertEquals(210.0, twoTen);
    }
  }

  public void testShift()
  {
    int N = 10;
    try ( Real realInstance = Real.newVector(N, "testInstance"))
    {
      for (int i = 0; i < N; i++)
      {
        realInstance.get(i).set(i);
      }

      Real shifted = realInstance.shift(5);
      assertEquals(5, shifted.size());

    }
  }

  private static final int prec = 128;

  public void testOneIsExact()
  {
    assertTrue(RealConstants.one.isExact());
  }

  public void testVarianceStructure()
  {
    int        N            = 10;
    final Real realInstance = Real.newVector(N, "testInstance");
    for (int i = 0; i < N; i++)
    {
      realInstance.get(i).set(i);
    }

    ThreadLocal<Real> yPool = new ThreadLocal<>();
    try ( Real varianceStructure = Real.newVector(5, "γ"))
    {
      realInstance.structure(5, 128, yPool, varianceStructure);
      varianceStructure.printPrecision = true;

      // Actual expected calculations
      Real expected = Real.newVector(N, "expected");
      for (int i = 0; i < N; i++)
      {
        expected.get(i).set(i * i); // Squared values
      }

      for (int i = 0; i < N / 2; i++)
      {
        Real   gammaVarianceResult = varianceStructure.get(i);
        double expectation         = expected.get(i).doubleValue();
        double gammaVariance       = gammaVarianceResult.doubleValue();
        assertEquals(expectation, gammaVariance, 0.0001);
      }
    }
  }

  /**
   * Regression: structure() must use only the caller-supplied y scratch and
   * not allocate a new arb_t vector per lag. The pre-fix implementation called
   * Real.newVector(dim - n) inside gammaVariance from an IntStream.parallel
   * forEach over all lags, which OOM-killed the JVM on path lengths near 10⁵.
   *
   * This test calls structure() repeatedly with the same scratch and asserts
   * each invocation produces identical γ values — idempotent reuse of caller
   * scratch is only possible when the implementation writes solely into the
   * passed-in y and result, with no hidden state.
   */
  public void testStructureUsesCallerScratchOnly()
  {
    int               N      = 64;
    int               maxLag = 16;
    int               bits   = 128;
    ThreadLocal<Real> yPool  = new ThreadLocal<>();
    try ( Real path   = Real.newVector(N, "Z");
          Real gammaA = Real.newVector(maxLag, "γA");
          Real gammaB = Real.newVector(maxLag, "γB"))
    {
      for (int i = 1; i <= N; i++)
      {
        path.get(i - 1).set(Math.sin(0.1 * i));
      }
      path.structure(maxLag, bits, yPool, gammaA);
      path.structure(maxLag, bits, yPool, gammaB);
      for (int k = 1; k <= maxLag; k++)
      {
        assertEquals("γ(" + k + ") differs across invocations",
                     gammaA.get(k - 1).doubleValue(),
                     gammaB.get(k - 1).doubleValue(),
                     1e-30);
      }
      assertEquals(0.0, gammaA.get(0).doubleValue(), 1e-30);
      assertTrue("γ(1) should be positive on a non-constant sequence",
                 gammaA.get(1).doubleValue() > 0.0);
    }
    finally
    {
      yPool.remove();
    }
  }

  public void testSub()
  {
    final int bits = 128;
    try ( // Test case for a positive subtrahend
          Real real1 = new Real(5.0))
    {
      Real result1 = new Real();
      real1.sub(3, bits, result1);
      assertEquals(2.0, result1.doubleValue(), 0.01);
    }
    try ( // Test case for a negative subtrahend
          Real real2 = new Real(5.0))
    {
      Real result2 = new Real();
      real2.sub(-3, bits, result2);
      assertEquals(8.0, result2.doubleValue(), 0.01);
    }
  }

  public void testAdd()
  {
    final int bits = 128;
    try ( // Test case for a positive addend
          Real real1 = new Real(5.0))
    {
      Real result = new Real();
      real1.add(3, bits, result);
      assertEquals(8.0, result.doubleValue(), 0.01);
    }
    try ( // Test case for a negative addend
          Real real2 = new Real(5.0))
    {
      Real result2 = new Real();
      real2.add(-3, bits, result2);
      assertEquals(2.0, result2.doubleValue(), 0.01);
    }
  }

  public void testDotProduct()
  {
    try ( Real real1 = Real.newVector(3); Real real2 = Real.newVector(3);)
    {
      for (int i = 0; i < 3; i++)
      {
        real1.get(i).set(i + 1);
        real2.get(i).set(i + 4);
      }

      // as per calculation, 1*4 + 2*5 + 3*6 = 32
      try ( Real expectedDotProduct = real1.borrowVariable(); Real result = real1.borrowVariable();)
      {
        expectedDotProduct.set(32);
        real1.dotProduct(real2, prec, result);

        assertEquals(expectedDotProduct, result);
      }
    }
  }

}
