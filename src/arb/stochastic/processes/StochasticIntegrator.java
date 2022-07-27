package arb.stochastic.processes;

import arb.*;
import arb.Float;
import arb.dynamical.systems.DiscreteTimeDynamicalSystem;

public interface StochasticIntegrator extends
                                      DiscreteTimeDynamicalSystem
{

  /**
   * 
   * @param interval
   * @param prec     precision
   * @param X        upon entry it should be a Real vector of length n, upon
   *                 return its elements are the level
   * @param μ0       TODO
   * @param σ0       TODO
   * @return the resulting {@link Partition}, this{@link #dt}
   */
  public EvaluationSequence integrate(FloatInterval interval,
                             int prec,
                             int n,
                             DiffusionProcessCoordinates coords);
}
