package arb.functions.real;

import static java.lang.Math.pow;

import org.junit.Test;

import arb.*;
import arb.Float;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.rational.RationalNullaryFunction;
import junit.framework.TestCase;

@SuppressWarnings(
{ "resource", "unused" })
/*
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link
 * TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class RealFunctionTest extends
                              TestCase
{

  public static void testBetaFunction()
  {
    var oneOverThirthy = new Fraction(1,
                                      30);
    var oneThirtieth   = RationalNullaryFunction.express("Beta(5,2)");
    assertEquals(oneOverThirthy, oneThirtieth);
  }

  public static void testJ0Eigenfunctions()
  {
    assert false : "TODO: determine them.. they aren't equal to the uniformly convergent basis functions, expand the eigenfunctions in terms of the basis then solve for coeffecients and determine pattern";
  }

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
  public void testNewtonConvergenceFactor()
  {
    try ( Real jet = Real.newVector(3); FloatInterval interval = new FloatInterval(0.2,
                                                                                   0.3))
    {
      Real  region = interval.getReal(128, new Real());
      Float C      = sineFunction.getNewtonConvergenceFactor(region, jet, 128, new Float());
      assertEquals(0.0773340631858446, C.doubleValue(), pow(10, -10));
    }
  }
}
