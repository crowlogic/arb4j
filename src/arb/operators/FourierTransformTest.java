package arb.operators;

import static arb.Constants.*;
import static org.junit.Assert.*;

import arb.*;
import arb.functions.real.densities.*;

public class FourierTransformTest
{

  public static void main(String args[])
  {
    UnitCenteredGaussianProbabilityDensity                   gaussian = new UnitCenteredGaussianProbabilityDensity();
    FourierTransform<UnitCenteredGaussianProbabilityDensity> f        = new FourierTransform(gaussian, false);

    /**
     * the Fourier transform of e^(-x^2) is <br>
     * int(e^(-x^2)*e^(-i2πyx),x=-∞..+∞)=e^(-y^2*π^2)*sqrt[π]
     */
    f.integrationOptions.verbose = false;
    Real input = new Real().set("0.75", 128);
    System.out.println("input=" + input);

    UnitCenteredGaussianCharacteristicFunction gaussianCharacteristic = new UnitCenteredGaussianCharacteristicFunction();
    FourierTransform<UnitCenteredGaussianProbabilityDensity> f2        = new FourierTransform(gaussianCharacteristic, true);

    Complex                                    val                    = f.evaluate(input, 1, 128, new Complex());
    val.printPrecision = true;
    System.out.println("val from numerically integrated truncated Fourier transform " + val);
    assertEquals(0.0068789618474533993988662139429379749344661831855774,
                 val.getReal().doubleValue(),
                 Math.pow(10, -17));

    val.getImag().zero();
    gaussianCharacteristic.evaluate(input, 1, 128, val.getReal());
    
    System.out.println("input=" + input);
    val.printPrecision = true;
    System.out.println("'exact' value from gaussian characteristic function         " + val);
    assertEquals(0.0068789618474533993988662139429379749344661831855774,
                 val.getReal().doubleValue(),
                 Math.pow(10, -17));

  }

}
