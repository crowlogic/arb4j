package arb.stochastic.processes.integrators;

import arb.*;
import arb.Float;
import arb.stochastic.processes.*;

public class BivariateDiffusionProcessIntegrator<S extends DiffusionProcessState, X extends DiffusionProcess<S>>
                                                extends
                                                OrderedPair<StochasticIntegrator<S, X>, StochasticIntegrator<S, X>>
                                                implements
                                                StochasticIntegrator<S, X>
{

  private X process;

  S         state;

  public BivariateDiffusionProcessIntegrator(BivariateDiffusionProcess<S> process,
                                             S state,
                                             StochasticIntegrator<S, X> xIntegrator,
                                             StochasticIntegrator<S, X> yIntegrator)
  {
    super(xIntegrator,
          yIntegrator);
    process    = new BivariateDiffusionProcess<>(xIntegrator.X(),
                                                 yIntegrator.X());
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

  @Override
  public X X()
  {
    return process;
  }

  @Override
  public void close()
  {
    state.close();
  }

}
