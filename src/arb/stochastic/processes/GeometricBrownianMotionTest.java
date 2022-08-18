package arb.stochastic.processes;

import static arb.RealConstants.*;
import static arb.utensils.Utilities.println;

import arb.*;
import arb.stochastic.processes.integrators.AbstractDiffusionProcessIntegrator;
import arb.stochastic.processes.integrators.EulerIntegrator;
import junit.framework.TestCase;

public class GeometricBrownianMotionTest extends
                                         TestCase
{

  public void testEulerIntegration()
  {
    GeometricBrownianMotion gbm   = new GeometricBrownianMotion();
    DiffusionProcessState   state = new DiffusionProcessState();
    state.setValue(one);
    try ( AbstractDiffusionProcessIntegrator<DiffusionProcessState, GeometricBrownianMotion> integrator = new EulerIntegrator(gbm,
                                                                                                                              state))
    {
      EvaluationSequence evaluationSequence = integrator.integrate(new FloatInterval(0,
                                                                                     1),
                                                                   500,
                                                                   128);
      println(state);
      for (OrderedPair<Real, Real> x : evaluationSequence)
      {
        println(x);
      }
    }

  }

}
