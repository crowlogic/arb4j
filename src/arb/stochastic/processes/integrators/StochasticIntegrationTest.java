package arb.stochastic.processes.integrators;

import static arb.utensils.Utilities.println;

import java.util.stream.IntStream;

import arb.FloatInterval;
import arb.RandomState;
import arb.Real;
import arb.stochastic.processes.DiffusionProcessState;
import arb.stochastic.processes.EvaluationSequence;
import arb.stochastic.processes.WienerProcess;
import junit.framework.TestCase;

public class StochasticIntegrationTest extends
                                       TestCase
{
  public static final int prec = 128;

  public void testStandardWienerProcessWithMilsteinIntegrator()
  {
    IntStream.range(0, 1).forEach(i ->
    {
      WienerProcess         B          = new WienerProcess(new Real("1",
                                                                    128));
      DiffusionProcessState state      = new DiffusionProcessState();

      MilsteinIntegrator    integrator = new MilsteinIntegrator(B,
                                                                state);
      testStochasticIntegrator(integrator);
    });
  }

  public void testStandardWienerProcessWithEulerIntegrator()
  {
    IntStream.range(0, 1).forEach(i ->
    {
      WienerProcess B = new WienerProcess(new Real("1",
                                                   128));
      try ( EulerIntegrator integrator = new EulerIntegrator(B,
                                                             new DiffusionProcessState(new RandomState(31337))))
      {
        testStochasticIntegrator(integrator);

      }
    });
  }

  protected void testStochasticIntegrator(AbstractDiffusionProcessIntegrator<DiffusionProcessState, ?> integrator)
  {
    FloatInterval         interval    = new FloatInterval(0,
                                                          10);
    int                   n           = 50 * 1000;

    DiffusionProcessState state       = integrator.state;
    RandomState           randomState = state.randomState;
    println("testStandardWienerProcessIntegration  randomState=" + randomState);

    EvaluationSequence samplePath = integrator.integrate(interval, n, prec);
    println("state=" + state);
    Real μ           = samplePath.dimensions[0].mean(prec, new Real());
    Real sampleStdev = samplePath.dimensions[0].standardDeviation(prec, μ, new Real());
    assert sampleStdev.isFinite();
    Real populationStdev = integrator.diffusionProcess.σ().evaluate(state, 1, prec, new Real());
    populationStdev.printPrecision = true;
    sampleStdev.printPrecision     = true;
    μ.printPrecision               = true;
    System.out.println("       μ=" + μ);
    sampleStdev.printPrecision = true;
    System.out.println("populationStdev=" + populationStdev.toString());
    System.out.println("    sampleStdev=" + sampleStdev.toString());
    double absMean = Math.abs(μ.doubleValue());
    Real   σδ      = sampleStdev.sub(populationStdev, prec).abs();
    System.out.println("σδ=" + σδ);
    assert absMean < 0.2 : "absolute mean " + absMean + " is too far away from zero with seed="
                  + randomState.getInitialValue();
    assert σδ.doubleValue() < 0.5 : "population and sample σ " + σδ.toFixedString()
                  + " is too far away from zero with seed=" + randomState.getInitialValue();
  }

}
