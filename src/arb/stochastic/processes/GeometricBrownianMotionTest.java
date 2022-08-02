package arb.stochastic.processes;

import static arb.utensils.Utilities.println;

import arb.*;
import arb.stochastic.processes.integrators.EulerIntegrator;
import junit.framework.TestCase;

public class GeometricBrownianMotionTest extends
                                         TestCase
{

  public void testEulerIntegration()
  {
    GeometricBrownianMotion gbm = new GeometricBrownianMotion();
    try ( EulerIntegrator integrator = new EulerIntegrator(gbm))
    {
      DiffusionProcessState state              = new DiffusionProcessState();

      EvaluationSequence    evaluationSequence = integrator.integrate(state,
                                                                      new FloatInterval(0,
                                                                                        1),
                                                                      500 ,
                                                                      128);
      println( state );
      for (OrderedPair x : evaluationSequence)
      {
        println(x);
      }
    }

  }

}
