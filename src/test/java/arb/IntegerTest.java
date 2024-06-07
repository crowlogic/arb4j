package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegerTest extends
                         TestCase
{

  public static void testRisingFactorial()
  {
    try ( Integer five = new Integer("5"); Integer three = new Integer(3);)
    {
      Real twoTen = five.risingFactorial(three, 128, new Real());
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
