package arb;

import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.functions.rational.ComplexRationalFunctionSequence;
import arb.functions.rational.ComplexRationalNullaryFunction;
import arb.utensils.Utensils;
import junit.framework.TestCase;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ComplexRationalFunctionTest extends
                                         TestCase
{

  public static void testEvaluateWithComplexFraction()
  {
    try ( var f = new ComplexRationalFunction())
    {
      f.set("(-6*x^2+15)/(x^3)");
      assertEquals("(-6*x^2+15)/(x^3) + 0i", f.toString());
      var x = new Fraction();
      x.set("34⁄12");
      ComplexFraction y = f.evaluate(x, 128, new ComplexFraction());
      assertEquals("(-7164⁄4913)+(0)i", y.toString());
    }

  }

  public void testComplexRationalLommelPolynomials()
  {
    var context = new Context();
    context.registerVariable("v", RealConstants.half);

    var R    =
          ComplexRationalFunctionSequence.express("R:n➔(v₍ₙ₎/((z/2)^(n)))*pFq([1⁄2-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                                  context);

    var Rtoo =
             ComplexRationalFunctionSequence.express("Rtoo:n➔v₍ₙ₎*(z/2)^(-n)*pFq([1⁄2-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                                     context);

    var x    = R.evaluate(3, 128);
    var xToo = Rtoo.evaluate(3, 128);
    assertEquals("(-6*x^2+15)/(x^3) + 0i", x.toString());
    assertEquals("(-6*x^2+15)/(x^3) + 0i", xToo.toString());
  }

  public void testComplexRationalLommelPolynomialsAsNullary()
  {
    var    context = new Context(Real.named("v").set(RealConstants.half),
                                 Integer.named("n").set(3));

    var    R       =
             ComplexRationalNullaryFunction.express("v₍ₙ₎*(z/2)^(-n)*pFq([1⁄2-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                                    context);

    var    x       = R;                                                                                    // .();

    Object x3      = x.evaluate(128);

    assertEquals("(-6*x^2+15)/(x^3) + 0i", x3.toString());
  }

  @SuppressWarnings("resource")
  public void testAddToo()
  {
    try ( var three = new ComplexRationalFunction().set(3);
          var four = new ComplexRationalFunction().set(4);
          var seven = new ComplexRationalFunction().set(7);)
    {
      three.add(four, seven);
      assertEquals("7 + 0i", seven.toString());
    }
  }

  public void testPowers()
  {

    var                     seq       = ComplexRationalFunctionSequence.express("n➔(½-z/2)ⁿ");
    ComplexRationalFunction expressed = seq.evaluate(0, 128);
    assertEquals("1 + 0i", expressed.toString());
    seq.evaluate(1, 128, expressed);
    // System.out.println("ff " + expressed.toString());
    assertEquals("(-x+1)/2 + 0i", expressed.toString());

    seq.evaluate(2, 128, expressed);
    assertEquals("(x^2-2*x+1)/4 + 0i", expressed.toString());
    seq.evaluate(3, 128, expressed);
    assertEquals("(-x^3+3*x^2-3*x+1)/8 + 0i", expressed.toString());
    seq.evaluate(-2, 128, expressed);
    assertEquals("4/(x^2-2*x+1) + 0i", expressed.toString());
  }

  public void testRationalIdentityExpression()
  {
    var expressed = ComplexRationalFunction.express("x");
    assertEquals("x + 0i", expressed.toString());
  }

  public void testXOver2()
  {
    var expressed = ComplexRationalFunction.express("x/2");
    assertEquals("(x)/2 + 0i", expressed.toString());
  }

  public void testOneHalfMinusXOver2()
  {
    var expressed = ComplexRationalFunction.express("½-x/2");
    assertEquals("(-x+1)/2 + 0i", expressed.toString());
  }

  /**
   * is(expand(x^2-2*x+1)/4=expand((1/2-x/2)^2)); true
   */
  public void testXToThePowerOfNegativeOne()
  {
    ComplexRationalFunction expressed = ComplexRationalFunction.express("x^(-1)");
    String                  string    = expressed.toString();
    assertEquals("1/(x) + 0i", string);
  }

  public void testXSquaredToThePowerOfNegativeOne()
  {
    var expressed = ComplexRationalFunction.express("(x^2)^(-1)");
    assertEquals("1/(x^2) + 0i", expressed.toString());
  }

  /**
   * is(expand(x^2-2*x+1)/4=expand((1/2-x/2)^2)); true
   */
  public void testOneHalfMinusXOver2Squared()
  {
    var expressed = ComplexRationalFunction.express("(½-x/2)^2");
    assertEquals("(x^2-2*x+1)/4 + 0i", expressed.toString());
  }

  @SuppressWarnings("resource")
  public void testSubToo()
  {
    try ( var a = new ComplexRationalFunction().set(10);
          var b = new ComplexRationalFunction().set(3); var result = new ComplexRationalFunction();)
    {
      a.sub(b, 128, result);
      assertEquals("7 + 0i", result.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testMulToo()
  {

    try ( var three = new ComplexRationalFunction().set(3);
          var four = new ComplexRationalFunction().set(4);
          var result = new ComplexRationalFunction().set(7);)
    {
      three.mul(four, result);
      assertEquals("12 + 0i", result.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testDivToo()
  {

    try ( var three = new ComplexRationalFunction().set(3);
          var four = new ComplexRationalFunction().set(4);
          var result = new ComplexRationalFunction().set(7);)
    {
      three.div(four, result);
      assertEquals("3/4 + 0i", result.toString());
    }
  }

  /**
   * <pre>
   * 
   * pFq([-2,3+1/2,1],[2,4],1/2-x/2) = 1                 +   ( 1 )
   *                                   - 7/8*(1/2 - x/2) +   ( 7/16-7/16*x ) 
   *                                   21/80*(1/2 - x/2)^2   ( 21/320-21/160*x+21/320*x^2 )
   *                                 = 201/320  +
   *                                   49/160*x + 
   *                                   21/320*x^2
   * 
   * </pre>
   */
  public static void testComplexRationalHypergeometricFunctionExpressionRational()
  {
    var context   = new Context();
    var expressed = ComplexRationalFunction.express("pFq([-2,3+1⁄2,1],[2,4],1/2-x/2)");
    ComplexRationalFunction.express("a:1", context);
    ComplexRationalFunction.express("b:-⅞*(½ - x/2)", context);
    ComplexRationalFunction.express("c:21/80*(½ - x/2)²", context);
    ComplexRationalFunction expectedSum = ComplexRationalFunction.express("a()+b()+c()", context);
    // System.out.println(expressed.toString());
    assertEquals("(21*x^2+98*x+201)/320 + 0i", expressed.toString());
    assertEquals(expectedSum, expressed);
  }

  public static void
         testComplexRationalHypergeometricFunctionExpressionRationalWithFunctionsMissingParenthesis()
  {
    Exception thrownException = null;
    try
    {
      var context   = new Context();
      var expressed = ComplexRationalFunction.express("pFq([-2,3+1/2,1],[2,4],½-x/2)");
      ComplexRationalFunction.express("a:1", context);
      ComplexRationalFunction.express("b:-⅞*(½ - x/2)", context);
      ComplexRationalFunction.express("c:21/80*(½ - x/2)²", context);
      ComplexRationalFunction expectedSum = ComplexRationalFunction.express("a+b+c", context);
      assertEquals("(21*x^2+98*x+201)/320", expressed.toString());
      assertEquals(expressed, expectedSum);
    }
    catch (Exception e)
    {
      thrownException = e;
    }
    assertNotNull(thrownException);
    assertEquals(thrownException.getMessage() + Utensils.stackTraceToString(thrownException),
                 CompilerException.class,
                 thrownException.getClass());
    assertEquals("undefined variable reference 'b' at position=3 in expression "
                 + "'a+b+c' since the inderminate variable has already been declared to be 'a'",
                 thrownException.getMessage());
  }

  private ComplexRationalFunction a;
  private ComplexRationalFunction b;
  private ComplexRationalFunction result;
  private int                     prec = 128;

  public static void testSquare()
  {
    try ( ComplexRationalFunction f =
                                    new ComplexRationalFunction("(1+2*ⅈ+3*x+4*ⅈ*x^2)/(5-6*ⅈ*x+7*x^3-8*ⅈ*x^4)");
          ComplexRationalFunction fSquared = f.square(128, new ComplexRationalFunction());
          ComplexFraction point = fSquared.evaluate(new Fraction(23,
                                                                 10),
                                                    new ComplexFraction()))
    {
      assertEquals(0.00173299324387004007955453560959, point.realPart.doubleValue());
      assertEquals(-0.009103093364133974, point.imaginaryPart.doubleValue());
    }
  }

  public static void testMultiplicativeInverse()
  {
    var f   = new ComplexRationalFunction("(1-x)*ⅈ-(x-1)");
    var inv = f.multiplicativeInverse(new ComplexRationalFunction());
    var g   = inv.multiplicativeInverse();
    assertEquals(f, g);
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
      assertEquals(20.181691319585614, y2.realPart.doubleValue());
      assertEquals(106.01069622063524, y2.imaginaryPart.doubleValue());

      assertEquals("(1024*x^12-3024*x^10+256*x^9-1495*x^8-4538*x^7-1459*x^6-2170*x^5-1824*x^4-906*x^3-787*x^2-90*x-75)/(256*x^8+800*x^6+192*x^5+785*x^4+300*x^3+286*x^2+60*x+25) + ((3328*x^11+512*x^10+376*x^9+4120*x^8+516*x^7+424*x^6+664*x^5-60*x^4-28*x^3-416*x^2-120*x-100)/(256*x^8+800*x^6+192*x^5+785*x^4+300*x^3+286*x^2+60*x+25))i",
                   pow.toString());
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
    try ( ComplexRationalFunction a = new ComplexRationalFunction();
          ComplexRationalFunction b = new ComplexRationalFunction();)
    {
      a.realPart.set("3+4*x^2-3*x^4");
      a.imaginaryPart.set("-1+2*x-3*x^3");

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
  }

  public static void testSubtractionMoreThoroughly()
  {
    try ( ComplexRationalFunction a = new ComplexRationalFunction();
          ComplexRationalFunction b = new ComplexRationalFunction();)
    {
      a.realPart.set("3+4*x^2-3*x^4");
      a.imaginaryPart.set("-1+2*x-3*x^3");

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
  }

  public static void testDivisionMoreThoroughly()
  {
    try ( ComplexRationalFunction a = new ComplexRationalFunction();
          ComplexRationalFunction b = new ComplexRationalFunction();)
    {
      a.realPart.set("3+4*x^2-3*x^4");
      a.imaginaryPart.set("-1+2*x-3*x^3");

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
  }

  public static void testAdditionMoreThoroughly()
  {
    try ( ComplexRationalFunction a = new ComplexRationalFunction();
          ComplexRationalFunction b = new ComplexRationalFunction();)
    {
      a.realPart.set("3+4*x^2-3*x^4");
      a.imaginaryPart.set("-1+2*x-3*x^3");

      b.realPart.set("-2-2*x^2-3*x^3");
      b.imaginaryPart.set("1+3*x^2-3*x^3");

      ComplexRationalFunction sum       = a.add(b, new ComplexRationalFunction());
      // System.out.format("(%s)+(%s)=%s\n", a, b, sum);

      Fraction                x         = new Fraction(23,
                                                       100);
      ComplexFraction         aAtx      = a.evaluate(x, new ComplexFraction());
      ComplexFraction         bAtx      = b.evaluate(x, new ComplexFraction());
//    /System.out.format("%s(%s)=%s\n", a, x, aAtx);
      // System.out.format("%s(%s)=%s\n", b, x, bAtx);
      ComplexFraction         aPlusbAtx = aAtx.add(bAtx, new ComplexFraction());
      ComplexFraction         sumAtx    = sum.evaluate(x, new ComplexFraction());
      assertEquals(sumAtx, aPlusbAtx);
    }
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