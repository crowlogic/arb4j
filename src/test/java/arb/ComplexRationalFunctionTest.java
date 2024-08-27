package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexRationalFunctionTest extends
                                         TestCase
{

  private ComplexRationalFunction a;
  private ComplexRationalFunction b;
  private ComplexRationalFunction result;
  private int                     prec = 128;

  public static void testSquare()
  {
    try ( ComplexRationalFunction f =
                                    new ComplexRationalFunction("(1+2*ⅈ+3*x+4*ⅈ*x^2)/(5-6*ⅈ*x+7*x^3-8*ⅈ*x^4)");
          ComplexRationalFunction fSquared = f.square(128, new ComplexRationalFunction());
          ComplexFraction point = fSquared.evaluate(new Fraction(230,
                                                                 100),
                                                    new ComplexFraction()))
    {
      assertEquals(0.00173299324387004007955453560959, point.realPart.doubleValue());
      assertEquals(-0.009103093364133974, point.imaginaryPart.doubleValue());
    }
  }

  public static void testMultiplicativeInverse()
  {
    var f = new ComplexRationalFunction("(1-x)*ⅈ-(x-1)");
    var inv = f.multiplicativeInverse(new ComplexRationalFunction());
    var g = inv.multiplicativeInverse();
    assertEquals( f, g);
  }

  @SuppressWarnings("resource")
  public static void testRaiseToANegativeIntegerPower()
  {
    try ( ComplexRationalFunction f =
                                    new ComplexRationalFunction().set("(1+2*ⅈ+3*x+4*ⅈ*x^2)/(5-6*ⅈ*x+7*x^3-8*ⅈ*x^4)"))
    {
      assertEquals("(-32*x^6+5*x^4-17*x^3+3*x+5)/(64*x^8+49*x^6+96*x^5+70*x^3+36*x^2+25) + ((52*x^5+8*x^4+14*x^3+38*x^2+6*x+10)/(64*x^8+49*x^6+96*x^5+70*x^3+36*x^2+25))i",
                   f.toString());
      ComplexFraction y = f.evaluate(new Fraction(230,
                                                  100),
                                     new ComplexFraction());
      assertEquals(-0.07416055890090498, y.realPart.doubleValue());
      assertEquals(0.06137422303071997, y.imaginaryPart.doubleValue());

      ComplexRationalFunction pow = f.pow(new Integer(-2), 128, new ComplexRationalFunction());
      ComplexFraction         y2  = pow.evaluate(new Fraction(230,
                                                              100),
                                                 new ComplexFraction());
      assertEquals(20.18169131958561589132569543344225562674, y2.realPart.doubleValue());
      assertEquals(106.0106962206352505316329133368229455630, y2.imaginaryPart.doubleValue());

      assert false : f + "^(-2)=" + y2;
    }

  }

  @Override
  protected void setUp() throws Exception
  {
    super.setUp();
    a      = new ComplexRationalFunction();
    b      = new ComplexRationalFunction();
    result = new ComplexRationalFunction();
  }

  @Override
  protected void tearDown() throws Exception
  {
    a.close();
    b.close();
    result.close();
    super.tearDown();
  }

  public void testAdditiveIdentity()
  {
    a.additiveIdentity();
    assertTrue(a.realPart.isZero());
    assertTrue(a.imaginaryPart.isZero());
  }

  public void testMultiplicativeIdentity()
  {
    a.multiplicativeIdentity();
    assertTrue(a.realPart.isOne());
    assertTrue(a.imaginaryPart.isZero());
  }

  public static void testMultiplicationMoreThoroughly()
  {
    ComplexRationalFunction a = new ComplexRationalFunction();
    a.realPart.set("3+4*x^2-3*x^4");
    a.imaginaryPart.set("-1+2*x-3*x^3");
    ComplexRationalFunction b = new ComplexRationalFunction();
    b.realPart.set("-2-2*x^2-3*x^3");
    b.imaginaryPart.set("1+3*x^2-3*x^3");

    ComplexRationalFunction product    = a.mul(b, new ComplexRationalFunction());
    // System.out.format("(%s)*(%s)=%s\n", a, b, product);

    Fraction                x          = new Fraction(23,
                                                      100);
    ComplexFraction         aAtx       = a.evaluate(x, new ComplexFraction());
    ComplexFraction         bAtx       = b.evaluate(x, new ComplexFraction());
    // System.out.format("%s(%s)=%s\n", a, x, aAtx);
    // System.out.format("%s(%s)=%s\n", b, x, bAtx);
    ComplexFraction         aDivbAtx   = aAtx.mul(bAtx, new ComplexFraction());
    // System.out.format("%s*%s=%s", aAtx, bAtx, aDivbAtx );
    ComplexFraction         productAtx = product.evaluate(x, new ComplexFraction());
    assertEquals(productAtx, aDivbAtx);
  }

  public static void testSubtractionMoreThoroughly()
  {
    ComplexRationalFunction a = new ComplexRationalFunction();
    a.realPart.set("3+4*x^2-3*x^4");
    a.imaginaryPart.set("-1+2*x-3*x^3");
    ComplexRationalFunction b = new ComplexRationalFunction();
    b.realPart.set("-2-2*x^2-3*x^3");
    b.imaginaryPart.set("1+3*x^2-3*x^3");

    ComplexRationalFunction difference    = a.sub(b, new ComplexRationalFunction());
    // System.out.format("(%s)-(%s)=%s\n", a, b, difference);

    Fraction                x             = new Fraction(23,
                                                         100);
    ComplexFraction         aAtx          = a.evaluate(x, new ComplexFraction());
    ComplexFraction         bAtx          = b.evaluate(x, new ComplexFraction());
    // System.out.format("%s(%s)=%s\n", a, x, aAtx);
    // System.out.format("%s(%s)=%s\n", b, x, bAtx);
    ComplexFraction         aMinusbAtx    = aAtx.sub(bAtx, new ComplexFraction());
    // System.out.format("%s-%s=%s", aAtx, bAtx, aMinusbAtx );
    ComplexFraction         differenceAtx = difference.evaluate(x, new ComplexFraction());
    assertEquals(differenceAtx, aMinusbAtx);
  }

  public static void testDivisionMoreThoroughly()
  {
    ComplexRationalFunction a = new ComplexRationalFunction();
    a.realPart.set("3+4*x^2-3*x^4");
    a.imaginaryPart.set("-1+2*x-3*x^3");
    ComplexRationalFunction b = new ComplexRationalFunction();
    b.realPart.set("-2-2*x^2-3*x^3");
    b.imaginaryPart.set("1+3*x^2-3*x^3");

    ComplexRationalFunction quotient    = a.div(b, new ComplexRationalFunction());
    // System.out.format("(%s)/(%s)=%s\n", a, b, quotient);

    Fraction                x           = new Fraction(23,
                                                       100);
    ComplexFraction         aAtx        = a.evaluate(x, new ComplexFraction());
    ComplexFraction         bAtx        = b.evaluate(x, new ComplexFraction());
    // System.out.format("%s(%s)=%s\n", a, x, aAtx);
    // System.out.format("%s(%s)=%s\n", b, x, bAtx);
    ComplexFraction         aDivbAtx    = aAtx.div(bAtx, new ComplexFraction());
    // System.out.format("%s/%s=%s", aAtx, bAtx, aDivbAtx );
    ComplexFraction         quotientAtx = quotient.evaluate(x, new ComplexFraction());
    assertEquals(quotientAtx, aDivbAtx);
  }

  public static void testAdditionMoreThoroughly()
  {
    ComplexRationalFunction a = new ComplexRationalFunction();
    a.realPart.set("3+4*x^2-3*x^4");
    a.imaginaryPart.set("-1+2*x-3*x^3");
    ComplexRationalFunction b = new ComplexRationalFunction();
    b.realPart.set("-2-2*x^2-3*x^3");
    b.imaginaryPart.set("1+3*x^2-3*x^3");

    ComplexRationalFunction sum  = a.add(b, new ComplexRationalFunction());
    // System.out.format("(%s)+(%s)=%s\n", a, b, sum);

    Fraction                x    = new Fraction(23,
                                                100);
    ComplexFraction         aAtx = a.evaluate(x, new ComplexFraction());
    ComplexFraction         bAtx = b.evaluate(x, new ComplexFraction());
//    /System.out.format("%s(%s)=%s\n", a, x, aAtx);
    System.out.format("%s(%s)=%s\n", b, x, bAtx);
    ComplexFraction aPlusbAtx = aAtx.add(bAtx, new ComplexFraction());
    ComplexFraction sumAtx    = sum.evaluate(x, new ComplexFraction());
    assertEquals(sumAtx, aPlusbAtx);
  }

  public void testAdd()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.add(b, prec, result);
    assertEquals("4 + 6i", result.toString());
  }

  public void testAddWithNegativeImaginary()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(-2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.add(b, prec, result);
    assertEquals("4 + 2i", result.toString());
  }

  public void testAddInteger()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(2);
    var b = new Integer(3);
    a.add(b, prec, result);
    assertEquals("4 + 2i", result.toString());
  }

  public void testSub()
  {
    a.realPart.set(5);
    a.imaginaryPart.set(7);
    b.realPart.set(2);
    b.imaginaryPart.set(3);
    a.sub(b, prec, result);
    assertEquals("3 + 4i", result.toString());
  }

  public void testSubWithNegativeImaginary()
  {
    a.realPart.set(5);
    a.imaginaryPart.set(-7);
    b.realPart.set(2);
    b.imaginaryPart.set(3);
    a.sub(b, prec, result);
    assertEquals("3 + (-10)i", result.toString());
  }

  public void testMul()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.mul(b, prec, result);
    assertEquals("-5 + 10i", result.toString());
  }

  public void testMulWithNegativeImaginary()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(-2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.mul(b, prec, result);
    assertEquals("11 + (-2)i", result.toString());
  }

  public void testDiv()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.div(b, prec, result);
    // The exact result should be (11 + 2i) / 25
    assertTrue(result.realPart.evaluate(new Fraction(), 0, prec, new Fraction())
                              .equals(new Fraction(11,
                                                   25)));
    assertTrue(result.imaginaryPart.evaluate(new Fraction(), 0, prec, new Fraction())
                                   .equals(new Fraction(2,
                                                        25)));
  }

  public void testDivWithNegativeImaginary()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(-2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.div(b, prec, result);
    assertEquals("-1/5 + (-2/5)i", result.toString());
//    // The exact result should be (5 - 10i) / 25
//    assertEquals(result.realPart.evaluate(new Fraction(), 0, prec, new Fraction()),
//                 (new Fraction(5,
//                               25)));
//    assertEquals(result.imaginaryPart.evaluate(new Fraction(), 0, prec, new Fraction()),
//                 (new Fraction(-10,
//                               25)));
  }

  public void testMulInt()
  {
    a.realPart.set(2);
    a.imaginaryPart.set(3);
    a.mul(2, prec, result);
    assertEquals("4 + 6i", result.toString());
  }

  public void testDivInt()
  {
    a.realPart.set(4);
    a.imaginaryPart.set(6);
    a.div(2, prec, result);
    assertEquals("2 + 3i", result.toString());
  }

  public void testEvaluate()
  {
    a.realPart.set("x + 1");
    a.imaginaryPart.set("x - 1");
    Fraction        input  = new Fraction(2,
                                          3);

    ComplexFraction output = new ComplexFraction();
    a.evaluate(input, 0, prec, output);
    // System.out.format("%s @ x=%s = %s\n", a, input, output);
    assertEquals("(5⁄3)+(-1⁄3)i", output.toString());

  }

  public void testEvaluateWithNegativeRealPart()
  {

    a.realPart.set("x + 1");
    a.imaginaryPart.set("1-x");
    Fraction input = new Fraction();
    input.set(-3, 4);
    ComplexFraction output = new ComplexFraction();
    a.evaluate(input, 0, prec, output);
    assertEquals("(1⁄4)+(7⁄4)i", output.toString());
  }

  public void testVerify()
  {
    assertTrue(a.verify());
  }

  public void testToString()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(2);
    assertEquals("1 + 2i", a.toString());
  }

  public void testToStringWithNegativeImaginary()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(-2);
    assertEquals("1 + (-2)i", a.toString());
  }
}