package arblib;

import arblib.functions.curves.*;
import junit.framework.*;

public class ComplexFunctionTest extends
                                 TestCase
{
  public static void testIntegration()
  {
    Lemniscate f = new Lemniscate();
    Complex zero = new Complex();
    Complex complexPi = zero.set(Constants.π, Constants.ZERO.getImag());
    f.integrate(zero, complexPi, 0, null, null, 0, null);
  }
}
