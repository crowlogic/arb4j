package arb.stochastic.processes;

import arb.Real;
import arb.stochastic.*;

/**
 * A Gaussian "white noise" process of specified fixed mean and standard deviation
 * 
 *
 */
public class WhiteNoise implements
                             LévyProcess

{
  public Real μ;

  public Real σ;

  public WhiteNoise(Real μ, Real σ)
  {
    super();
    this.μ = μ;
    this.σ = σ;
    this.p = new GaussianDensityFunction(this);
    this.φ = new GaussianCharacteristicFunction(μ,
                                                σ);
    this.f = new GaussianDistributionFunction(μ,
                                              σ);
  }

  public GaussianDensityFunction        p;

  public GaussianCharacteristicFunction φ;

  public GaussianDistributionFunction   f;

  @Override
  public GaussianDensityFunction getDensityFunction(Real t)
  {
    return p;
  }

  @Override
  public GaussianCharacteristicFunction getCharacteristicFunction(Real t)
  {
    return φ;
  }

  @Override
  public GaussianDistributionFunction getDistributionFunction(Real t)
  {
    return f;
  }


  @Override
  public DriftCoeffecientFunction μ()
  {
    return (arguments, order, precision, result) ->
    {
      return result.set(μ);
    };
  }

  @Override
  public DiffusionCoeffecientFunction σ()
  {
    return (arguments, order, precision, result) ->
    {
      return result.set(σ);
    };
  }

}
