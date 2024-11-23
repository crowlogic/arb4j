package arb.functions.complex.numbertheoretic;

import static arb.arblib.acb_dirichlet_hardy_z;
import static arb.arblib.acb_set_d;
import static java.lang.Math.pow;

import arb.ArblibTest;
import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class ZFunctionTest extends
                           TestCase
{

  public static void testZ()
  {
    Complex   res = Complex.newVector(2);
    ZFunction Z   = new ZFunction();
    try ( Complex z = new Complex();)
    {
      z.set(6, 0.4);
      Z.evaluate(z, 2, 128, res);
      //System.out.format("Z(z=%s)=%s\n",z,res);
      Complex derivative = res.get(1);
      Real r =  res.getReal();
      
      double  epsilon    = pow(10, -13);
      assertEquals(-0.9014750622750403,r.doubleValue(), epsilon);
      assertEquals(-0.07258030395929498, res.getImag().doubleValue(), epsilon);
      assertEquals(-0.18228733468370215, derivative.getReal().doubleValue(), epsilon);
      assertEquals(-0.011227163332281721, derivative.getImag().doubleValue(), epsilon);
      res.clear();
    }
  }

  public static void testHardyZFunction()
  {

    Complex result = new Complex();
    Complex input  = new Complex();

    acb_set_d(input, 13.2);

    acb_dirichlet_hardy_z(result, input, null, null, 1, ArblibTest.prec);
    double res = result.getReal().doubleValue();
    assertEquals(-0.6699771881103516, res, 0.000001);

  }

}
