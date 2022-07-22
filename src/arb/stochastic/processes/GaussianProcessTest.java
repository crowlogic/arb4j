package arb.stochastic.processes;

import static arb.utensils.Utilities.println;

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
    int             prec               = 128;
    Real            meanμ              = new Real("5",
                                                  prec);
    Real            standardDeviationσ = new Real("2",
                                                  prec);
    GaussianProcess gaussianProcess    = new GaussianProcess(meanμ,
                                                             standardDeviationσ);

    int             n                  = 50000;
    for (int j = 0; j < 5; j++)
    {
      RandomState randomState = new RandomState((int) (Math.random() * Integer.MAX_VALUE));

      gaussianProcess.generateTrajectory(n, randomState, prec);
    }
  }

}
