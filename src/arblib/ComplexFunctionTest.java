package arblib;

import static arblib.Constants.ONE;

import arblib.ComplexFunction.ConvergenceStatus;
import arblib.curves.*;
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
      f.integrate(zero, complexPi, 64, absErr, null, 128, integral);
      // integral.printPrecision = true;
      System.out.println("integral is " + integral);
    }

  }

  /**
   * test integration 2
   */
  public static void testIntegration2()
  {
    Lemniscate      f     = new Lemniscate();
    ComplexFunction df    = f.differentiate();

    Complex         zero  = new Complex();
    ComplexFunction absdf = df.abs();

    try ( Complex complexPi = new Complex(); Complex integral = new Complex(); Magnitude absErr = new Magnitude();)
    {
      absErr.set(Math.pow(2, -64));
      complexPi.set(Constants.π, Constants.ZERO.getImag());
      complexPi.getReal().div(2, 128, complexPi.getReal());

      assertTrue(absdf.integrate(zero, complexPi, 128, absErr, null, 256, integral) == ConvergenceStatus.Converged);
      integral.printPrecision = true;
      System.out.println("integral is " + integral);
    }
  }
}
