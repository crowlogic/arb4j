package arb.functions.real.dynamics;

import static java.lang.System.out;

import arb.*;
import arb.functions.complex.CircularS;
import arb.functions.real.RealPart;
import junit.framework.TestCase;

public class RealNewtonMapTest extends
                               TestCase
{
  Real z = Real.newVector(2);
  Real w = Real.newVector(2);

  @SuppressWarnings("resource")
  public void testS()
  {
    CircularS angle = new CircularS(RealConstants.one,
                                    new Real().set("0.1", 512));
    testIteratedNewtonMap(angle);
    assertEquals(w.get(0).doubleValue(), locateRoot(angle).getReal().doubleValue());

  }

  @SuppressWarnings("resource")
  public void testSOrbit()
  {
    int       prec   = 128;
    Real      h      = new Real().set("0.1", prec);
    CircularS angle  = new CircularS(RealConstants.one,
                                     h);

    Complex   θ      = locateRoot(angle);

    // t = h*e^(i*θ)
    Complex   t      = θ.mul(ComplexConstants.i, prec, new Complex()).exp(prec).mul(h, prec);
    CircularS angle2 = new CircularS(t,
                                     RealConstants.one,
                                     h);
    Complex   θ2     = locateRoot(angle2);
    out.println("θ=" + θ);
    out.println("t=" + t);
    out.println("θ2=" + θ2);
  }

  public Complex locateRoot(CircularS angle)
  {
    RealPart realAngle = new RealPart(angle);
    Roots    root      = realAngle.locateRoots(new RootLocatorOptions(new RealRootInterval(-.8,
                                                                                           -0.7),
                                                                      150,
                                                                      50000,
                                                                      1,
                                                                      512));
    root.refine(realAngle, 256, 100, true);
    System.out.println("root=" + root);
    Complex hmm = new Complex(root.get(0).getReal(new Real(), 128));

    System.out.println("angle(w)=" + angle.evaluate(hmm, 1, 512, new Complex()));
    return hmm;
  }

  public RealPart testIteratedNewtonMap(CircularS angle)
  {
    RealPart      realAngle = new RealPart(angle);
    RealNewtonMap func      = new RealNewtonMap(realAngle,
                                                new Real().set("1", 52));

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
    return realAngle;
  }
}
