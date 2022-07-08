package arb.operators;

import static arb.util.Utils.println;
import static org.junit.Assert.*;

import java.awt.Point;

import arb.*;
import arb.probability.*;
import junit.framework.TestCase;

public class FourierTransformTest extends
                                  TestCase
{
  public static final int prec = 128;

  public static void testDuality()
  {
    UnitCenteredGaussianProbabilityDensity                   f        = new UnitCenteredGaussianProbabilityDensity();
    FourierTransform<UnitCenteredGaussianProbabilityDensity> φnumeric = new FourierTransform(f,
                                                                                             false);

    /**
     * the Fourier transform of e^(-x^2) is <br>
     * int(e^(-x^2)*e^(-i2πyx),x=-∞..+∞)=e^(-y^2*π^2)*sqrt[π]
     */
    φnumeric.integrationOptions.verbose = false;
    Real point = new Real().set("0.75", prec);
    System.out.println("point=" + point);

    UnitCenteredGaussianCharacteristicFunction               φexact = new UnitCenteredGaussianCharacteristicFunction();
    FourierTransform<UnitCenteredGaussianProbabilityDensity> f2     = new FourierTransform(φexact,
                                                                                           true);

    Complex                                                  val    = φnumeric.evaluate(point,
                                                                                        1,
                                                                                        prec,
                                                                                        new Complex());
    val.printPrecision = true;
    System.out.println("val from numerically integrated truncated Fourier transform of Gaussian density " + val);
    assertEquals(0.0068789618474533993988662139429379749344661831855774,
                 val.getReal().doubleValue(),
                 Math.pow(10, -17));

    val.getImag().zero();
    φexact.evaluate(point, 1, prec, val.getReal());

    System.out.println("input=" + point);
    val.printPrecision = true;
    System.out.println("'exact' value from gaussian characteristic function                             " + val);
    assertEquals(0.0068789618474533993988662139429379749344661831855774,
                 val.getReal().doubleValue(),
                 Math.pow(10, -17));

    /**
     * TODO: also test the numerically inverted numerically integrated Fourier transform
     */
    try ( Complex value = new Complex(); Complex value2 = new Complex();)
    {
      value.printPrecision = value2.printPrecision = true;
      f.evaluate(point, 1, prec, value.getReal());
      println(String.format("original f[%s]=%s", point, value));
      f2.evaluate(point, 1, prec, value2);
      println(String.format("inverted f[%s]=%s", point, value2));
      assertEquals(value2.getReal().doubleValue(), value.getReal().doubleValue(), 0);
    }
  }

}
