package arb.stochastic.processes.integrators;

import arb.*;
import arb.Float;
import arb.stochastic.processes.*;

public class BivariateDiffusionProcessIntegrator<S extends DiffusionProcessState, X extends DiffusionProcess<S>, Y extends DiffusionProcess<S>>
                                                extends
                                                OrderedPair<StochasticIntegrator<S>, StochasticIntegrator<S>>
                                                implements
                                                StochasticIntegrator<S>
{

  private BivariateDiffusionProcess<S, X, Y> process;

  S                                          state;

  public BivariateDiffusionProcessIntegrator(BivariateDiffusionProcess<S, X, Y> process,
                                             S state,
                                             StochasticIntegrator<S> xIntegrator,
                                             StochasticIntegrator<S> yIntegrator,
                                             X x,
                                             Y y)
  {
    super(xIntegrator,
          yIntegrator);
    process    = new BivariateDiffusionProcess<>(x,
                                                 y);
    this.state = state;
  }

  DiffusionProcessState instantA = new DiffusionProcessState();
  DiffusionProcessState instantB = new DiffusionProcessState();

  @Override
  public EvaluationSequence jump(S state, int prec, EvaluationSequence evalSeq)
  {
    a.jump(state.cloneState(instantA), prec, evalSeq);
    b.jump(state.cloneState(instantB), prec, evalSeq);
    assert instantA.time().equals(instantB.time());
    return evalSeq;
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
