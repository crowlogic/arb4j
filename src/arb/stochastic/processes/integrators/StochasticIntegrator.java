package arb.stochastic.processes.integrators;

import arb.*;
import arb.Float;
import arb.dynamical.systems.*;
import arb.stochastic.processes.*;

public interface StochasticIntegrator<S extends DiffusionProcessState> extends
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

  public Float weakConvergenceOrder();

  public Float strongConvergenceOrder();
}
