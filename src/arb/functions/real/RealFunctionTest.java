package arb.functions.real;

import static java.lang.Math.pow;
import static java.lang.System.out;
import static org.junit.Assert.assertEquals;

import org.junit.Test;

import arb.*;
import arb.Float;
import arb.functions.complex.numbertheoretic.ZFunction;

public class RealFunctionTest
{

  private static final int prec         = 256;
  private RealFunction     sineFunction = new RealSineFunction()
                                        {
                                          @Override
                                          public Real evaluate(Real z, int order, int prec, Real w)
                                          {
                                            super.evaluate(z, order, prec, w);
                                            out.println("sin(" + z + ")=" + w);
                                            return w;
                                          }
                                        };

  @Test
  public void testLocateRootsSine()
  {
    RealSineFunction   sineFunction = new RealSineFunction();
    RootLocatorOptions config       = new RootLocatorOptions(new RealRootInterval(3,
                                                                                  3.6),
                                                             50,
                                                             20000,
                                                             10,
                                                             256);
    Roots              roots        = sineFunction.locateRoots(config);
    roots.refine(sineFunction, 256, 40, true);
  }

  /**
   * TODO: save the args to pass to real_roots.c to do the same thing
   * 
   */
  @Test
  public void testLocateRootsHardyZ()
  {
    RealFunction       f               = new RealPart(new ZFunction());
    RealRootInterval   initialInterval = new RealRootInterval(14,
                                                              14.2);
    int                maxdepth        = 11;
    int                maxevals        = 5000;
    int                maxfound        = 1;
    int                prec            = 256;
    RootLocatorOptions config          = new RootLocatorOptions(initialInterval,
                                                                maxdepth,
                                                                maxevals,
                                                                maxfound,
                                                                prec);
    Roots              roots           = f.locateRoots(config);
    System.out.println("rootsBeforeRefinement=" + roots);

    assertEquals(192, roots.evals);
    assertEquals(3, roots.size());
    RealRootInterval first     = roots.get(0);
    Real             firstRoot = first.getReal(new Real(), prec);
    assertEquals(14.13125, firstRoot.getMid().doubleValue(RoundingMode.Ceiling), pow(10, -30));
    assertEquals(first.status, FloatInterval.RootStatus.RootLocated);

    roots.refine(f, prec, 40, true);
    System.out.println("rootsAfterRefinement=" + roots);

    assertEquals(14.134725141734693, roots.get(0).getReal(new Real(), 256).doubleValue(RoundingMode.Down), 0);
    assertEquals(2, roots.unknownCount);
    assertEquals(1, roots.foundCount);
  }

  @Test
  public void testNewtonConvergenceFactor()
  {
    try ( Real jet = Real.newVector(3); FloatInterval interval = new FloatInterval(0.2,
                                                                                   0.3))
    {
      out.println("real.allocatedBytes=" + jet.getAllocatedBytes());
      System.out.println("interval=" + interval);
      Real region = interval.getReal(new Real(), 128);
      out.println("mag=" + region.getRad());
      System.out.println("region=" + region);
      Float C = sineFunction.getNewtonConvergenceFactor(region, jet, 128, new Float());
      System.out.println("C=" + C.doubleValue());
      assertEquals(0.0773340631858446, C.doubleValue(), pow(10, -10));
    }
  }
}
