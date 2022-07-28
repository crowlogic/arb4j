package arb.stochastic.processes;

import arb.*;
import junit.framework.TestCase;

public class StochasticEulerIntegratorTest extends
                                           TestCase
{
  public static final int prec = 128;
  private Real            σ;

  public void testIntegrator()
  {
    RandomState                 randomState = new RandomState((int) (Math.random() * Integer.MAX_VALUE));
    StandardGaussianProcess     B           = new StandardGaussianProcess();
    StochasticEulerIntegrator   integrator  = new StochasticEulerIntegrator(B,
                                                                            randomState);
    FloatInterval               interval    = new FloatInterval(0,
                                                                10);
    int                         n           = 10000;

    DiffusionProcessState coords      = new DiffusionProcessState();
    EvaluationSequence          samplePath  = integrator.integrate(interval, 128, n, coords);
    Real                        μ           = samplePath.values.arithmeticMean(prec, new Real());
    μ.printPrecision = true;
    System.out.println("mean=" + μ + " seed=" + randomState.getInitialValue());
    double absMean = Math.abs(μ.doubleValue());
    assertTrue(absMean + " is too far away from zero with seed=" + randomState.getInitialValue(), absMean < 0.0001);
    /**
     * TODO: add  Real.stdev() and Real.variance() methods
     */
  }

}
