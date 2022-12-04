package arb.stochastic.processes;

import static arb.RealConstants.one;
import static arb.RealConstants.zero;

import arb.stochastic.CharacteristicFunction;
import arb.stochastic.StandardGaussianCharacteristicFunction;
import arb.stochastic.StandardGaussianDensityFunction;
import arb.stochastic.StandardGaussianDistribution;

/**
 * A Gaussian "white noise" process of zero mean and unit standard deviation and
 * variance
 */
public class StandardGaussianProcess implements
                                     LévyProcess
{

  @Override
  public String toString()
  {
    return "N[0,1]";
  }

  public StandardGaussianProcess()
  {
    super();
    this.p = new StandardGaussianDensityFunction();
    this.φ = new StandardGaussianCharacteristicFunction();
    this.f = new StandardGaussianDistribution();
  }

  public StandardGaussianDensityFunction        p;

  public StandardGaussianCharacteristicFunction φ;

  public StandardGaussianDistribution           f;

  @Override
  public StandardGaussianDensityFunction getDensityFunction()
  {
    return p;
  }

  @Override
  public CharacteristicFunction getCharacteristicFunction()
  {
    return φ;
  }

  @Override
  public StandardGaussianDistribution getDistributionFunction()
  {
    return f;
  }

  @Override
  public DriftCoeffecientFunction<DiffusionProcessState> μ()
  {
    return (arguments, order, precision, result) ->
    {
      return result.set(zero);
    };
  }

  @Override
  public DiffusionCoeffecientFunction<DiffusionProcessState> σ()
  {
    return (arguments, order, precision, result) ->
    {
      return result.set(one);
    };
  }

}
