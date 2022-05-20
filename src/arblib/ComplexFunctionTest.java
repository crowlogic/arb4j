package arblib;

import arblib.curves.*;
import junit.framework.*;

public class ComplexFunctionTest extends
                                 TestCase
{
  public static void testIntegration()
  {
    Lemniscate f    = new Lemniscate();
    Complex    zero = new Complex();
    try ( Complex complexPi = new Complex(); Complex integral = new Complex(); Magnitude absErr = new Magnitude();)
    {
      absErr.set(Math.pow(2, -128));
      complexPi.set(Constants.π, Constants.ZERO.getImag());
      f.integrate(zero, complexPi, 64, absErr, null, 128, integral);
      System.out.println("integral is " + integral);
    }
  }
}
