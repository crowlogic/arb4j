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
    int             prec            = 128;
    GaussianProcess gaussianProcess = new GaussianProcess(new Real("5",
                                                                   prec),
                                                          new Real("2",
                                                                   prec));

    for (int j = 0; j < 5; j++)
    {
      try ( RandomState randomState = new RandomState(j); Real u = new Real(); // uniform sample
            Real x = new Real(); // Gaussian sample
            Real uAccumulator = new Real(); Real xAccumulator = new Real(); Real dx2Accumulator = new Real();)
      {
        int i;
        for (i = 0; i < 20000; i++)
        {
          gaussianProcess.sample(prec, randomState, u, x);
          uAccumulator.add(u, prec, uAccumulator);
          xAccumulator.add(x, prec, xAccumulator);
          // dx2Accumulator.add(x.sub(gaussianProcess.μ, prec, null), prec, xAccumulator);

        }
        uAccumulator.div(i, prec);
        xAccumulator.div(i, prec);
        println("i=" + uAccumulator + " xsum=" + xAccumulator);
        assertEquals(0.499, uAccumulator.doubleValue(), 0.01);
        assertEquals(4.999, xAccumulator.doubleValue(), 0.01);

      }
    }
  }
}
