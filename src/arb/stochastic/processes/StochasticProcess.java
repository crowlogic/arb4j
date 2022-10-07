package arb.stochastic.processes;

import arb.Real;
import arb.RandomState;
import arb.dynamical.systems.*;
import arb.stochastic.*;

/**
 * A stochastic process is a family of random variables,<br>
 * <code>{X(t) : t ∈ T} <code> <br>
 * where t usually denotes time or a time-like variable
 */
public interface StochasticProcess extends
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

  public default <P extends RealProbabilityDensityFunction> P getDensityFunction()
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

  public default <F extends ProbabilityDistributionFunction> F getDistributionFunction()
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

  public default <C extends CharacteristicFunction> C getCharacteristicFunction()
  {
    return arb.utensils.Utilities.TODO("implement me");
  }

  public default Real sample(Real t, int prec, CorrelatedRandomVectorGenerator generator, Real x)
  {
    return getDistributionFunction().sample(generator, prec, x);
  }

}
