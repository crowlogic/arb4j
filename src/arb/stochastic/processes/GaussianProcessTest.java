package arb.stochastic.processes;

import static arb.utils.Utils.println;

import arb.RandomState;
import arb.Real;
import arb.stochastic.GaussianDensityFunction;
import junit.framework.TestCase;

public class GaussianProcessTest extends
                                 TestCase
{

  public static void testPDF()
  {
    GaussianProcess         gaussianProcess = new GaussianProcess(new Real("5",
                                                                           256),
                                                                  new Real("2",
                                                                           256));
    GaussianDensityFunction p               = gaussianProcess.getDensityFunction();
    Real                    somePoint       = new Real("0.23",
                                                       256);
    Real                    pAtSomePoint    = p.evaluate(somePoint, 1, 256, new Real());
    pAtSomePoint.printPrecision = true;

    println(String.format("%s(%s)=%s", p, somePoint.toString(10), pAtSomePoint.toString(40)));

    assertEquals(0.0116064045858180667, pAtSomePoint.doubleValue(), Math.pow(10, -17));
  }

  public static void testSample()
  {
    GaussianProcess gaussianProcess = new GaussianProcess(new Real("5",
                                                                   256),
                                                          new Real("2",
                                                                   256));
    RandomState     randomState     = new RandomState(41);
    Real            u               = new Real();                        // uniform sample
    Real            x               = new Real();                        // Gaussian sample
    gaussianProcess.sample(256, randomState, u, x);

  }
}
