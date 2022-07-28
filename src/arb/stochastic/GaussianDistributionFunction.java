package arb.stochastic;

import static arb.RealConstants.*;

import arb.*;
import arb.functions.real.*;

/**
 * The cumulative distribution function for the Gaussian distribition. The
 * integral of the {@link GaussianDensityFunction}, which is equal to
 * (1+erf((x-μ)/(σ√2)))/2
 */
public class GaussianDistributionFunction implements
                                          ProbabilityDistributionFunction
{

  @Override
  public String toString()
  {
    return "GaussianDistributionFunction[μ=" + μ.toString(5) + ", σ=" + σ.toString(5) + "]";
  }

  /**
   * The parameter μ is the mean or expectation of the distribution (and also its
   * median and mode)
   */
  public Real         μ;

  /**
   * The parameter σ is the standard deviation of this distribution so its
   * variance is σ^2. A random variable with a Gaussian distribution is said to be
   * normally distributed.
   */
  public Real         σ;

  public RealFunction inv = new InverseGaussianDistributionFunction(this);

  public GaussianDistributionFunction(Real μ, Real σ)
  {
    this.μ = μ;
    this.σ = σ;
  }

  @Override
  public int getInverseBranchCount()
  {
    return 1;
  }

  @Override
  public RealFunction inverse(int branch)
  {
    assert branch == 0 : "only 1 branch";
    return inv;
  }

  @Override
  public Real evaluate(Real z, int order, int prec, Real result)
  {
    order = Math.max(order, 1);
    assert order < 2;
    assert false : "TODO: implement 'error' function erf";
    // e^(-(((x-μ)/σ)^2)/2)/(σ*√(2π))
    try ( Real t = new Real())
    {
      z.sub(μ, prec, t).div(σ, prec).pow(2, prec, result).div(2, prec).negate(result).exp(prec, result);
      return result.div(sqrt2π.mul(σ, prec, t), prec, result);
    }
  }

}
