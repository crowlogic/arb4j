package arb.curves;

import arb.Complex;
import arb.Constants;
import arb.exceptions.NotDifferentiableException;
import arb.functions.complex.ComplexFunction;
import junit.framework.TestCase;

public class LemniscateTest extends
                            TestCase
{
  public static void testLemniscate()
  {
    Lemniscate lem = new Lemniscate();
    Complex    w   = lem.evaluate(Constants.COMPLEX_ONE, 2, 555, Complex.newVector(2));
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

  public static void testDerivative() throws NotDifferentiableException
  {
    Lemniscate      l      = new Lemniscate();
    ComplexFunction dl     = l.differential();
    Complex         tmp    = new Complex();
    ComplexFunction absdl  = (t, order, prec, w) ->
                           {
                             dl.evaluate(t, order, prec, tmp).abs(prec, w.getReal());
                             return w;
                           };

    Complex         l1     = l.evaluate(Constants.COMPLEX_ONE, 2, 256, Complex.newVector(2));
    Complex         dl1    = dl.evaluate(Constants.COMPLEX_ONE, 1, 256, Complex.newVector(1));
    Complex         absdl1 = absdl.evaluate(Constants.COMPLEX_ONE, 1, 256, new Complex());
    System.out.println("l'(1)=" + dl1);
    System.out.println("|l'(1)|=" + absdl1);
    assertTrue(l1.get(1).sub(dl1, 256, new Complex()).containsZero());

  }
}
