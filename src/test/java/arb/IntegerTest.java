package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexSequence;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegerTest extends
                         TestCase
{

  public static void testNegativePower()
  {
    try ( Integer p = new Integer(3))
    {
      var t = p.pow(new Integer(-3), 128, new Fraction());
      assertEquals(1.0 / 27.0, t.doubleValue());
    }
  }

  public static void testPositivePower()
  {
    try ( Integer p = new Integer(3))
    {
      var t = p.pow(new Integer(3), 128, new Fraction());
      assertEquals(27.0, t.doubleValue());
    }
  }

  public static void testMulIntComplex()
  {
    Context         context = new Context(Integer.named("v").set(42));
    ComplexSequence f       = ComplexSequence.express(null, "t->t*v", context);
    Complex         val     = f.evaluate(3, 128);
    assertEquals(126, val.re().integerValue(new Integer()).getUnsignedValue());

  }

  public static void testPrime()
  {
    long p = Integer.prime(5);
    assertEquals(11, p);
  }

  public void testAscendingFactorial()
  {
    try ( Integer n = new Integer(3))
    {
      Real x = n.ascendingFactorial(RealConstants.half, 128, new Real());
      assertEquals(1.6616754852239212756, x.doubleValue());
    }
  }

  public void testVectorString()
  {
    try ( Integer v = Integer.newVector(3);)
    {
      Integer v0 = v.get(0);
      Integer v1 = v.get(1);
      Integer v2 = v.get(2);
      v0.set(41);
      v1.set(6);
      v2.set(2);
      assertEquals("[41 6 2]", v.toString());
      v.setName("v");
      assertEquals("v=[41 6 2]", v.toString());
    }
  }

  public void testAddComplexToComplex()
  {

    try ( var three = new Integer(3); var four = new Complex(4); var seven = new Complex(7))
    {
      three.add(four, 128, seven);
      assertEquals("7", seven.toString());
    }
  }

  public void testAddRealToComplex()
  {

    try ( Integer three = new Integer(3); Real four = Real.valueOf(4); Complex seven = Complex.valueOf(7);)
    {
      three.add(four, 128, seven);
      assertEquals("7", seven.toString());
    }
  }

  public void testAdd()
  {

    try ( Integer three = new Integer(3); Integer four = new Integer(4); Integer seven = new Integer(7);)
    {
      three.add(four, seven);
      assertEquals("7", seven.toString());
    }
  }

  public void testSub()
  {

    try ( Integer three = new Integer(3); Integer four = new Integer(4); Integer result = new Integer(7);)
    {
      three.sub(four, result);
      assertEquals("-1", result.toString());
    }
  }

  public void testMul()
  {

    try ( Integer three = new Integer(3); Integer four = new Integer(4); Integer result = new Integer(7);)
    {
      three.mul(four, result);
      assertEquals("12", result.toString());
    }
  }

  public void testTwoIntsInOneFractionOut()
  {
    try ( Integer three = new Integer(3); Integer four = new Integer(4); Fraction result = new Fraction();)
    {
      three.div(four, 0, result);
      assertEquals("3⁄4", result.toString());
    }

  }

  public void testDiv()
  {

    try ( Integer three = new Integer(3); Integer four = new Integer(4); Integer result = new Integer(7);)
    {
      three.div(four, result);
      assertEquals("0", result.toString());
    }
  }

  public void testDivRemainder()
  {

    try ( Integer three = new Integer(3); Integer four = new Integer(4); Integer result = new Integer(7);)
    {
      result.remainder = new Integer();
      three.div(four, result);
      assertEquals("0", result.toString());
      assertEquals("3", result.remainder.toString());

    }
  }

  public static void testRisingFactorial()
  {
    try ( Integer five = new Integer("5"); Integer three = new Integer(3);)
    {
      Real twoTen = five.ascendingFactorial(three, 128, new Real());
      assertTrue(twoTen.isExact());
      assertTrue(twoTen.doubleValue() == 210.0);
    }
  }

  public static void testFactorialStatic()
  {
    Real factorialOfFour = Integer.factorial(4, 128, new Real());
    assertTrue(factorialOfFour.isExact());
    assertTrue(factorialOfFour.doubleValue() == 24.0);
  }

  public static void testFactorial()
  {
    try ( Integer four = new Integer(4); Integer factorialOfFour = four.factorial())
    {
      assertTrue(factorialOfFour.getSignedValue() == 24);
      assertTrue(factorialOfFour.getUnsignedValue() == 24);
    }
  }

  public static void testFactorialReal()
  {
    try ( Integer four = new Integer(4); Real factorialOfFour = four.factorial(128, new Real()))
    {
      assertTrue(factorialOfFour.isExact());
      assertTrue(factorialOfFour.doubleValue() == 24.0);
    }
  }

  public static void testSubtraction()
  {
    try ( Integer a = new Integer(10); Integer b = new Integer(3); Integer result = new Integer();)
    {
      a.sub(b, 128, result);
      assertEquals(7, result.getSignedValue());
    }
  }

  public static void testSubtractionSelfAliased()
  {
    try ( Integer a = new Integer(10); Integer b = new Integer(3);)
    {
      a.sub(b, 128);
      assertEquals(7, a.getSignedValue());
    }
  }

  public static void testSetFromStringAndGetSignedAndUnsignedIntegerValues()
  {
    try ( Integer bfi = new Integer())
    {
      bfi.set("1000000");
      assertEquals(1000000, bfi.getSignedValue());
      assertEquals(1000000, bfi.getUnsignedValue());
    }

  }

}
