package arb.stochastic;

import static arb.util.Utils.*;

import arb.*;
import junit.framework.*;

public class GaussianProbabilityDensityTest extends
                                            TestCase
{

  public static void testPDF()
  {
    GaussianProbabilityDensity p            = new GaussianProbabilityDensity(new Real("5",
                                                                                      256),
                                                                             new Real("2",
                                                                                      256));
    Real                       somePoint    = new Real("0.23",
                                                       256);
    Real                       pAtSomePoint = p.evaluate(somePoint, 1, 256, new Real());
    pAtSomePoint.printPrecision = true;

    println(String.format("%s(%s)=%s", p, somePoint.toString(10), pAtSomePoint.toString(40)));

    assertEquals(0.0116064045858180667, pAtSomePoint.doubleValue(), Math.pow(10, -17));
  }

}
