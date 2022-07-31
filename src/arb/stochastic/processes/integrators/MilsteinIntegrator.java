package arb.stochastic.processes.integrators;

import static arb.FloatConstants.one;

import arb.*;
import arb.Float;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;

public class MilsteinIntegrator extends
                                          AbstractStochasticIntegrator
{

  public MilsteinIntegrator(DiffusionProcess x)
  {
    super(x);
  }

  @Override
  public EvaluationSequence
         integrate(DiffusionProcessState coords, FloatInterval interval, int n, RandomState randomState, int prec)
  {
    assert false : "implement me";
    return null;
  }

  @Override
  public Float weakConvergenceOrder()
  {
    return one;
  }

  @Override
  public Float strongConvergenceOrder()
  {
    return one;
  }

}
