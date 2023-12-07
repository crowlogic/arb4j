package arb;

import junit.framework.TestCase;

public class IntegerTest extends
                         TestCase
{

  public void testSetAndGet()
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
