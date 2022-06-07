package arb.operators;

import arb.*;
import arb.functions.complex.*;
import arb.functions.real.densities.*;
import junit.framework.*;

public class FourierTransformTest extends
                                  TestCase
{
  @SuppressWarnings("resource")
  public static void testGaussianSelfInverse()
  {
    Complex                                               a = new Complex().set(-100, 0);
    Complex                                               b = new Complex().set(100, 0);
    GaussianDensity                                       f = new GaussianDensity();
    assert false : "fixme";
  //  FourierTransform<GaussianDensity> χ = new FourierTransform<>(f,
  //                                                                                   a,
  //                                                                                   b);
    Complex                                               t = new Complex();
    t.getReal().set(1);
    int     prec = 128;
   // Complex fval = f.evaluate(t, 1, prec, new Complex());
    //Complex χval = χ.evaluate(t, 1, prec, new Complex());
   // assertEquals(fval, χval);
  }
}
