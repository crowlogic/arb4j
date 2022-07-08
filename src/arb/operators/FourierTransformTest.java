package arb.operators;

import static arb.Constants.*;
import static org.junit.Assert.*;

import javax.swing.*;

import arb.*;
import arb.functions.real.densities.*;
import arb.viz.*;

public class FourierTransformTest
{

  public static void main(String args[])
  {
    UnitCenteredGaussianProbabilityDensity                   gaussian = new UnitCenteredGaussianProbabilityDensity();
    FourierTransform<UnitCenteredGaussianProbabilityDensity> f        = new FourierTransform(gaussian);

    /**
     * the Fourier transform of e^(-x^2) is <br>
     * int(e^(-x^2)*e^(-i2πyx),x=-∞..+∞)=e^(-y^2*π^2)*sqrt[π]
     */
    f.integrationOptions.verbose = false;
    Real input = new Real().set("0.75", 128);
    System.out.println("input=" + input);

    UnitCenteredGaussianCharacteristicFunction gaussianCharacteristic = new UnitCenteredGaussianCharacteristicFunction();

    Complex                                    val                    = f.evaluate(input, 1, 128, new Complex());
    val.printPrecision = true;
    System.out.println("val from numerically integrated truncated Fourier transform " + val);
    assertEquals(0.0068789618474533993988662139429379749344661831855774,
                 val.getReal().doubleValue(),
                 Math.pow(10, -17));

    val = gaussianCharacteristic.evaluate(new Complex().set(input, ZERO.getReal()), 1, 128, val);
    System.out.println("input=" + input);
    val.printPrecision = true;
    System.out.println("'exact' value from gaussian characteristic function         " + val);
    assertEquals(0.0068789618474533993988662139429379749344661831855774,
                 val.getReal().doubleValue(),
                 Math.pow(10, -17));

    InverseFourierTransform invf = new InverseFourierTransform<>(f);
    Real                    orig = invf.evaluate(val, 1, 128, new Real());
    System.out.println("orig=" + orig);

  }

}
