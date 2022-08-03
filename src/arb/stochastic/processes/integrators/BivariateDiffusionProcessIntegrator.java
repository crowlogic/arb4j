package arb.stochastic.processes.integrators;

import arb.*;
import arb.Float;
import arb.dynamical.systems.*;
import arb.stochastic.processes.*;

public class BivariateDiffusionProcessIntegrator<S extends DiffusionProcessState> implements
                                                StochasticIntegrator<S>
{

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
  public Float weakConvergenceOrder()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public Float strongConvergenceOrder()
  {
    // TODO Auto-generated method stub
    return null;
  }

}
