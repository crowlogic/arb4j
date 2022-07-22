package arb.stochastic.processes;

import arb.*;
import arb.stochastic.*;

/**
 * A Gaussian "white noise" process of zero mean and unit standard deviation and
 * variance
 */
public class StandardGaussianProcess implements
                                     LévyProcess<StandardGaussianDensityFunction, StandardGaussianDistributionFunction, StandardGaussianCharacteristicFunction>
{

  public StandardGaussianProcess()
  {
    super();
    this.p = new StandardGaussianDensityFunction();
    this.φ = new StandardGaussianCharacteristicFunction();
    this.f = new StandardGaussianDistributionFunction();
  }

  public StandardGaussianDensityFunction        p;

  public StandardGaussianCharacteristicFunction φ;

  public StandardGaussianDistributionFunction   f;

  @Override
  public StandardGaussianDensityFunction getDensityFunction()
  {
    return p;
  }

  @Override
  public StandardGaussianCharacteristicFunction getCharacteristicFunction()
  {
    return φ;
  }

  @Override
  public StandardGaussianDistributionFunction getDistributionFunction()
  {
    return f;
  }

  @Override
  public Real getMean()
  {
    return RealConstants.zero;
  }

  @Override
  public Real getStandardDeviation()
  {
    return RealConstants.one;
  }

}
