package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.RealRootInterval;
import arb.RootLocatorOptions;
import arb.Roots;
import arb.RoundingMode;
import junit.framework.TestCase;

public class CircleSTest extends
                         TestCase
{
  public void testCircleS()
  {
    try ( CircularSFunction cs = new CircularSFunction(RealConstants.one,
                                                             RealConstants.one))
    {
      Complex πOver2 = new Complex();
      πOver2.getReal().π(256).div(2, 256);
      Complex z = cs.evaluate(πOver2, 3, 256, Complex.newVector(3));
      System.out.println("CircularS(π/2)=" + z);
      assertEquals(0.6, z.getReal().doubleValue(), Math.pow(10, -20));
      Real z1i = z.get(1).getImag();
      assertEquals(0.64, z1i.getMid().doubleValue(RoundingMode.Near), z1i.getRad().doubleValue());
      Real zr2 = z.get(2).getReal();
      assertEquals(0.128, zr2.getMid().doubleValue(RoundingMode.Near), zr2.getRad().doubleValue());

      cs.evaluate(πOver2, 3, 256, z);
      assertEquals(0.6, z.getReal().doubleValue(), Math.pow(10, -20));

      RootLocatorOptions rootLocatorOptions = new RootLocatorOptions(new RealRootInterval(0.5,
                                                                                          0.6),
                                                                     50,
                                                                     5000,
                                                                     5,
                                                                     256);
      Roots              turningPoints      = cs.realPart().locateRoots(rootLocatorOptions);
      System.out.println("Located " + turningPoints);
      turningPoints.refine(cs.realPart(), 256, 50, true);
      System.out.println("Refined " + turningPoints);
    }
  }
}
