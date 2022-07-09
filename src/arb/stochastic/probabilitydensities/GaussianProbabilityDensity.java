package arb.stochastic.probabilitydensities;

import arb.Constants;
import arb.Real;
import arb.functions.real.RealFunction;

public class GaussianProbabilityDensity implements
                                        ProbabilityDensity
{
  /**
   * The parameter μ is the mean or expectation of the distribution (and also its
   * median and mode)
   */
  public Real                μ;

  /**
   * The parameter σ is its standard deviation of this distribution so the
   * variance of the distribution is σ^2. A random variable with a Gaussian
   * distribution is said to be normally distributed.
   */
  public Real                σ;

  public static RealFunction inv = new RealFunction()
                                 {
                                   @Override
                                   public Real evaluate(Real t, int order, int prec, Real res)
                                   {
                                     return Constants.ONE.div(t, prec, res).log(prec, res).sqrt(prec, res);
                                   }
                                 };

  public GaussianProbabilityDensity(Real μ, Real σ)
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
    return inv;
  }

  @Override
  public Real evaluate(Real z, int order, int prec, Real res)
  {
    order = Math.max(order, 1);
    assert order < 2;
    assert false : "TODO: implement";
    return z.pow(2, prec, res).negate(res).exp(prec, res);
  }

}
