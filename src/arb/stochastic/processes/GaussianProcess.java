package arb.stochastic.processes;

import arb.*;
import arb.stochastic.*;

/**
 * A Gaussian "white noise" process of specified mean and standard deviation
 * 
 *
 */
public class GaussianProcess implements
                             LévyProcess<GaussianDensityFunction, GaussianDistributionFunction, GaussianCharacteristicFunction>
{

  public GaussianProcess(Real μ, Real σ)
  {
    super();
    this.p = new GaussianDensityFunction(μ,
                                         σ);
    this.φ = new GaussianCharacteristicFunction(μ,
                                                σ);
    this.f = new GaussianDistributionFunction(μ,
                                              σ);
  }

  public GaussianDensityFunction        p;

  public GaussianCharacteristicFunction φ;

  public GaussianDistributionFunction   f;

  @Override
  public GaussianDensityFunction getDensityFunction()
  {
    return p;
  }

  @Override
  public GaussianCharacteristicFunction getCharacteristicFunction()
  {
    return φ;
  }

  @Override
  public GaussianDistributionFunction getDistributionFunction()
  {
    return f;
  }

}
