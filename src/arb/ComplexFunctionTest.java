package arb;

import static arb.Constants.ONE;

import arb.ComplexFunction.ConvergenceStatus;
import arb.curves.*;
import arb.exceptions.NotDifferentiableException;
import junit.framework.*;

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
      Complex b = absoluteValueOfAConstantFunction.evaluate(Constants.ZERO, 1, 128, new Complex());
      b.printPrecision = true;
//      System.out.println("|1+i|="
//                    + b);
      assertEquals(sqrt2,b.getReal());

    }
  }

  public static void testIntegration()
  {
    Lemniscate f    = new Lemniscate();
    Complex    zero = new Complex();
    try ( Complex complexPi = new Complex(); Complex integral = new Complex(); Magnitude absErr = new Magnitude();)
    {
      absErr.set(Math.pow(2, -128));
      complexPi.set(Constants.π, Constants.ZERO.getImag());
      assertTrue( f.integrate(zero, complexPi, 64, absErr, null, 128, integral) == ConvergenceStatus.Converged );
      // integral.printPrecision = true;
      System.out.println("integral is " + integral);
    }

  }

  /**
   * test integration 2
   * @throws NotDifferentiableException 
   */
  public static void testIntegration2() throws NotDifferentiableException
  {
    Lemniscate      f     = new Lemniscate();
    ComplexFunction df    = f.differential();

    Complex         zero  = new Complex();
    ComplexFunction absdf = df.abs();

    try ( Complex complexPi = new Complex(); Complex integral = new Complex(); Magnitude absErr = new Magnitude();)
    {
      absErr.set(Math.pow(2, -50));
      complexPi.set(Constants.π, Constants.ZERO.getImag());
      //complexPi.getReal().div(4, 128, complexPi.getReal());

      IntegrationOptions opts = new IntegrationOptions();
      opts.verbose = true;
      ConvergenceStatus status = absdf.integrate(zero, complexPi, 128, absErr, opts, 256, integral);
      assertTrue(status == ConvergenceStatus.Converged);
      integral.printPrecision = true;
      System.out.println("integral is " + integral);
      System.out.println("domain is " + complexPi);

    }
  }
}
