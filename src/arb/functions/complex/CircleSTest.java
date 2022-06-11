package arb.functions.complex;

import arb.*;
import arb.functions.complex.dynamics.NewtonMap;
import arb.functions.complex.dynamics.NewtonMapTest;
import arb.functions.real.RealPart;
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
      assertEquals(0.03920061491160645, z.getReal().doubleValue(), Math.pow(10,-20));

      ComplexRealPart<CircleS> realCircleS = cs.complexRealPart();
      realCircleS.evaluate(πOver2, 1, 256, z);
      assertEquals(0.03920061491160645, z.getReal().doubleValue(), Math.pow(10,-20));

      FoundRoots turningPoints = cs.realPart()
                                   .locateRoots(new RealRootInterval(0,
                                                                     Math.PI),
                                                50,
                                                5000,
                                                5,
                                                256);
     // System.out.println("Located " + turningPoints);
      turningPoints.refine(cs.realPart(), 256, 50, true);
    }
  }
}
