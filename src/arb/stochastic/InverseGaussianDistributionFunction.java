package arb.stochastic;

import static arb.RealConstants.one;

import arb.Real;
import arb.RealConstants;
import arb.arb;
import arb.functions.real.RealFunction;

/**
 * The inverse of the {@link GaussianDistribution} is <br>
 * <code>
 *  μ + σ*InverseErf[2*x-1]*√2
 * </code> where μ is the mean and σ^2 is the variance of a normally distributed
 * random variable
 * 
 * @author crow
 *
 */
public final class InverseGaussianDistributionFunction implements
                                                       RealFunction
{
  public static void main(String args[])
  {
    assert false : "TODO: plot InverseGaussianDistributionFunction";
  }

  public InverseGaussianDistributionFunction(GaussianDistribution f)
  {
    this.f = f;
  }

  GaussianDistribution f;

  /**
   * @return res = μ + σ*InverseErf[2*x-1]*√2
   */
  @Override
  public Real evaluate(Real x, int order, int prec, Real res)
  {
    order = Math.max(0, order);
    assert order == 1 : "TODO: only 1st order implemented (for now)";
    arb.arb_hypgeom_erfinv(res, x.mul(2, prec, res).sub(one, prec, res), prec);
    res.mul(RealConstants.sqrt2, prec, res);
    res.mul(f.σ, prec, res);
    res.add(f.μ, prec, res);
    return res;
  }
}