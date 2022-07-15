package arb.stochastic.processes;

import arb.RandomState;
import arb.Real;
import arb.stochastic.*;

/**
 * A stochastic process is a family of random variables,<br>
 * <code>{X(t) : t ∈ T} <code> <br>
 * where t usually denotes time or a time-like variable
 */
public interface StochasticProcess<P extends DensityFunction, F extends DistributionFunction, C extends CharacteristicFunction<P>>
{
  public P getDensityFunction();

  public F getDistributionFunction();

  public C getCharacteristicFunction();

  public default Real sample(int prec, RandomState randomState, Real u, Real x)
  {
    return getDistributionFunction().sample(prec, randomState, u, x);    
  }
}
