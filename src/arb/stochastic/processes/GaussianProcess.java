package arb.stochastic.processes;

import arb.Real;
import arb.stochastic.*;

/**
 * A Gaussian "white noise" process of specified mean and standard deviation
 * 
 *
 */
public class GaussianProcess implements
                             LévyProcess

{
  public Real μ;

  public Real σ;

  public GaussianProcess(Real μ, Real σ)
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

  @Override
  public Real getMean()
  {
    return μ;
  }

  @Override
  public Real getStandardDeviation()
  {
    return σ;
  }

  @Override
  public DriftCoeffecientFunction μ()
  {
    return (arguments, order, precision, result) ->
    {
      return μ;
    };
  }

  @Override
  public DiffusionCoeffecientFunction σ()
  {
    return (arguments, order, precision, result) ->
    {
      return σ;
    };
  }

}
