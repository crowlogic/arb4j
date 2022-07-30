package arb.stochastic.processes.continuoustime;

import static arb.RealConstants.*;
import static arb.utensils.Utilities.println;

import arb.*;
import junit.framework.TestCase;

public class StochasticEulerIntegratorTest extends
                                           TestCase
{
  public static final int prec = 128;

  public void testStandardWienerProcessIntegration()
  {
    RandomState     randomState = new RandomState((int) (Math.random() * Integer.MAX_VALUE));
    println( "testStandardWienerProcessIntegration  " + randomState );                  
    WienerProcess B           = new WienerProcess(one);
    try ( StochasticEulerIntegrator integrator = new StochasticEulerIntegrator(B,
                                                                               randomState))
    {
      FloatInterval         interval   = new FloatInterval(0,
                                                           5);
      int                   n          = 100 * 1000;

      DiffusionProcessState state      = new DiffusionProcessState();
      EvaluationSequence    samplePath = integrator.integrate(interval, prec, n, state);
      println("state=" + state );
      Real                  μ          = samplePath.values.arithmeticMean(prec, new Real());
      Real                  variance   = samplePath.values.variance(prec, μ, new Real());
      assert B.σ.equals(one);

      μ.printPrecision = true;
      System.out.println("       μ=" + μ);
      variance.printPrecision = true;
      System.out.println("variance=" + variance.toFixedString() );
      double absMean = Math.abs(μ.doubleValue());
      double σδ = Math.abs(samplePath.partition.δt.sub(variance, prec).doubleValue());
      assert absMean < 0.05 : "absolute mean " + absMean + " is too far away from zero with seed=" + randomState.getInitialValue();
      assert σδ < 9e-4: "population and simple σ " + σδ + " is too far away from zero with seed=" + randomState.getInitialValue();
      System.out.println( "σδ=" + σδ);
    }


  }

}
