package arb.functions.complex;

import static arb.Constants.*;

import arb.*;
import arb.curves.*;
import arb.exceptions.*;
import arb.functions.*;
import junit.framework.*;

public class ComplexFunctionTest extends
                                 TestCase
{
  public static void testAbs()
  {
    try ( Complex a = new Complex();)
    {
      a.set(ONE, ONE);
      Function<Complex, Real> absoluteValueOfAConstantFunction = new ComplexConstant(a).abs();

      Real                    sqrt2                            = a.abs(128, new Real());
      Real                    b                                = absoluteValueOfAConstantFunction.evaluate(Constants.ZERO,
                                                                                                           1,
                                                                                                           128,
                                                                                                           new Real());
//      System.out.println("|1+i|="
//                    + b);
      assertEquals(sqrt2, b);

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
      // new ComplexFun
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
    int                  prec     = 256;

    Lemniscate           f        = new Lemniscate();
    LemniscateDerivative df       = new LemniscateDerivative();

    Function<Real, Real> absdf    = df.abs();

    Real                 integral = new Real();
    Magnitude            absErr   = new Magnitude();

    Real                 a        = new Real();
    Real                 b        = new Real();
    b.pi(prec).div(2, prec, b);

    IntegrationOptions opts             = new IntegrationOptions();
    // opts.verbose = true;
    Real               abslprimeonehalf = absdf.evaluate(HALF, 1, 128, new Real());
    System.out.format("|l'(1/2)|=%s\n", abslprimeonehalf);
    opts.useHeap = false;
    absdf.integrate(a, b, 128, absErr, opts, prec, integral);
    System.out.format("int(|l'(x)|,x=%s..%s) is %s\n", a.toFixedString(), b.toFixedString(), integral);
    assertTrue(integral.getRad().doubleValue() <= 1e-20);
    assertEquals(2.62205755429211981046483958989111941368275495,
                 integral.getMid().doubleValue(),
                 integral.getRad().doubleValue());
  }
}
