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
public interface StochasticProcess<P extends DensityFunction, F extends DistributionFunction, C extends CharacteristicFunction<P>>
                                  extends
                                  ContinuousTimeDynamicalSystem
{
  public P getDensityFunction();

  public F getDistributionFunction();

  public C getCharacteristicFunction();

  public default Real sample(int prec, RandomState randomState, Real x)
  {
    return getDistributionFunction().sample(prec, randomState, x);
  }

}
