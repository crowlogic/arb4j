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
}
