package arb.stochastic.processes.continuoustime.integrators;

import arb.*;
import arb.stochastic.processes.continuoustime.DiffusionProcess;
import arb.stochastic.processes.continuoustime.DiffusionProcessState;

public class StochasticMilsteinIntegrator extends
                                          AbstractStochasticIntegrator
{

  public StochasticMilsteinIntegrator(DiffusionProcess x)
  {
    super(x);
  }

  @Override
  public EvaluationSequence integrate(DiffusionProcessState coords, FloatInterval interval, int n, RandomState randomState, int prec)
  {
    assert false : "implement me";
    return null;
  }

  @Override
  public void evolve()
  {
    assert false : "implement me";
  }

}
