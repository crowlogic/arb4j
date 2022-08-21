package arb;

import static arb.arb.*;
import static java.lang.Math.pow;
import static java.lang.System.out;

import junit.framework.TestCase;

public class ArblibTest extends
                        TestCase
{
  static
  {
    System.loadLibrary("arblib");
  }

  public static final int prec = 128;

  public static void testRealFrac()
  {
    try ( Real a = new Real())
    {
      a.assign("12.123456789", 128);
      Real bee = a.frac(prec, new Real());
      System.out.println("bee " + bee);
      double b = bee.doubleValue();
    }
  }

  public static void testHardyZFunction()
  {

    Complex result = new Complex();
    Complex input  = new Complex();
    input.init();
    result.init();
    acb_set_d(input, 13.2);

    acb_dirichlet_hardy_z(result, input, null, null, 1, prec);
    double res = result.getReal().doubleValue();
    assertEquals(-0.6699771881103516, res, 0.000001);

  }

  public static void testHurwitzZeta()
  {
    // acb_dirichlet_hurwitz(res, z, v, prec);

  }

  public static void testHardyTheta()
  {
    Complex z    = new Complex();
    Complex faze = new Complex();
    z.init();
    faze.init();
    z.getReal().set(13.2);
    acb_dirichlet_hardy_theta(faze, z, null, null, 1, prec);
    double result = faze.getReal().doubleValue();
    out.println("theta(" + z.getReal().doubleValue() + ")=" + result);
    assertEquals(-2.0916778325102459547, result, pow(10, -2));
    out.println("e^(" + faze + ")=");
    faze.getImag().set(faze.getReal());
    arb_set_d(faze.getReal(), 0);
    acb_exp(faze, faze, prec);
    out.println(faze + " should be\n -.497644932260514 + I-0.867380839882591 ");
    assertEquals(-0.497644932260514, faze.getReal().doubleValue(), pow(10, -12));
    assertEquals(-0.867380839882591, faze.getImag().doubleValue(), pow(10, -12));
    // -.497644932260514-.867380839882591*I

  }

}
