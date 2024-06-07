package arb.stochastic;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class GaussianCharacteristicFunction implements
                                            CharacteristicFunction
{
  @Override
  public String toString()
  {
    return String.format("GaussianCharacteristicFunction[μ=%s, σ=%s]", μ, σ);
  }

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
  public Complex evaluate(Complex z, int order, int prec, Complex res)
  {
    order = Math.max(order, 1);
    assert order < 2;
    throw new UnsupportedOperationException("TODO: implement");
//     return z.pow(2, prec, res).mul(πsquared, prec, res).negate(res).exp(prec,
//     res).mul(sqrtπ, prec, res);
  }

}
