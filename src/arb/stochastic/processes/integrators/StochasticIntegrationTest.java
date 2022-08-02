package arb.stochastic.processes.integrators;

import static arb.utensils.Utilities.*;

import arb.*;
import arb.stochastic.processes.*;
import junit.framework.*;

public class StochasticIntegrationTest extends
                                       TestCase
{
  public static final int prec = 128;

  public void testStandardWienerProcessWithMilsteinIntegrator()
  {
    for (int i = 0; i < 5; i++)
    {
      WienerProcess B = new WienerProcess(new Real("5",
                                                   128));
      try ( MilsteinIntegrator integrator = new MilsteinIntegrator(B))
      {
        testStochasticIntegrator(integrator);
      }
    }
  }

  public void testStandardWienerProcessWithEulerIntegrator()
  {
    for (int i = 0; i < 5; i++)
    {
      WienerProcess B = new WienerProcess(new Real("5",
                                                   128));
      try ( EulerIntegrator integrator = new EulerIntegrator(B))
      {
        testStochasticIntegrator(integrator);
      }
    }
  }

  protected void testStochasticIntegrator(AbstractStochasticIntegrator integrator)
  {
    FloatInterval         interval    = new FloatInterval(0,
                                                          10);
    int                   n           = 500 * 1000;

    DiffusionProcessState state       = new DiffusionProcessState();
    RandomState           randomState = state.randomState;
    println("testStandardWienerProcessIntegration  " + randomState);
    randomState.setInitialValue((int) (Math.random() * Integer.MAX_VALUE));

    EvaluationSequence samplePath = integrator.integrate(state, interval, n, prec);
    println("state=" + state);
    Real μ               = samplePath.values.arithmeticMean(prec, new Real());
    Real sampleStdev     = samplePath.values.standardDeviation(prec, μ, new Real());
    Real populationStdev = ((AbstractStochasticIntegrator<DiffusionProcessState>) integrator).σ.evaluate(state,
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
