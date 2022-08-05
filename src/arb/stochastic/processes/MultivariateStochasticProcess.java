
package arb.stochastic.processes;

import arb.dynamical.systems.*;

public interface MultivariateStochasticProcess<S extends State> extends
                                              ContinuousTimeDynamicalSystem
{
  /**
   * 
   * @return the dimension of this process
   */
  public int dim();

  public DiffusionProcess<S> get(int i);
}
