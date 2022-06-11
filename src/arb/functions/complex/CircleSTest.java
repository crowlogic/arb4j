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
      assertTrue(z.getReal().doubleValue() == 0.6);

      ComplexRealPart<CircleS> realCircleS = cs.complexRealPart();
      realCircleS.evaluate(πOver2, 1, 256, z);
      assertTrue(z.getReal().doubleValue() == 0.6);

//      RealPart<NewtonMap<ComplexRealPart<CircleS>>> newtonCircleS = new RealPart<NewtonMap<ComplexRealPart<CircleS>>>(nrealCircleS.complexRealPart());
//      newtonCircleS.ev
    }
  }
}
