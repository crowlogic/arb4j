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
public class RealTest
                      extends
                      TestCase
{

  public static void testSetFractionWithArena()
  {
    try ( Arena arena = Arena.ofShared(); Real r = new Real(arena))
    {
      Fraction f = new Fraction();
      f.set("10/43");
      r.set(f);
      assertEquals(0.23255813953488372093, r.doubleValue());
    }
  }

  public static void testSetFraction()
  {
    Real     r = new Real();
    Fraction f = new Fraction();
    f.set("10/43");
    r.set(f);
    assertEquals(0.23255813953488372093, r.doubleValue());
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

    try ( Real varianceStructure = realInstance.structure(5, 128))
    {
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
      try ( Real expectedDotProduct = new Real(); Real result = new Real();)
      {
        expectedDotProduct.set(32);
        real1.dotProduct(real2, prec, result);

        assertEquals(expectedDotProduct, result);
      }
    }
  }

  public static void testCovariance()
  {
    Real r = Real.newVector(3);
    r.get(0).set("1.3", prec);
    r.get(1).set("2.3", prec);
    r.get(2).set("3.3", prec);
    Real sumOfrSquares = r.covariance(r, prec, new Real());
    assertEquals(0.66666666666666666667, sumOfrSquares.doubleValue(), Math.pow(10, -20));
  }

  public static void testCovariance2()
  {
    Real r = Real.newVector(3);
    r.get(0).set("1", prec);
    r.get(1).set("2", prec);
    r.get(2).set("3", prec);
    Real p = Real.newVector(3);
    p.get(0).set("4", prec);
    p.get(1).set("5", prec);
    p.get(2).set("6", prec);
    Real sumOfrSquares = r.covariance(p, prec, new Real());
    assertEquals(0.66666666666666666667, sumOfrSquares.doubleValue(), Math.pow(10, -20));

  }

  public static void testVecScalarSub()
  {
    Real r = Real.newVector(3);
    r.get(0).set("1.3", prec);
    r.get(1).set("2.3", prec);
    r.get(2).set("3.3", prec);
    Real rMinusOne = r.subScalar(one, 128, Real.newVector(3));
    assertEquals(3.9, rMinusOne.Σ(128, new Real()).doubleValue());
  }

  public void testLinearRegression()
  {

  }

}
