package arb.stochastic.processes;

import static arb.RealConstants.one;

import arb.RandomState;
import arb.stochastic.processes.integrators.AbstractDiffusionProcessIntegrator;
import arb.stochastic.processes.integrators.EulerIntegrator;
import junit.framework.TestCase;

public class GeometricBrownianMotionTest extends
                                         TestCase
{

  public void testEulerIntegration()
  {
    GeometricBrownianMotion gbm   = new GeometricBrownianMotion();
    DiffusionProcessState   state = new DiffusionProcessState(new RandomState(420));
    state.setValue(one);
    try ( AbstractDiffusionProcessIntegrator<DiffusionProcessState, GeometricBrownianMotion> integrator = new EulerIntegrator<GeometricBrownianMotion, DiffusionProcessState>(gbm,
                                                                                                                              state))
    {
//      EvaluationSequence evaluationSequence = integrator.integrate(new FloatInterval(0,
//                                                                                     1),
//                                                                   500,
//                                                                   128);
      // TODO: assert something here
//      println(state);
//      for (OrderedPair<Real, Real> x : evaluationSequence)
//      {
//        println(x);
//      }
    }

  }

}
