package arb.stochastic.processes;

import arb.stochastic.characteristicfunctions.CharacteristicFunction;
import arb.stochastic.probabilitydensities.ProbabilityDensity;

public interface StochasticProcess
{
  public ProbabilityDensity getProbabilityDensity();

  public CharacteristicFunction getCharacteristicFunction();

}
