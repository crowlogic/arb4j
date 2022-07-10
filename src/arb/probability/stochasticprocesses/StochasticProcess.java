package arb.probability.stochasticprocesses;

import arb.probability.*;

/**
 * A stochastic process is a family of random variables,<br>
 * <code>{X(t) : t ∈ T} <code> <br>
 * where t usually denotes time or a time-like variable
 */
public interface StochasticProcess
{
  public ProbabilityDensity getProbabilityDensity();

  public CharacteristicFunction getCharacteristicFunction();

}
