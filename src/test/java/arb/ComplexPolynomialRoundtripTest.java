package arb;

import arb.functions.complex.ComplexPolynomialNullaryFunction;
import junit.framework.TestCase;

public class ComplexPolynomialRoundtripTest extends TestCase
{
  static void assertRoundtrip(String expr)
  {
    try (var f = ComplexPolynomialNullaryFunction.express(expr);
         var a = f.evaluate())
    {
      try (var g = ComplexPolynomialNullaryFunction.express(a.toString());
           var b = g.evaluate())
      {
        assertEquals(a, b);
      }
    }
  }

  public static void testPureReal()
  {
    assertRoundtrip("1+x²");
  }

  public static void testPureImaginary()
  {
    assertRoundtrip("ⅈ+ⅈ*x²");
  }

  public static void testMixed()
  {
    assertRoundtrip("1+ⅈ*x");
  }

  public static void testNegativeReal()
  {
    assertRoundtrip("-x²+1");
  }

  public static void testNegativeImaginary()
  {
    assertRoundtrip("-ⅈ*x²+ⅈ");
  }

  public static void testSingleTermReal()
  {
    assertRoundtrip("3*x²");
  }

  public static void testSingleTermImaginary()
  {
    assertRoundtrip("2*ⅈ*x³");
  }

  public static void testMixedNegativeImaginary()
  {
    assertRoundtrip("x²-ⅈ*x");
  }

  public static void testConstantImaginary()
  {
    assertRoundtrip("ⅈ");
  }

  public static void testConstantNegativeImaginary()
  {
    assertRoundtrip("-ⅈ");
  }

  public static void testMixedComplexCoefficientHighDegree()
  {
    assertRoundtrip("(1+ⅈ)*x²");
  }

  public static void testMixedComplexCoefficientDegreeOne()
  {
    assertRoundtrip("(1+ⅈ)*x");
  }

  public static void testNegativeMixedComplexCoefficient()
  {
    assertRoundtrip("(-1-ⅈ)*x²");
  }

  public static void testMultipleMixedComplexCoefficients()
  {
    assertRoundtrip("(1+ⅈ)*x²+(2-ⅈ)*x");
  }

  public static void testMixedComplexConstantAndHighDegree()
  {
    assertRoundtrip("(1+ⅈ)*x³+3*x+2");
  }

  public static void testPureImaginaryHighDegree()
  {
    assertRoundtrip("ⅈ*x⁴");
  }

  public static void testConstantMixedComplex()
  {
    assertRoundtrip("1+ⅈ");
  }

  public static void testNegativeMixedComplexConstant()
  {
    assertRoundtrip("-1-ⅈ");
  }

  public static void testLargeMixedPolynomial()
  {
    assertRoundtrip("(3+2*ⅈ)*x³-(1+ⅈ)*x+4");
  }

  public static void testComplexCoeffWithNegativeRealPositiveImag()
  {
    assertRoundtrip("(-2+3*ⅈ)*x²");
  }

  public static void testComplexCoeffWithPositiveRealNegativeImag()
  {
    assertRoundtrip("(2-3*ⅈ)*x²");
  }

  public static void testMixedComplexAllDegrees()
  {
    assertRoundtrip("(1+ⅈ)*x³+(2-ⅈ)*x²+(3+2*ⅈ)*x+4-ⅈ");
  }

  public static void testZeroDegreeTermWithComplexCoeff()
  {
    assertRoundtrip("(1+ⅈ)+x²");
  }

  public static void testOnlyComplexConstant()
  {
    assertRoundtrip("3+2*ⅈ");
  }

  public static void testComplexCoeffDegreeFour()
  {
    assertRoundtrip("(1+ⅈ)*x⁴+(2-ⅈ)*x²+1");
  }
}
