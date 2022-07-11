package arb.curves;

import static arb.RealConstants.*;
import static java.lang.System.*;

import arb.*;
import arb.exceptions.*;
import arb.functions.*;
import junit.framework.*;

public class LemniscateTest extends
                            TestCase
{
  public static void testLemniscate()
  {
    try ( Lemniscate lem = new Lemniscate())
    {
      Complex w = lem.evaluate(ComplexConstants.complexOne.getReal(), 2, 555, Complex.newVector(2));
      assertEquals(0.6326452950883671, w.getReal().doubleValue(), 4.31E-21);
      assertEquals(0.5323526594920905, w.getImag().doubleValue(), 3.53E-22);
      assertEquals(-1.3220770748926536, w.get(1).getReal().doubleValue(), 2.02E-21);
      assertEquals(-0.77066978646899, w.get(1).getImag().doubleValue(), 1.23E-21);
      /**
       * l(1)=[[+0.44734777824274882640 +/- 4.31e-21] [+0.37643017550955035312 +/-
       * 3.53e-22]i, l'(1)=[-0.93484966490787055089 +/- 2.02e-21]
       * [-0.54494583206781146610 +/- 1.23e-21]i]
       */
      System.out.println("l(1)=" + w);
    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  public static void testDerivative() throws NotDifferentiableException
  {
    try ( Lemniscate l = new Lemniscate())
    {
      RealToComplexFunction dl     = l.differential();
      Complex               tmp    = new Complex();
      RealToComplexFunction absdl  = (t, order, prec, w) ->
                                   {
                                     dl.evaluate(t, order, prec, tmp).abs(prec, w.getReal());
                                     return w;
                                   };

      Complex               l1     = l.evaluate(ComplexConstants.complexOne.getReal(), 2, 256, Complex.newVector(2));
      Complex               dl1    = dl.evaluate(ComplexConstants.complexOne.getReal(), 1, 256, Complex.newVector(1));
      Complex               absdl1 = absdl.evaluate(ComplexConstants.complexOne.getReal(), 1, 256, new Complex());
      System.out.println("l'(1)=" + dl1);
      System.out.println("|l'(1)|=" + absdl1);
      assertTrue(l1.get(1).sub(dl1, 256, new Complex()).containsZero());
    }
    catch (NotDifferentiableException e)
    {
      throw e;
    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

  }

  /**
   * test integration 2
   * 
   * @throws NotDifferentiableException
   * @throws LackOfConvergenceException
   */
  @SuppressWarnings("resource")
  public static void testIntegration() throws NotDifferentiableException, LackOfConvergenceException
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
    b.pi(prec).div(2, prec, b);
    out.println("a=" + a);
    out.println("b=" + b);
    IntegrationOptions opts             = new IntegrationOptions();
    // opts.verbose = true;
    Complex            abslprimeonehalf = absdf.evaluate(half, 1, prec, new Complex());
    System.out.format("|l'(1/2)|=%s\n", abslprimeonehalf);
    opts.useHeap = false;
    absdf.integrate(a, b, prec, absErr, opts, prec, integral);
    assertTrue(integral.getImag().isZero());
    integral.printPrecision           = true;
    integral.getReal().printPrecision = true;
    System.out.format("int(|l'(x)|,x=%s..%s) is %s\n", a.toFixedString(), b.toFixedString(), integral);
    assertTrue(integral.getImag().isZero());
    double integralUncertainty = integral.getReal().getRad().doubleValue();
    assertEquals(2.62205755429211981046483958989111941368275495, integral.getReal().getMid().doubleValue(), integralUncertainty);
    Real arcLengthPiOverTwo = f.getArcLength(new Real().pi(prec).div(2, prec), prec, new Real());
    arcLengthPiOverTwo.printPrecision = true;
    System.out.println("arcLengthPiOverTwo=" + arcLengthPiOverTwo.toString(100));
    integral.getReal().printPrecision = true;
    System.out.println("integral uncertainty " + integralUncertainty + " < " + 2.02 * Math.pow(10, -75));
    assertTrue(integralUncertainty < 2.02 * Math.pow(10, -75));
    assertEquals(integral.getReal().doubleValue(), arcLengthPiOverTwo.doubleValue(), Math.pow(10, -18));

  }
}
