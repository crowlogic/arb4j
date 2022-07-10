package arb.stochastic.dynamics;

import arb.stochastic.*;

/**
 * A stochastic process is a family of random variables,<br>
 * <code>{X(t) : t ∈ T} <code> <br>
 * where t usually denotes time or a time-like variable
 */
public interface StochasticProcess
{
  public DensityFunction getDensityFunction();

  public DistributionFunction getDistributionFunction();

  public CharacteristicFunction getCharacteristicFunction();

}
