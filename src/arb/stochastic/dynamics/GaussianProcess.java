package arb.stochastic.dynamics;

import arb.*;
import arb.stochastic.*;

/**
 * A Gaussian "white noise" process of specified mean and standard deviation
 * 
 *
 */
public class GaussianProcess implements
                             LévyProcess
{

  public GaussianProcess(Real μ, Real σ)
  {
    super();
    this.p = new GaussianDensityFunction(μ,
                                            σ);
    φ      = new GaussianCharacteristicFunction(μ,
                                                σ);
  }

  public GaussianDensityFunction     p;

  public GaussianCharacteristicFunction φ;

  @Override
  public DensityFunction getDensityFunction()
  {
    return p;
  }

  @Override
  public CharacteristicFunction getCharacteristicFunction()
  {
    return φ;
  }

  @Override
  public DistributionFunction getDistributionFunction()
  {
    assert false : "TODO: implement";
    return null;
  }

}
