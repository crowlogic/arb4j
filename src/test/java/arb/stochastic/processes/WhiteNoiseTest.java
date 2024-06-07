package arb.stochastic.processes;

import arb.Real;
import arb.stochastic.GaussianDensityFunction;
import junit.framework.TestCase;

public class WhiteNoiseTest extends
                            TestCase
{

  public static void testPDF()
  {
    try ( GaussianDensityFunction p = new GaussianDensityFunction(new Real("5",
                                                                           256),
                                                                  new Real("2",
                                                                           256)))
    {
      Real somePoint    = new Real("0.23",
                                   256);
      Real pAtSomePoint = p.evaluate(somePoint, 1, 256, new Real());
      pAtSomePoint.printPrecision = true;

      assertEquals(0.0116064045858180667, pAtSomePoint.doubleValue(), Math.pow(10, -17));
    }
  }

}
