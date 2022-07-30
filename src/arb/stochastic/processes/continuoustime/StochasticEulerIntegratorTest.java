package arb.stochastic.processes.continuoustime;

import static arb.RealConstants.zero;
import static arb.utensils.Utilities.println;

import arb.*;
import junit.framework.TestCase;

public class StochasticEulerIntegratorTest extends
                                           TestCase
{
  public static final int prec = 128;

  public void testStandardWienerProcessIntegration()
  {
    for (int i = 0; i < 5; i++)
    {
      RandomState randomState = new RandomState((int) (Math.random() * Integer.MAX_VALUE));
      println("testStandardWienerProcessIntegration  " + randomState);
      WienerProcess B = new WienerProcess(new Real("5",
                                                   128));
      try ( StochasticEulerIntegrator integrator = new StochasticEulerIntegrator(B))
      {
        FloatInterval         interval   = new FloatInterval(0,
                                                             10);
        int                   n          = 500 * 1000;

        DiffusionProcessState state      = new DiffusionProcessState();
        EvaluationSequence    samplePath = integrator.integrate(state, interval, n, randomState, prec);
        println("state=" + state);
        Real μ               = samplePath.values.arithmeticMean(prec, new Real());
        Real sampleStdev     = samplePath.values.standardDeviation(prec, μ, new Real());
        Real populationStdev = integrator.σ.evaluate(state, 1, prec, new Real());

        μ.printPrecision = true;
        System.out.println("       μ=" + μ);
        sampleStdev.printPrecision = true;
        System.out.println("populationStdev=" + populationStdev.toFixedString());
        System.out.println("    sampleStdev=" + sampleStdev.toFixedString());
        double absMean = Math.abs(μ.doubleValue());
        Real   σδ      = sampleStdev.sub(populationStdev, prec).abs();
        System.out.println("σδ=" + σδ);
        assert absMean < 0.15 : "absolute mean " + absMean + " is too far away from zero with seed="
                      + randomState.getInitialValue();
        assert σδ.doubleValue() < 0.5 : "population and sample σ " + σδ.toFixedString()
                      + " is too far away from zero with seed=" + randomState.getInitialValue();
      }
    }
  }

}
