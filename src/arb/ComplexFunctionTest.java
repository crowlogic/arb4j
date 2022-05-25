package arb;

import static arb.Constants.ONE;

import arb.curves.Lemniscate;
import arb.curves.LemniscateDerivative;
import arb.exceptions.LackOfConvergenceException;
import arb.exceptions.NotDifferentiableException;
import junit.framework.TestCase;

public class ComplexFunctionTest extends
                                 TestCase
{
  public static void testAbs()
  {
    try ( Complex a = new Complex();)
    {
      a.set(ONE, ONE);
      ComplexFunction absoluteValueOfAConstantFunction = new ConstantComplexFunction(a).abs();

      Real            sqrt2                            = a.abs(128, new Real());
      Complex         b                                = absoluteValueOfAConstantFunction.evaluate(Constants.ZERO,
                                                                                                   1,
                                                                                                   128,
                                                                                                   new Complex());
      b.printPrecision = true;
//      System.out.println("|1+i|="
//                    + b);
      assertEquals(sqrt2, b.getReal());

    }
  }

  public static void testIntegration() throws LackOfConvergenceException
  {
    Lemniscate f    = new Lemniscate();
    Complex    zero = new Complex();
    try ( Complex complexPi = new Complex(); Complex integral = new Complex(); Magnitude absErr = new Magnitude();)
    {

      absErr.set(Math.pow(2, -128));
      complexPi.set(Constants.π, Constants.ZERO.getImag());
      f.integrate(zero, complexPi, 64, absErr, null, 128, integral);
      // integral.printPrecision = true;
      System.out.println("integral is " + integral);
    }

  }

  /**
   * test integration 2
   * 
   * @throws NotDifferentiableException
   * @throws LackOfConvergenceException
   */
  public static void testIntegration2() throws NotDifferentiableException, LackOfConvergenceException
  {
    int             prec     = 256;

    Lemniscate      f        = new Lemniscate();
    ComplexFunction df       = new LemniscateDerivative();

    ComplexFunction absdf    = df.abs();

    Complex         integral = new Complex();
    Magnitude       absErr   = new Magnitude();

    Complex         a        = new Complex();
    Complex         b        = new Complex();
    Real            breal    = b.getReal();
    breal.pi(prec).div(2, prec, breal);

    IntegrationOptions opts = new IntegrationOptions();
    opts.verbose = true;
    Complex abslprimeonehalf = absdf.evaluate(Constants.COMPLEX_HALF, 1, 128, new Complex());
    System.out.format("|l'(1/2)|=%s\n", abslprimeonehalf);
    // opts.useHeap = true;
    absdf.integrate(a, b, 128, absErr, opts, prec, integral);
    integral.printPrecision = true;
    System.out.format("int(l'(x),x=%s..%s) is %s\n", a.toFixedString(), b.toFixedString(), integral);

  }
}
