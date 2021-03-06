package arb.stochastic.processes;

import arb.Float;
import arb.FloatInterval;
import arb.Real;
import arb.dynamical.systems.DiscreteTimeDynamicalSystem;

public interface DiscretizationScheme extends
                                      DiscreteTimeDynamicalSystem
{

  /**
   * 
   * @param interval
   * @param prec     precision
   * @param μvector  upon entry it should be a Real vector of length n, upon
   *                 return its elements are the level
   * @param σvector  upon entry it should be a Real vector of length n
   * @param μ0       TODO
   * @param σ0       TODO
   * @return the resulting stepsize, this{@link #dt}
   */
  Real discretize(FloatInterval interval, int prec, Real μvector, Real σvector, Real dt, Real μ0, Real σ0);

}
