package arb.stochastic.processes.integrators;

import java.util.stream.IntStream;

import arb.*;
import arb.stochastic.processes.*;
import junit.framework.TestCase;

public class StochasticIntegrationTest extends
                                       TestCase
{
  public static final int prec = 128;

  public void testStandardWienerProcessWithMilsteinIntegrator()
  {
    IntStream.range(0, 1).forEach(i ->
    {
      BrownianMotion                                            B          = new BrownianMotion(new Real("1",
                                                                                                         128));
      DiffusionProcessState                                     state      = new DiffusionProcessState(new RandomState(i));

      MilsteinIntegrator<BrownianMotion, DiffusionProcessState> integrator = new MilsteinIntegrator<BrownianMotion, DiffusionProcessState>(B,
                                                                                                                                           state);
      testStochasticIntegrator(integrator);
    });
  }

  public void testStandardWienerProcessWithEulerIntegrator()
  {
    IntStream.range(0, 1).forEach(i ->
    {
      BrownianMotion B = new BrownianMotion(new Real("1",
                                                     128));
      try ( var integrator = new EulerIntegrator<BrownianMotion, DiffusionProcessState>(B,
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

    EvaluationSequence    samplePath  = integrator.integrate(interval, n, prec);
    Real                  μ           = samplePath.dimensions[0].mean(prec, new Real());
    Real                  sampleStdev = samplePath.dimensions[0].standardDeviation(prec, μ, new Real());
    assertTrue(sampleStdev.isFinite());
    Real populationStdev = integrator.diffusionProcess.σ().evaluate(state, 1, prec, new Real());
    populationStdev.printPrecision = true;
    sampleStdev.printPrecision     = true;
    μ.printPrecision               = true;
    sampleStdev.printPrecision     = true;

    double absMean = Math.abs(μ.doubleValue());
    Real   σδ      = sampleStdev.sub(populationStdev, prec).abs();
    assertTrue("absolute mean " + absMean + " is too far away from zero with seed=" + randomState.getInitialValue(),
               absMean < 0.2);
    assertTrue("population and sample σ " + σδ.toFixedString() + " is too far away from zero with seed="
                  + randomState.getInitialValue(),
               σδ.doubleValue() < 0.5);
  }

}
