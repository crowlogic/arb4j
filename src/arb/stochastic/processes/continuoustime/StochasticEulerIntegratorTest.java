package arb.stochastic.processes.continuoustime;

import static arb.RealConstants.*;
import static arb.utensils.Utilities.println;

import arb.*;
import junit.framework.TestCase;

public class StochasticEulerIntegratorTest extends
                                           TestCase
{
  public static final int prec = 256;
  private Real            σ;

  public void testStandardWienerProcessIntegration()
  {
    RandomState     randomState = new RandomState((int) (Math.random() * Integer.MAX_VALUE));
    println( "testStandardWienerProcessIntegration  " + randomState );                  
    GaussianProcess B           = new WienerProcess(one);
    try ( StochasticEulerIntegrator integrator = new StochasticEulerIntegrator(B,
                                                                               randomState))
    {
      FloatInterval         interval   = new FloatInterval(0,
                                                           10);
      int                   n          = 300 * 1000;

      DiffusionProcessState state      = new DiffusionProcessState();
      EvaluationSequence    samplePath = integrator.integrate(interval, prec, n, state);
      println("state=" + state );
      Real                  μ          = samplePath.values.arithmeticMean(prec, new Real());
      Real                  variance   = samplePath.values.variance(prec, new Real());
      μ.printPrecision = true;
      System.out.println("       μ=" + μ);
      variance.printPrecision = true;
      System.out.println("variance=" + variance);
      double absMean = Math.abs(μ.doubleValue());
      double σδ = Math.abs(variance.doubleValue()-state.dt.doubleValue());
      println( "σδ=" + σδ);
      assert absMean < 0.04 : absMean + " is too far away from zero with seed=" + randomState.getInitialValue();
      assert σδ < 0.00005 : σδ + " is too far away from zero with seed=" + randomState.getInitialValue();
    }


  }

}
