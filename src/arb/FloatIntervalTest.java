package arb;

import junit.framework.TestCase;

public class FloatIntervalTest extends
                               TestCase
{
 
  
  public static void testPrint()
  {
    System.loadLibrary("arb");
    FloatInterval interval = new FloatInterval(-3,
                                               3);
    System.out.println(interval);
  }
}
