package arb;

import static java.lang.System.out;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealRationalNullaryFunction;
import arb.functions.sequences.Sequence;
import junit.framework.TestCase;

/**
 * The set of rational functions over a field K is a field, the field of
 * fractions of the ring of the polynomial functions over K.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealRationalFunctionTest
                                      extends
                                      TestCase
{

  public void testRealRationalJ0EigenfunctionSequence()
  {
    var expr = RealRationalFunction.parseSequence("Ψ", "n➔½*√(2*(4*n+1)/y)*(-1)ⁿ*J(2*n+½,y)");
    System.out.println(expr.syntaxTextTree());
    var                  f = expr.instantiate();
    RealRationalFunction g = f.evaluate(0, 128);

    System.out.format("f=%s\n", f);
    System.out.format("g=%s\n", g);

  }

  public void testPositivePower()
  {
    int                  bits      = 128;
    var                  poly      = RealRationalNullaryFunction.express("x^(2)");
    RealRationalFunction expressed = poly.evaluate(bits, new RealRationalFunction());
    assertEquals("x²", expressed.value.toString());
    assertFalse(expressed.value.hasRemainder());
  }

  public void testNegativePower()
  {
    int                  bits      = 128;
    var                  poly      = RealRationalNullaryFunction.express("x^(-2)");
    RealRationalFunction expressed = poly.evaluate(bits, new RealRationalFunction());
    assertEquals("1/x²", expressed.toString());
  }

  public void testHypergeometricRealRationalFunctionExpression()
  {
    int                  bits                      = 128;
    var                  rationalNullaryFunction   = RealRationalNullaryFunction.express("pFq([-2,3.5,1],[2,4],½-x/2)");
    RealRationalFunction expressedRationalFunction = rationalNullaryFunction.evaluate(bits,
                                                                                      new RealRationalFunction());
    assertEquals("0.065625*x² + 0.30625*x + 0.628125", expressedRationalFunction.value.toString());
    assertFalse(expressedRationalFunction.value.hasRemainder());
  }

  public void testLommelRationalFunctionSequence()
  {
    Real    v          = new Real().set(RealConstants.half).setName("v");
    Context context    = new Context(v);
    var     expression = RealRationalFunction.parseSequence("R",
                                                            "n->(v₍ₙ₎/(z/2)ⁿ)*pFq([½-n/2,-n/2],[v,-n,1-v-n],-(z²))",
                                                            context);
    Sequence<RealRationalFunction> f  = expression.instantiate();
    RealRationalFunction           f0 = f.evaluate(2, 128);
    System.out.println("f0=" + f0);
    double fzero = f0.eval(2.3);
    System.out.println("f(2.3)=" + fzero);
  }

  public void testAscendingFactorial()
  {
    assert false : "test that pochhammer(v, m)/(z/2)^m = 15/z^3";
  }
  public void testReduce()
  {
    try ( RealRationalFunction f = new RealRationalFunction())
    {
      f.value.remainder = new RealPolynomial();
      f.value.remainder.set(1);
      f.value.remainder.shiftLeft(2);
      f.value.divisor = new RealPolynomial();
      f.value.divisor.set(1);
      f.value.divisor.shiftLeft(2);
      // System.out.println("f=" + f);
      assertEquals(1.0, f.eval(2.3));

      f.reduce(128);
      // System.out.println("f=" + f);
      assertEquals(1.0, f.eval(2.3));
    }
  }

  public void testDivisionWithRemainder()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xOverXSquared = new RealRationalFunction();
      x.div(xSquared, 128, xOverXSquared);

      assertEquals(x.value, xOverXSquared.value.remainder);
      assertEquals(xSquared.value, xOverXSquared.value.divisor);
      assertTrue(xOverXSquared.value.isZero());
    }
  }

  public void testAddXPlusXSquaredWithNoRemainder()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xPlusXSquared = new RealRationalFunction();
      x.add(xSquared, 128, xPlusXSquared);

      RealPolynomial shouldBe = new RealPolynomial(3);
      shouldBe.set(1, 1);
      shouldBe.set(2, 1);
      assertEquals(shouldBe, xPlusXSquared.value);
      assertEquals(xPlusXSquared.value.divisor, RealPolynomialConstants.one);
      assertTrue(xPlusXSquared.value.remainder.isZero());
    }
  }

  public void testAddXPlusXSquaredWithRemainderOnLHS()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);
      x.value.setRemainder(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xPlusXSquared = new RealRationalFunction();
      x.add(xSquared, 128, xPlusXSquared);

      RealPolynomial shouldBe = new RealPolynomial(3);
      shouldBe.set(1, 1);
      shouldBe.set(2, 1);
      assertEquals(shouldBe, xPlusXSquared.value);
      assertEquals(xPlusXSquared.value.divisor, RealPolynomialConstants.one);
      assertTrue(xPlusXSquared.value.remainder.equals(RealPolynomialConstants.one));
    }
  }

  public void testAddXPlusXSquaredWithRemainderOnLHSAndPolynomialRemainderOnRHS()
  {
    try ( RealRationalFunction xPlus1 = new RealRationalFunction())
    {
      xPlus1.value.set(1).shiftLeft(1);
      xPlus1.value.setRemainder(1);

      RealRationalFunction xSquaredPlusx = new RealRationalFunction();
      xSquaredPlusx.value.set(1).shiftLeft(2);
      xSquaredPlusx.value.setRemainder(0).set(1, 1);

      // out.format("a=%s\n b=%s\n", xPlus1, xSquaredPlusx);
      RealRationalFunction xPlus1TimesXSquaredPlusX = new RealRationalFunction();
      xPlus1.add(xSquaredPlusx, 128, xPlus1TimesXSquaredPlusX);
      // out.format("xPlus1TimesXSquaredPlusX=%s\n", xPlus1TimesXSquaredPlusX);
      RealPolynomial shouldBe = new RealPolynomial(3);
      shouldBe.set(0, 0);
      shouldBe.set(1, 2);
      shouldBe.set(2, 1);
      shouldBe.setRemainder(1);
      assertEquals(shouldBe, xPlus1TimesXSquaredPlusX.value);
      assertEquals(xPlus1TimesXSquaredPlusX.value.divisor, RealPolynomialConstants.one);
      assertEquals(RealPolynomialConstants.one, xPlus1TimesXSquaredPlusX.value.remainder);

      xPlus1TimesXSquaredPlusX.reduce(128);
      shouldBe = new RealPolynomial(3);
      shouldBe.set(0, 1);
      shouldBe.set(1, 2);
      shouldBe.set(2, 1);
      assertEquals(shouldBe, xPlus1TimesXSquaredPlusX.value);
      assertEquals(null, xPlus1TimesXSquaredPlusX.value.divisor);
      assertEquals(null, xPlus1TimesXSquaredPlusX.value.remainder);

    }
  }

  public void testSubtractionWithoutRemainder()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xMinusXSquared = new RealRationalFunction();
      x.sub(xSquared, 128, xMinusXSquared);

      RealPolynomial shouldBe = new RealPolynomial(2);
      shouldBe.set(1, 1);
      shouldBe.set(2, -1);
      assertEquals(shouldBe, xMinusXSquared.value);
      assertEquals(xMinusXSquared.value.divisor, RealPolynomialConstants.one);
      assertTrue(xMinusXSquared.value.remainder.isZero());
    }
  }

  public void testSubtractionWithRemainderOnTheLHS()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);
      x.value.setRemainder(2);
      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xMinusXSquared = new RealRationalFunction();
      x.sub(xSquared, 128, xMinusXSquared);

      RealPolynomial shouldBe = new RealPolynomial(2);
      shouldBe.set(1, 1);
      shouldBe.set(2, -1);
      assertEquals(shouldBe, xMinusXSquared.value);
      assertEquals(xMinusXSquared.value.divisor, RealPolynomialConstants.one);
      assertEquals(x.value.remainder, xMinusXSquared.value.remainder);
    }
  }

  public void testSubtractionWithRemainderOnTheLHSAndRHS()
  {
    try ( RealRationalFunction xPlus2 = new RealRationalFunction())
    {
      xPlus2.value.set(1).shiftLeft(1);
      xPlus2.value.setRemainder(2);
      RealRationalFunction xSquaredPlus1 = new RealRationalFunction();
      xSquaredPlus1.value.set(1).shiftLeft(2);
      xSquaredPlus1.value.setRemainder(1);
      RealRationalFunction xPlus2MinusXPlus1Squared = new RealRationalFunction();
      xPlus2.sub(xSquaredPlus1, 128, xPlus2MinusXPlus1Squared);

      RealPolynomial shouldBe = new RealPolynomial(2);
      shouldBe.set(1, 1);
      shouldBe.set(2, -1);
      assertEquals(shouldBe, xPlus2MinusXPlus1Squared.value);
      assertEquals(xPlus2MinusXPlus1Squared.value.divisor, RealPolynomialConstants.one);
      assertEquals(RealPolynomialConstants.one, xPlus2MinusXPlus1Squared.value.remainder);

    }
  }

  public void testMul()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xTimesXSquared = new RealRationalFunction();
      x.mul(xSquared, 128, xTimesXSquared);

      RealPolynomial shouldBe = new RealPolynomial(3);
      shouldBe.set(3, 1);
      assertEquals(shouldBe, xTimesXSquared.value);
      assertEquals(xTimesXSquared.value.divisor, RealPolynomialConstants.one);
      assertTrue(xTimesXSquared.value.remainder.isZero());
    }
  }

  public void testPow()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);

      Integer two = new Integer();
      two.set(2);

      RealRationalFunction xSquared = new RealRationalFunction();
      x.pow(two, 128, xSquared);

      out.println("x^2=" + xSquared);
      RealPolynomial shouldBe = new RealPolynomial(2);
      shouldBe.set(2, 1);
      assertEquals(shouldBe, xSquared.value);
      assertEquals(xSquared.value.divisor, RealPolynomialConstants.one);
      assertTrue(xSquared.value.remainder.isZero());
    }
  }

  public void testMulWithRemainderOnLHS()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);
      x.value.setRemainder(1);
      x.value.setDivisor(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xTimesXSquared = new RealRationalFunction();
      x.mul(xSquared, 128, xTimesXSquared);

      RealPolynomial xCubed = new RealPolynomial(3);
      xCubed.set(3, 1);

      assertEquals(xCubed, xTimesXSquared.value);
      assertEquals(xTimesXSquared.value.divisor, RealPolynomialConstants.one);
      assertEquals(xSquared.value, xTimesXSquared.value.remainder);
      assertEquals(xCubed, xTimesXSquared.value);
    }

  }

}
