package arb.stochastic.processes.integrators;

import arb.*;
import arb.Float;
import arb.dynamical.systems.*;
import arb.stochastic.processes.*;

public interface StochasticIntegrator<S extends DiffusionProcessState, D extends DiffusionProcess<S>> extends
                                     DiscreteTimeDynamicalSystem<S>,
                                     AutoCloseable
{

  @Override
  public void close();

  /**
   * Calculate the {@link EvaluationSequence#i}-th value of step-length
   * {@link DiffusionProcessState#dt()} by calling {@link DiffusionProcess#μ()}
   * and {@link DiffusionProcess#σ()} and scaling by
   * {@link DiffusionProcessState#dt} accordingly. Does *not change the state*,
   * this is done by
   * this{@link #jump(DiffusionProcessState, int, EvaluationSequence)}
   * 
   * @param state
   * @param prec
   * @param evalSeq
   * @return
   */
  public EvaluationSequence step(S state, int prec, EvaluationSequence evalSeq);

  /**
   * Jump to the {@link DiffusionProcessState} in the given
   * {@link EvaluationSequence} after
   * this{@link #step(DiffusionProcessState, int, EvaluationSequence)} has been
   * called
   * 
   * @param state
   * @param prec
   * @param evalSeq
   * @return
   */
  public EvaluationSequence jump(S state, int prec, EvaluationSequence evalSeq);

  /**
   * Integrate the associated {@link DiffusionProcess} over a given interval which
   * is partitioned into a given number of elements resulting in some sufficiently
   * small mesh
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
