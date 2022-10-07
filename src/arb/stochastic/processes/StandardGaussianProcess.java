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
    this.f = new StandardGaussianDistribution();
  }

  public StandardGaussianDensityFunction        p;

  public StandardGaussianCharacteristicFunction φ;

  public StandardGaussianDistribution           f;

  @Override
  public StandardGaussianDensityFunction getDensityFunction(Real t)
  {
    return p;
  }

  @Override
  public StandardGaussianCharacteristicFunction getCharacteristicFunction()
  {
    return φ;
  }

  @Override
  public StandardGaussianDistribution getDistributionFunction(Real t)
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
