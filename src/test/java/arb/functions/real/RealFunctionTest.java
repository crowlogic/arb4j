package arb.functions.real;

import static java.lang.Math.pow;
import static java.lang.System.out;

import org.junit.Test;

import arb.*;
import arb.Float;
import arb.functions.complex.numbertheoretic.ZFunction;
import junit.framework.TestCase;

@SuppressWarnings({"resource","unused"})
public class RealFunctionTest extends
                              TestCase
{

  public static void main(String args[])
  {
    RealFunctionTest rft = new RealFunctionTest();
    rft.testLocateRootsSine();

  }

  private static final int prec         = 256;
  private RealFunction     sineFunction = new RealSineFunction()
                                        {
                                          @Override
                                          public Real evaluate(Real z, int order, int prec, Real w)
                                          {
                                            super.evaluate(z, order, prec, w);
                                            return w;
                                          }
                                        };

  public void testSubFunction()
  {
    RealFunction f1 = (x, order, bits, result) -> result.set(x);
    {
      RealFunction f2     = (x, order, bits, result) -> x.mul(x, bits, result);

      RealFunction fSub   = f1.sub(f2);

      Real         x      = new Real("2",
                                     128);
      Real         result = new Real();

      fSub.evaluate(x, 0, 64, result);
      assertEquals(-2.0, result.doubleValue());
    }
  }

  public void testDivFunction()
  {
    RealFunction f1 = (x, order, bits, result) -> result.set(x);
    {
      RealFunction f2     = (x, order, bits, result) -> x.mul(x, bits, result);

      RealFunction fDiv   = f1.div(f2);

      Real         x      = new Real("2",
                                     128);
      Real         result = new Real();

      fDiv.evaluate(x, 0, 64, result);
      assertEquals(0.5, result.doubleValue());
    }
  }

  public void testAddFunction()
  {
    RealFunction f1 = (x, order, bits, result) -> result.set(x);
    {
      RealFunction f2     = (x, order, bits, result) -> x.mul(x, bits, result);

      RealFunction fAdd   = f1.add(f2);

      Real         x      = new Real("2",
                                     128);
      Real         result = new Real();

      fAdd.evaluate(x, 0, 64, result);
      assertEquals(6.0, result.doubleValue());
    }
  }

  public void testMulFunction()
  {
    RealFunction f1 = (x, order, bits, result) -> result.set(x);
    {
      RealFunction f2     = (x, order, bits, result) -> x.mul(x, bits, result);

      RealFunction fMul   = f1.mul(f2);

      Real         x      = new Real("2",
                                     128);
      Real         result = new Real();

      fMul.evaluate(x, 0, 64, result);
      assertEquals(8.0, result.doubleValue());
    }
  }

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


  @Test
  public void testLocateRootsHardyZ()
  {
    RealFunction       f               = new RealHolomorphicPart<>(new ZFunction()).asRealFunction(new Complex());
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

    assertEquals(192, roots.evals);
    assertEquals(3, roots.size());
    RealRootInterval first     = roots.get(0);
    Real             firstRoot = first.getReal(prec, new Real());
    assertEquals(14.13125, firstRoot.getMid().doubleValue(RoundingMode.Ceiling), pow(10, -30));
    assertEquals(first.status, FloatInterval.RootStatus.RootLocated);

    roots.refine(f, prec, 40, true);

    assertEquals(14.134725141734693, roots.get(0).getReal(256, new Real()).doubleValue(RoundingMode.Down), 0);
    assertEquals(2, roots.unknownCount);
    assertEquals(1, roots.foundCount);
  }

  @Test
  public void testNewtonConvergenceFactor()
  {
    try ( Real jet = Real.newVector(3); FloatInterval interval = new FloatInterval(0.2,
                                                                                   0.3))
    {
      Real region = interval.getReal(128, new Real());
      Float C = sineFunction.getNewtonConvergenceFactor(region, jet, 128, new Float());
      assertEquals(0.0773340631858446, C.doubleValue(), pow(10, -10));
    }
  }
}
