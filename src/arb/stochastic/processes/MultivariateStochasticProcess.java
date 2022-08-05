
package arb.stochastic.processes;

import arb.RandomState;
import arb.Real;
import arb.dynamical.systems.ContinuousTimeDynamicalSystem;
import arb.stochastic.*;

/**
 * A stochastic process is a family of random variables,<br>
 * <code>{X(t) : t ∈ T} <code> <br>
 * where t usually denotes time or a time-like variable
 */
public interface MultivariateStochasticProcess extends
                                               ContinuousTimeDynamicalSystem
{
  /**
   * 
   * @return the dimension of this process
   */
  public default int dim()
  {
    return 1;
  }

  public default <P extends ProbabilityDensityFunction> P getDensityFunction(Real t)
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

  public default <F extends ProbabilityDistributionFunction> F getDistributionFunction(Real t)
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

  public default <C extends CharacteristicFunction> C getCharacteristicFunction(Real t)
  {
    return arb.utensils.Utilities.TODO("implement me");
  }

  public default Real sample(Real t, int prec, RandomState randomState, Real x)
  {
    return getDistributionFunction(t).sample(prec, randomState, x);
  }

}
