package arb.stochastic.processes.integrators;

import static arb.utensils.Utilities.*;

import java.util.stream.*;

import arb.*;
import arb.stochastic.processes.*;
import junit.framework.*;

public class StochasticIntegrationTest extends
                                       TestCase
{
  public static final int prec = 128;

  public void testStandardWienerProcessWithMilsteinIntegrator()
  {
    IntStream.range(0, 5).parallel().forEach(i ->
    {
      WienerProcess B = new WienerProcess(new Real("5",
                                                   128));
      try ( MilsteinIntegrator integrator = new MilsteinIntegrator(B,
                                                                   new DiffusionProcessState()))
      {
        testStochasticIntegrator(integrator);
      }
    });
  }

  public void testStandardWienerProcessWithEulerIntegrator()
  {
    IntStream.range(0, 5).parallel().forEach(i ->
    {
      WienerProcess B = new WienerProcess(new Real("5",
                                                   128));
      try ( EulerIntegrator integrator = new EulerIntegrator(B,
                                                             new DiffusionProcessState()))
      {
        testStochasticIntegrator(integrator);
      }
    });
  }

  protected void testStochasticIntegrator(AbstractStochasticIntegrator integrator)
  {
    FloatInterval         interval    = new FloatInterval(0,
                                                          10);
    int                   n           = 500 * 1000;

    DiffusionProcessState state       = integrator.state;
    RandomState           randomState = state.randomState;
    println("testStandardWienerProcessIntegration  " + randomState);
    randomState.setInitialValue((int) (Math.random() * Integer.MAX_VALUE));

    EvaluationSequence samplePath = integrator.integrate(interval, n, prec);
    println("state=" + state);
    Real μ               = samplePath.values.arithmeticMean(prec, new Real());
    Real sampleStdev     = samplePath.values.standardDeviation(prec, μ, new Real());
    Real populationStdev = ((AbstractStochasticIntegrator<DiffusionProcessState, WienerProcess>) integrator).X.σ()
                                                                                                              .evaluate(state,
                                                                                                                        1,
                                                                                                                        prec,
                                                                                                                        new Real());
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
