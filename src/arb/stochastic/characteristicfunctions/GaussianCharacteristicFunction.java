package arb.stochastic.characteristicfunctions;

import static arb.Constants.*;

import arb.*;
import arb.stochastic.probabilitydensities.GaussianProbabilityDensity;

public class GaussianCharacteristicFunction implements
                                            CharacteristicFunction<GaussianProbabilityDensity>
{
  public GaussianCharacteristicFunction(Real μ, Real σ)
  {
    super();
    this.μ = μ;
    this.σ = σ;
  }

  /**
   * The parameter μ is the mean or expectation of the distribution (and also its
   * median and mode)
   */
  public Real μ;

  /**
   * The parameter σ is its standard deviation of this distribution so the
   * variance of the distribution is σ^2. A random variable with a Gaussian
   * distribution is said to be normally distributed.
   */
  public Real σ;

  @Override
  public Real evaluate(Real z, int order, int prec, Real res)
  {
    order = Math.max(order, 1);
    assert order < 2;
    throw new UnsupportedOperationException("TODO: implement");
    //return z.pow(2, prec, res).mul(πsquared, prec, res).negate(res).exp(prec, res).mul(sqrtπ, prec, res);
  }

}
