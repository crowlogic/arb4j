package arb;

import junit.framework.TestCase;

public class IntegerTest extends
                         TestCase
{

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
      System.out.println(bfi);
      bfi.set("1000000");
      System.out.println(bfi);
      assertEquals(1000000, bfi.getSignedValue());
      assertEquals(1000000, bfi.getUnsignedValue());
    }

  }

}
