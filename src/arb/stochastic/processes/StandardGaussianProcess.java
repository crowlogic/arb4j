package arb.stochastic.processes;

import static arb.RealConstants.*;

import arb.*;
import arb.functions.real.*;
import arb.stochastic.*;

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
    return zero;
  }

  @Override
  public Real getStandardDeviation()
  {
    return one;
  }

  @Override
  public DriftCoeffecientFunction μ()
  {
    return (arguments, order, precision, result) ->
    {
      return zero;
    };
  }

  @Override
  public DiffusionCoeffecientFunction σ()
  {
    return (arguments, order, precision, result) ->
    {
      return one;
    };
  }

}
