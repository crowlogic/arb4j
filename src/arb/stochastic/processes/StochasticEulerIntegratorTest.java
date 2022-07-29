package arb.stochastic.processes;

import static arb.RealConstants.one;
import static arb.utensils.Utilities.println;

import arb.*;
import junit.framework.TestCase;

public class StochasticEulerIntegratorTest extends
                                           TestCase
{
  public static final int prec = 256;
  private Real            σ;

  public void testWienerProcessIntegration()
  {
    RandomState               randomState = new RandomState((int) (Math.random() * Integer.MAX_VALUE));
    GaussianProcess           B           = new WienerProcess(one);
    StochasticEulerIntegrator integrator  = new StochasticEulerIntegrator(B,
                                                                          randomState);
    FloatInterval             interval    = new FloatInterval(0,
                                                              10);
    int                       n           = 100 * 1000;

    DiffusionProcessState     state       = new DiffusionProcessState();
    EvaluationSequence        samplePath  = integrator.integrate(interval, prec, n, state);

    Real                      μ           = samplePath.values.arithmeticMean(prec, new Real());
    μ.printPrecision = true;
    System.out.println("     μ=" + μ);
    double absMean = Math.abs(μ.doubleValue());

    assert absMean < 0.03 : absMean + " is too far away from zero with seed=" + randomState.getInitialValue();

    /**
     * TODO: add Real.stdev() and Real.variance() methods
     */
  }

}
