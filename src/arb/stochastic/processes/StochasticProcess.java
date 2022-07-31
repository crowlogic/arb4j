package arb.stochastic.processes;

import static arb.utensils.Utilities.println;
import static org.junit.Assert.assertEquals;

import arb.RandomState;
import arb.Real;
import arb.dynamical.systems.ContinuousTimeDynamicalSystem;
import arb.stochastic.*;

/**
 * A stochastic process is a family of random variables,<br>
 * <code>{X(t) : t ∈ T} <code> <br>
 * where t usually denotes time or a time-like variable
 */
public interface StochasticProcess<P extends ProbabilityDensityFunction, F extends ProbabilityDistributionFunction, C extends CharacteristicFunction>
                                  extends
                                  ContinuousTimeDynamicalSystem
{
  public default P getDensityFunction(Real t)
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

  public default F getDistributionFunction(Real t)
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

  public default C getCharacteristicFunction(Real t)
  {
    return arb.utensils.Utilities.TODO("implement me");
  }

  public default Real sample(Real t, int prec, RandomState randomState, Real x)
  {
    return getDistributionFunction(t).sample(prec, randomState, x);
  }

}
