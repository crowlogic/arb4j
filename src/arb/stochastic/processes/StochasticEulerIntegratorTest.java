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
                                                              100);
    int                       n           = 50 * 1000;

    DiffusionProcessState     state       = new DiffusionProcessState();
    EvaluationSequence        samplePath  = integrator.integrate(interval, prec, n, state);

    Real                      μ           = samplePath.values.arithmeticMean(prec, new Real());
    μ.printPrecision = true;
    System.out.println("     μ=" + μ);
    double absMean = Math.abs(μ.doubleValue());

    assertTrue(absMean + " is too far away from zero with seed=" + randomState.getInitialValue(), absMean < 0.1);

    samplePath.values.stream().map(x -> x.pow(2, prec));

    Real σ = samplePath.values.arithmeticMean(prec, new Real()).abs().pow(2,prec);

    σ.printPrecision = true;
    double σdiff = Math.abs(σ.sub(samplePath.partition.δt, prec, new Real()).doubleValue());

    System.out.println("     dt=" + samplePath.partition.δt.toString(75));
    System.out.println("      σ=" + σ.toString(75) + "\nseed=" + randomState.getInitialValue() + "\nΔσ=" + σdiff);
    assertTrue(samplePath.partition.δt + " is too far away from σ=" + σ + " with seed="
                  + randomState.getInitialValue(),
               σdiff < 0.001);

    /**
     * TODO: add Real.stdev() and Real.variance() methods
     */
  }

}
