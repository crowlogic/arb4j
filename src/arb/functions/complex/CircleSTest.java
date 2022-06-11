package arb.functions.complex;

import arb.*;
import junit.framework.TestCase;

public class CircleSTest extends
                         TestCase
{
  public void testCircleS()
  {
    try ( CircleS cs = new CircleS())
    {
      Complex πOver2 = new Complex();
      πOver2.getReal().pi(256).div(2, 256);
      Complex z = cs.evaluate(πOver2, 1, 256, new Complex());
      System.out.println("CircleS(π/2)=" + z);
      assertTrue(z.getReal().doubleValue() == 0.6);
    }
  }
}
