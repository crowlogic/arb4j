package arb.stochastic.processes;

import arb.*;
import junit.framework.TestCase;

public class StochasticEulerIntegratorTest extends
                                           TestCase
{
  public static final int prec = 256;
  private Real            σ;

  public void testIntegrator()
  {
    RandomState               randomState = new RandomState((int) (Math.random() * Integer.MAX_VALUE));
    StandardGaussianProcess   B           = new StandardGaussianProcess();
    StochasticEulerIntegrator integrator  = new StochasticEulerIntegrator(B,
                                                                          randomState);
    FloatInterval             interval    = new FloatInterval(0,
                                                              100);
    int                       n           = 300 * 1000;

    DiffusionProcessState     state      = new DiffusionProcessState();
    EvaluationSequence        samplePath  = integrator.integrate(interval, prec, n, state);
    Real                      μ           = samplePath.values.arithmeticMean(prec, new Real());
    μ.printPrecision = true;
    double absMean = Math.abs(μ.doubleValue());
    assertTrue(absMean + " is too far away from zero with seed=" + randomState.getInitialValue(), absMean < 0.0001);
    Real σ = samplePath.values.stream()
                              .map(x -> x.sub(μ, prec).pow(2, prec))
                              .findFirst()
                              .get()
                              .arithmeticMean(prec, new Real())
                              .sqrt(prec);
    σ.printPrecision = true;
    double δσ = samplePath.partition.δt.sub(σ, prec).pow(2, prec).sqrt(prec).doubleValue();
    System.out.println("μ=" + μ + "\n σ=" + σ + "\n δt=" + samplePath.partition.δt + "\n seed="
                  + randomState.getInitialValue() + "\nΔσ=" + δσ);
    assertTrue(δσ + " is too far away from σ=" + σ + " with seed=" + randomState.getInitialValue(), δσ < 0.001);

    /**
     * TODO: add Real.stdev() and Real.variance() methods
     */
  }

}
