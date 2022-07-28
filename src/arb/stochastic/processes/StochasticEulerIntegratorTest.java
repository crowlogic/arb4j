package arb.stochastic.processes;

import arb.*;
import junit.framework.TestCase;

public class StochasticEulerIntegratorTest extends
                                           TestCase
{
  public static final int prec = 128;
  private Real            σ;

  public void testDiscretize()
  {
    RandomState                 randomState = new RandomState(31337);
    StandardGaussianProcess     B           = new StandardGaussianProcess();
    StochasticEulerIntegrator   integrator  = new StochasticEulerIntegrator(B,
                                                                            randomState);
    FloatInterval               interval    = new FloatInterval(0,
                                                                10);
    int                         n           = 10000;

    DiffusionProcessCoordinates coords      = new DiffusionProcessCoordinates();
    EvaluationSequence          samplePath  = integrator.integrate(interval, 128, n, coords);
    Real                        μ           = samplePath.values.Σ(prec, new Real());

    /**
     * TODO: add Real.mean(), Real.stdev() and Real.variance() methods
     */
  }

}
