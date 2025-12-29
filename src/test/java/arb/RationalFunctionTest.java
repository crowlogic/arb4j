package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.functions.rational.RationalFunctionSequence;
import arb.utensils.Utensils;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RationalFunctionTest extends
                                  TestCase
{

  public static void testEvaluateWithFraction()
  {
    try ( var f = new RationalFunction())
    {
      f.set("(-6*x^2+15)/(x^3)");
      assertEquals("(-6*x^2+15)/(x^3)", f.toString());
      var x = new Fraction();
      x.set("34⁄12");
      Fraction y = f.evaluate(x, 128, new Fraction());
      assertEquals(x.set("-7164⁄4913"), y);
    }

  }

  @SuppressWarnings("resource")
  public void testAdd()
  {
    try ( var three = new RationalFunction().set(3); var four = new RationalFunction().set(4);
          var seven = new RationalFunction().set(7);)
    {
      three.add(four, seven);
      assertEquals("7", seven.toString());
    }
  }

  public void testInitAndToString()
  {
    try ( var f = new RationalFunction())
    {
      var numerator   = f.getNumerator();

      var denominator = f.getDenominator();
      assertEquals("0", numerator.toString());
      assertEquals("1", denominator.toString());
    }

  }

  public void testPowers()
  {

    var              seq       = RationalFunctionSequence.express("n➔(½-z/2)ⁿ");
    RationalFunction expressed = seq.evaluate(0, 128);
    assertEquals("1", expressed.toString());
    seq.evaluate(1, 128, expressed);
    assertEquals("(-x+1)/2", expressed.toString());
    seq.evaluate(2, 128, expressed);
    assertEquals("(x^2-2*x+1)/4", expressed.toString());
    seq.evaluate(3, 128, expressed);
    assertEquals("(-x^3+3*x^2-3*x+1)/8", expressed.toString());
    seq.evaluate(-2, 128, expressed);
    assertEquals("4/(x^2-2*x+1)", expressed.toString());
  }

  public void testRationalIdentityExpression()
  {
    var expressed = RationalFunction.express("x");
    assertEquals("x", expressed.toString());
  }

  public void testXOver2()
  {
    var expressed = RationalFunction.express("x/2");
    assertEquals("(x)/2", expressed.toString());
  }

  public void testOneHalfMinusXOver2()
  {
    var expressed = RationalFunction.express("½-x/2");
    assertEquals("(-x+1)/2", expressed.toString());
  }

  /**
   * is(expand(x^2-2*x+1)/4=expand((1/2-x/2)^2)); true
   */
  public void testXToThePowerOfNegativeOne()
  {
    RationalFunction expressed = RationalFunction.express("x^(-1)");
    assertEquals("1/(x)", expressed.toString());
  }

  public void testXSquaredToThePowerOfNegativeOne()
  {
    var expressed = RationalFunction.express("(x^2)^(-1)");
    assertEquals("1/(x^2)", expressed.toString());
  }

  /**
   * is(expand(x^2-2*x+1)/4=expand((1/2-x/2)^2)); true
   */
  public void testOneHalfMinusXOver2Squared()
  {
    var expressed = RationalFunction.express("(½-x/2)^2");
    assertEquals("(x^2-2*x+1)/4", expressed.toString());
  }

  @SuppressWarnings("resource")
  public void testSub()
  {
    try ( var a = new RationalFunction().set(10); var b = new RationalFunction().set(3);
          var result = new RationalFunction();)
    {
      a.sub(b, 128, result);
      assertEquals("7", result.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testMul()
  {

    try ( var three = new RationalFunction().set(3); var four = new RationalFunction().set(4);
          var result = new RationalFunction().set(7);)
    {
      three.mul(four, result);
      assertEquals("12", result.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testDiv()
  {

    try ( var three = new RationalFunction().set(3); var four = new RationalFunction().set(4);
          var result = new RationalFunction().set(7);)
    {
      three.div(four, result);
      assertEquals("3/4", result.toString());
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
  public static void testHypergeometricFunctionExpressionRational()
  {
    var context   = new Context();
    var expressed = RationalFunction.express("pFq([-2,3+1⁄2,1],[2,4],1/2-x/2)");
    RationalFunction.express("a:1", context);
    RationalFunction.express("b:-⅞*(½ - x/2)", context);
    RationalFunction.express("c:21/80*(½ - x/2)²", context);
    RationalFunction expectedSum = RationalFunction.express("a()+b()+c()", context);
    assertEquals("(21*x^2+98*x+201)/320", expressed.toString());
    assertEquals(expectedSum, expressed);
  }

  public static void testHypergeometricFunctionExpressionRationalWithFunctionsMissingParenthesis()
  {
    Exception thrownException = null;
    try
    {
      var context   = new Context();
      var expressed = RationalFunction.express("pFq([-2,3+1/2,1],[2,4],1/2-x/2)");
      RationalFunction.express("a:1", context);
      RationalFunction.express("b:-⅞*(½ - x/2)", context);
      RationalFunction.express("c:21/80*(½ - x/2)²", context);
      RationalFunction expectedSum = RationalFunction.express("a+b+c", context);
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
  }

}
