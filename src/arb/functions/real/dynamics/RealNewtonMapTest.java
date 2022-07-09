package arb.functions.real.dynamics;

import arb.*;
import arb.functions.complex.*;
import arb.functions.real.*;
import junit.framework.*;

public class RealNewtonMapTest extends
                               TestCase
{
  @SuppressWarnings("resource")
  public static void testS()
  {
    CircularS     angle     = new CircularS(Constants.ONE,
                                            new Real().set("0.1", 512));
    RealPart      realAngle = new RealPart(angle);
    RealNewtonMap func      = new RealNewtonMap(realAngle,
                                                new Real().set("1", 52));
    Real          z         = Real.newVector(2);
    Real          w         = Real.newVector(2);
    z.set("-0.75", 128);
    for (int i = 0; i < 20; i++)
    {
      System.out.println("w=" + w);

      func.evaluate(z, 2, 128 * (i + 1), w);
      w.printPrecision = true;
      System.out.println("w=" + w);
      z.set(w);
    }
    System.out.println("w=" + w);
    System.out.println("angle(w)=" + angle.evaluate(new Complex(w), 1, 512, new Complex()));
    Roots root = realAngle.locateRoots(new RootLocatorConfiguration(new RealRootInterval(-.8,
                                                                                              -0.7),
                                                                         150,
                                                                         50000,
                                                                         1,
                                                                         512));
    root.refine(realAngle, 256, 100, true);
    System.out.println("root=" + root);
    Complex hmm = new Complex(root.get(0).getReal(new Real(), 128));

    System.out.println("angle(w)=" + angle.evaluate(hmm, 1, 512, new Complex()));
    assertEquals(w.get(0).doubleValue(), hmm.getReal().doubleValue());

  }
}
