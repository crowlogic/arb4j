package arb.geometry.curves;

import static arb.RealConstants.half;
import static java.lang.System.out;

import arb.*;
import arb.exceptions.NotDifferentiableException;
import arb.functions.RealToComplexFunction;
import junit.framework.TestCase;

@SuppressWarnings("unused")
public class LemniscateTest extends
                            TestCase
{
  public static void testLemniscate()
  {
    try ( Lemniscate lem = new Lemniscate())
    {
      Complex w = lem.evaluate(ComplexConstants.one.getReal(), 2, 555, Complex.newVector(2));
      assertEquals(0.6326452950883672, w.getReal().doubleValue(), 4.31E-21);
      assertEquals(0.5323526594920907, w.getImag().doubleValue(), 3.53E-22);
      assertEquals(-1.3220770748926538, w.get(1).getReal().doubleValue(), 2.02E-21);
      assertEquals(-0.7706697864689901, w.get(1).getImag().doubleValue(), 1.23E-21);
      /**
       * l(1)=[[+0.44734777824274882640 +/- 4.31e-21] [+0.37643017550955035312 +/-
       * 3.53e-22]i, l'(1)=[-0.93484966490787055089 +/- 2.02e-21]
       * [-0.54494583206781146610 +/- 1.23e-21]i]
       */
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

  public static void testDerivative() throws NotDifferentiableException
  {
    try ( Lemniscate l = new Lemniscate(); Complex tmp = new Complex())
    {
      RealToComplexFunction dl     = l.differential();

      try ( RealToComplexFunction absdl = (t, order, prec, w) ->
      {
        dl.evaluate(t, order, prec, tmp).abs(prec, w.getReal());
        return w;
      })
      {
        Complex l1     = l.evaluate(ComplexConstants.one.getReal(), 2, 256, Complex.newVector(2));
        Complex dl1    = dl.evaluate(ComplexConstants.one.getReal(), 1, 256, Complex.newVector(1));
        Complex absdl1 = absdl.evaluate(ComplexConstants.one.getReal(), 1, 256, new Complex());

        assertTrue(l1.get(1).sub(dl1, 256, new Complex()).containsZero());
      }
    }
    catch (NotDifferentiableException e)
    {
      throw e;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }

  }

  /**
   * test integration 2
   * 
   * @throws NotDifferentiableException
   */
  @SuppressWarnings("resource")
  public static void testIntegration() throws NotDifferentiableException
  {
    int                   prec     = 256;

    Lemniscate            f        = new Lemniscate();
    RealToComplexFunction df       = f.differential();
    RealToComplexFunction absdf    = (t, order, p, w) ->
                                   {
                                     df.evaluate(t, order, prec, w).abs(prec, w.getReal());
                                     w.getImag().zero();
                                     return w;
                                   };

    Complex               integral = new Complex();
    Magnitude             absErr   = new Magnitude();
    absErr.set(Math.pow(10, -75));
    Real a = new Real();
    Real b = new Real();
    b.π(prec).div(2, prec, b);
    IntegrationOptions opts             = new IntegrationOptions();
    // opts.verbose = true;
    Complex            abslprimeonehalf = absdf.evaluate(half, 1, prec, new Complex());
    opts.useHeap = false;
    absdf.integrate(a, b, prec, absErr, opts, prec, integral);
    assertTrue(integral.getImag().isZero());
    integral.printPrecision           = true;
    integral.getReal().printPrecision = true;
    assertTrue(integral.getImag().isZero());
    double integralUncertainty = integral.getReal().getRad().doubleValue();
    assertEquals(2.62205755429211981046483958989111941368275495,
                 integral.getReal().getMid().doubleValue(),
                 integralUncertainty);
    Real arcLengthPiOverTwo = f.getArcLength(new Real().π(prec).div(2, prec), prec, new Real());
    arcLengthPiOverTwo.printPrecision = true;
    integral.getReal().printPrecision = true;
    assertTrue(integralUncertainty < 2.02 * Math.pow(10, -75));
    assertEquals(integral.getReal().doubleValue(), arcLengthPiOverTwo.doubleValue(), Math.pow(10, -18));

  }
}
