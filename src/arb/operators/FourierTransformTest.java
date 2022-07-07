package arb.operators;

import static org.junit.Assert.*;

import javax.swing.*;

import arb.*;
import arb.functions.real.densities.*;
import arb.viz.*;

public class FourierTransformTest
{

  public static void main(String args[])
  {
    UnitCenteredGaussianDensity                   gaussian = new UnitCenteredGaussianDensity();
    FourierTransform<UnitCenteredGaussianDensity> f        = new FourierTransform(gaussian);

    /**
     * the Fourier transform of e^(-x^2) is <br>
     * int(e^(-x^2)*e^(-i2πyx),x=-∞..+∞)=e^(-y^2*π^2)*sqrt[π]
     */
    f.integrationOptions.verbose = false;
    Real input = new Real().set("0.75", 128);
    System.out.println("input=" + input);

    Complex val = f.evaluate(input, 1, 128, new Complex());
    val.printPrecision = true;
    System.out.println("val " + val);
    assertEquals(0.0068789618474533993988662139429379749344661831855774,
                 val.getReal().doubleValue(),
                 Math.pow(10, -17));

    InverseFourierTransform invf = new InverseFourierTransform<>(f);
    Real                    orig = invf.evaluate(val, 1, 128, new Real());
    System.out.println("orig=" + orig);

  }

}
