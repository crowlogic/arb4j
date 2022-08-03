package arb.stochastic.processes.integrators;

import arb.EvaluationSequence;
import arb.Float;
import arb.FloatInterval;
import arb.dynamical.systems.DiscreteTimeDynamicalSystem;
import arb.stochastic.processes.*;

public interface StochasticIntegrator<S extends DiffusionProcessState, D extends DiffusionProcess<S>> extends
                                     DiscreteTimeDynamicalSystem<S>
{
  
  public EvaluationSequence jump(S state, int prec, EvaluationSequence evalSeq);

  /**
   * 
   * @param interval the interval over which to integrate
   * @param n        number of pieces to split the interval into
   * @param prec     the number of bits of precision to use for the calculations
   * @return
   */
  public EvaluationSequence integrate(FloatInterval interval, int n, int prec);

  public default Float weakConvergenceOrder()
  {
    return weakConvergenceOrder(0);
  }

  public Float weakConvergenceOrder(int dim);

  public default Float strongConvergenceOrder()
  {
    return strongConvergenceOrder(0);
  }

  public Float strongConvergenceOrder(int dim);

  public D X();
}
