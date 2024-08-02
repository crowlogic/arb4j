package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RationalNullaryFunction;
import arb.functions.sequences.RationalFunctionSequence;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RationalFunctionTest
                                  extends
                                  TestCase
{

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
  
      var              rationalFunctional = RationalFunctionSequence.express("((1/2)-(z/2))^n" );
      RationalFunction expressed          = rationalFunctional.evaluate(0, 128, new RationalFunction());
      assertEquals("1", expressed.toString());
    
  }

  public void testRationalIdentityExpression()
  {
    var              rationalFunctional = RationalNullaryFunction.express("x");
    RationalFunction expressed          = rationalFunctional.evaluate(128, new RationalFunction());
    assertEquals("x", expressed.toString());
  }

  public void testXOver2()
  {
    var              rationalFunctional = RationalNullaryFunction.express("x/2");
    RationalFunction expressed          = rationalFunctional.evaluate(128, new RationalFunction());
    assertEquals("(x)/2", expressed.toString());
  }

  public void testOneHalfMinusXOver2()
  {
    var              rationalFunctional = RationalNullaryFunction.express("1/2-x/2");
    RationalFunction expressed          = rationalFunctional.evaluate(128, new RationalFunction());
    assertEquals("(-x+1)/2", expressed.toString());
  }

  /**
   * is(expand(x^2-2*x+1)/4=expand((1/2-x/2)^2)); true
   */
  public void testXToThePowerOfNegativeOne()
  {
    var              rationalFunctional = RationalNullaryFunction.express("x^(-1)");
    RationalFunction expressed          = rationalFunctional.evaluate(128, new RationalFunction());
    assertEquals("1/(x)", expressed.toString());
  }

  public void testXSquaredToThePowerOfNegativeOne()
  {
    var              rationalFunctional = RationalNullaryFunction.express("(x^2)^(-1)");
    RationalFunction expressed          = rationalFunctional.evaluate(128, new RationalFunction());
    assertEquals("1/(x^2)", expressed.toString());
  }

  /**
   * is(expand(x^2-2*x+1)/4=expand((1/2-x/2)^2)); true
   */
  public void testOneHalfMinusXOver2Squared()
  {
    var              rationalFunctional = RationalNullaryFunction.express("(1/2-x/2)^2");
    RationalFunction expressed          = rationalFunctional.evaluate(128, new RationalFunction());
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

}
