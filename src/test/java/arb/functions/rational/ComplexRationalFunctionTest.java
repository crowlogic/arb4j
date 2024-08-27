package arb.functions.rational;

import arb.ComplexFraction;
import arb.ComplexRationalFunction;
import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.utensils.Utensils;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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
          ComplexRationalFunctionSequence.express("R:n➔(v₍ₙ₎*1/((z/2)^(n)))*pFq([1⁄2-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                                  context);

    var Rtoo =
             ComplexRationalFunctionSequence.express("Rtoo:n➔v₍ₙ₎*(z/2)^(-n)*pFq([1⁄2-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                                     context);

    var x    = R.evaluate(3, 128);
    var xToo = Rtoo.evaluate(3, 128);
    assertEquals("(-6*x^2+15)/(x^3) + 0i", x.toString());
    assertEquals("the negative power of the complex rational function is not being calculated properly",
                 "(-6*x^2+15)/(x^3) + 0i",
                 xToo.toString());
  }

  public void testComplexRationalLommelPolynomialsAsNullary()
  {
    var context = new Context(Real.named("v").set(RealConstants.half),
                              Integer.named("n").set(3));

    var R       =
          ComplexRationalNullaryFunction.express("v₍ₙ₎*(z/2)^(-n)*pFq([1⁄2-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                                 context);
    var x       = R.evaluate();
    assertEquals("(-6*x^2+15)/(x^3) + 0i", x.toString());
  }

  @SuppressWarnings("resource")
  public void testAdd()
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
    System.out.println("ff " + expressed.toString());
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
  public void testSub()
  {
    try ( var a = new ComplexRationalFunction().set(10);
          var b = new ComplexRationalFunction().set(3); var result = new ComplexRationalFunction();)
    {
      a.sub(b, 128, result);
      assertEquals("7 + 0i", result.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testMul()
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
  public void testDiv()
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
    System.out.println(expressed.toString());
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

}
