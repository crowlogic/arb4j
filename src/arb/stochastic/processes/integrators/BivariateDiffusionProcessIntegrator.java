package arb.stochastic.processes.integrators;

import arb.EvaluationSequence;
import arb.Float;
import arb.FloatInterval;
import arb.stochastic.processes.BivariateDiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;

public class BivariateDiffusionProcessIntegrator<S extends DiffusionProcessState> implements
                                                StochasticIntegrator<S>
{

  public BivariateDiffusionProcess process;

  public BivariateDiffusionProcessIntegrator(BivariateDiffusionProcess process, S state)
  {
    super();
    this.process = process;
    this.state   = state;
  }

  S state;

  @Override
  public EvaluationSequence jump(S state, int prec, EvaluationSequence evalSeq)
  {
    return null;
  }

  @Override
  public EvaluationSequence integrate(FloatInterval interval, int n, int prec)
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public Float weakConvergenceOrder(int dim)
  {
    assert false : "implement me";
    return null;

  }

  @Override
  public Float strongConvergenceOrder(int dim)
  {
    assert false : "implement me";
    return null;

  }

}
