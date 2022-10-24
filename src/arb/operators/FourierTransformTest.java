package arb.operators;

import static arb.utensils.Utilities.println;

import arb.*;
import arb.functions.RealToComplexFunction;
import arb.functions.real.ErrorFunction;
import arb.functions.real.RealPart;
import arb.stochastic.StandardGaussianCharacteristicFunction;
import arb.stochastic.StandardGaussianDensityFunction;
import junit.framework.TestCase;

public class FourierTransformTest extends
                                  TestCase
{
  public static final int prec = 128;

  /**
   * The {@link FourierTransform} of e^(-x²) is
   * ∫(e^(-x²)*e^(-i*2*π*y*x),x=-∞..+∞)=e^(-y²*π²)*√π
   * 
   * TODO: compare the approximation residual vs.the true function and see how*the
   * {@link ErrorFunction} compares with the {@link Magnitude}s of the*
   * uncertainty of the computed {@link Real}quantities
   */
  public static void testDuality()
  {
    StandardGaussianDensityFunction                   f        = new StandardGaussianDensityFunction();
    FourierTransform<StandardGaussianDensityFunction> φnumeric = new FourierTransform(f,
                                                                                      false);

    φnumeric.integrationOptions.verbose = false;
    try ( Complex point = new Complex(new Real("0.75",
                                               prec),
                                      RealConstants.zero))
    {
      System.out.println("point=" + point);

      StandardGaussianCharacteristicFunction            φexact = new StandardGaussianCharacteristicFunction();
      FourierTransform<StandardGaussianDensityFunction> f2     = new FourierTransform(φexact,
                                                                                      true);

      Complex                                           val    = φnumeric.evaluate(point, 1, prec, new Complex());
      val.printPrecision = true;
      System.out.println("val from numerically integrated truncated Fourier transform of Gaussian density " + val);
      assertEquals(0.0068789618474533993988662139429379749344661831855774,
                   val.getReal().doubleValue(),
                   Math.pow(10, -17));

      val.getImag().zero();
      φexact.evaluate(point, 1, prec, val);

      System.out.println("input=" + point);
      val.printPrecision = true;
      System.out.println("'exact' value from gaussian characteristic function                             " + val);
      assertEquals(0.0068789618474533993988662139429379749344661831855774,
                   val.getReal().doubleValue(),
                   Math.pow(10, -17));

      FourierTransform<RealPart<?>> f3 = new FourierTransform(new RealPart(φnumeric),
                                                              true);

      try ( Complex value = new Complex(); Complex value2 = new Complex(); Complex value3 = new Complex();)
      {
        value.printPrecision = value2.printPrecision = true;
        f.evaluate(point, 1, prec, value.getReal());
        println(String.format("original f[%s]=%s", point, value));
        f2.evaluate(point, 1, prec, value2);
        println(String.format("numerically inverted exact f[%s]=%s", point, value2));
        assertEquals(value2.getReal().doubleValue(), value.getReal().doubleValue(), 0);
        f3.evaluate(point, 1, prec, value3);
        println(String.format("numerically inverted numericlly transformed (this one needs work) f[%s]=%s",
                              point,
                              value3));
        // assertEquals(value3.getReal().doubleValue(), value.getReal().doubleValue(),
        // 0);
      }
    }
  }

}
