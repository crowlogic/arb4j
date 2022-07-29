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
    GaussianProcess           B           = new WienerProcess(new Real("2.3",
                                                                       128));
    StochasticEulerIntegrator integrator  = new StochasticEulerIntegrator(B,
                                                                          randomState);
    FloatInterval             interval    = new FloatInterval(0,
                                                              10);
    int                       n           = 100;                                                       // * 1000;

    DiffusionProcessState     state       = new DiffusionProcessState();
    EvaluationSequence        samplePath  = integrator.integrate(interval, prec, n, state);

    Real                      μ           = samplePath.values.arithmeticMean(prec, new Real());
    μ.printPrecision = true;
    System.out.println("μ=" + μ);
    double absMean = Math.abs(μ.doubleValue());

    assertTrue(absMean + " is too far away from zero with seed=" + randomState.getInitialValue(), absMean < 0.1);

    Real σ = samplePath.values.stream()
                              .map(x -> x.sub(μ, prec).pow(2, prec))
                              .findFirst()
                              .get()
                              .arithmeticMean(prec, new Real())
                              .sqrt(prec);
    σ.printPrecision = true;
    Real   sampleσ = samplePath.partition.δt.sub(σ, prec).pow(2, prec).sqrt(prec);
    double σdiff   = Math.abs(σ.sub(sampleσ, prec, new Real()).doubleValue());

    System.out.println(" σ=" + σ + "\n sampleσ=" + sampleσ + "\n δt=" + samplePath.partition.δt + "\n seed="
                  + randomState.getInitialValue() + "\nΔσ=" + sampleσ);
    assertTrue(" sampleσ " + sampleσ + " is too far away from σ=" + σ + " with seed="
                  + randomState.getInitialValue(),
               σdiff < 0.001);

    /**
     * TODO: add Real.stdev() and Real.variance() methods
     */
  }

}
