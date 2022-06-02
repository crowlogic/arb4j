package arb.operators;

import arb.Complex;
import arb.functions.complex.RealComplexFunction;
import arb.functions.real.GaussianDensity;
import junit.framework.TestCase;

public class FourierTransformTest extends
                                  TestCase
{
  @SuppressWarnings("resource")
  public static void testGaussianSelfInverse()
  {
    Complex                                                a = new Complex().set(-100, 0);
    Complex                                                b = new Complex().set(100, 0);
    RealComplexFunction<GaussianDensity>                   f = new RealComplexFunction<>(new GaussianDensity());
    FourierTransform<RealComplexFunction<GaussianDensity>> χ = new FourierTransform<RealComplexFunction<GaussianDensity>>(f,
                                                                                                                          a,
                                                                                                                          b);
    Complex                                                t = new Complex();
    t.getReal().assign(1);
    int     prec = 128;
    Complex fval = f.evaluate(t, 1, prec, new Complex());
    Complex χval = χ.evaluate(t, 1, prec, new Complex());
    assertEquals(fval, χval);
  }
}
