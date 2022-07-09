package arb.stochastic.processes;

import arb.stochastic.characteristicfunctions.CharacteristicFunction;
import arb.stochastic.densities.*;

public interface StochasticProcess
{
  public ProbabilityDensity getProbabilityDensity();

  public CharacteristicFunction getCharacteristicFunction();

}
