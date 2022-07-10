package arb;

import junit.framework.*;

public class FloatIntervalTest extends
                               TestCase
{
 
  
  public static void testPrint()
  {
    FloatInterval interval = new FloatInterval(-3,
                                               3);
    System.out.println(interval);
  }
}
