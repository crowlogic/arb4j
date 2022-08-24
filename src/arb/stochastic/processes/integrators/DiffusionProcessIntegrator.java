package arb.stochastic.processes.integrators;

import arb.Float;
import arb.FloatInterval;
import arb.Verifiable;
import arb.dynamical.systems.DiscreteTimeDynamicalSystem;
import arb.dynamical.systems.State;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;
import arb.stochastic.processes.EvaluationSequence;

public interface DiffusionProcessIntegrator<S extends State, D extends DiffusionProcess<S>> extends
                                           DiscreteTimeDynamicalSystem<S>,
                                           AutoCloseable,
                                           Verifiable
{

  @Override
  public void close();

  /**
   * Calculate the i-th value of step-length {@link DiffusionProcessState#dt()}
   * where i={@link DiffusionProcessState#index()} by calling
   * {@link DiffusionProcess#μ()} and {@link DiffusionProcess#σ()} and scaling by
   * {@link DiffusionProcessState#dt} accordingly. Does *not change the state*,
   * this is done by
   * this{@link #jump(DiffusionProcessState, int, EvaluationSequence)}
   * 
   * @param state
   * @param prec
   * @param evalSeq
   * @param dim     TODO
   * @return true if stepped, false if the process failed for some reason such as
   *         its value going beyond a boundary. In this case, another random
   *         sample from the same distribution should be generated and the process
   *         repeated until a value is found which does not cross the boundary,
   *         this is better than reflecting across 0 or truncating to 0, and
   *         should not introduce any additional bias in principle
   */
  public boolean step(S state, int prec, EvaluationSequence evalSeq);

  /**
   * Jump to the {@link DiffusionProcessState} in the given
   * {@link EvaluationSequence} after
   * this{@link #step(DiffusionProcessState, int, EvaluationSequence, int)} has
   * been called
   * 
   * @param state
   * @param prec
   * @param evalSeq
   * @return false if jump failed due to invalid state transition
   */
  public boolean jump(DiffusionProcessState state, int prec, EvaluationSequence evalSeq);

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

}
