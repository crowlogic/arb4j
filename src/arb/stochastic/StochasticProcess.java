package arb.stochastic;

import arb.functions.real.*;
import arb.probability.*;

public interface StochasticProcess
{
  public ProbabilityDensity getProbabilityDensity();

  public CharacteristicFunction getCharacteristicFunction();

}
