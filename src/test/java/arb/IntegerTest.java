package arb;

import junit.framework.TestCase;

public class IntegerTest extends
                         TestCase
{

  public void testInit()
  {
    try ( Integer possiblyGargantuanInteger = new Integer())
    {
        System.out.println( possiblyGargantuanInteger );
        possiblyGargantuanInteger.set("1000000");
        System.out.println( possiblyGargantuanInteger );        
    }
    
  }

}
