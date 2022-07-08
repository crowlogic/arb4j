package arb.stochastic.processes;

import arb.functions.real.densities.*;
import arb.probability.*;
import arb.stochastic.*;

public class GaussianProcess implements
                             StochasticProcess
{

  @Override
  public ProbabilityDensity getProbabilityDensity()
  {
    return new UnitCenteredGaussianProbabilityDensity();
  }

  @Override
  public CharacteristicFunction getCharacteristicFunction()
  {
    throw new UnsupportedOperationException("TODO: implement");
  }

}
