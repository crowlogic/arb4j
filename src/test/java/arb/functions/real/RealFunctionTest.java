package arb.functions.real;

import static java.lang.Math.pow;

import org.junit.Test;

import arb.*;
import arb.Float;
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

  public static void testBetaFunctionReal()
  {
    var oneOverThirthy = new Fraction(1,
                                      30);
    var oneThirtieth   = RealNullaryFunction.express("Beta(5,2)");
    var val            = oneThirtieth.evaluate(128);
    assertEquals(oneOverThirthy.doubleValue(), val.doubleValue());
  }

  public static void testBetaFunctionRational()
  {
    var oneOverThirthy = new Fraction(1,
                                      30);
    var oneThirtieth   = RationalNullaryFunction.express("Beta(5,2)");
    var val            = oneThirtieth.evaluate(128);
    assertEquals(oneOverThirthy, val);
  }

  public static void testJ0Eigenfunctions()
  {
    assert false : "TODO: determine them.. they aren't equal to the uniformly convergent basis functions, expand the eigenfunctions in terms of the basis then solve for coeffecients and determine pattern";
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


}
