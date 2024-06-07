package arb.stochastic;

import static arb.RealConstants.sqrt2π;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * The Gaussian distribution's probability density is a very important density
 * given by the function
 * 
 * <pre>
 *  p(x;μ,σ) = e^( -( ( ( x - μ ) ÷ σ )²) ÷ 2) ÷ ( σ * √(2π) )
 * </pre>
 * 
 * its importance is partly due to the central limit theorem. It states that,
 * under some conditions, the average of many samples (observations) of a random
 * variable with finite mean and variance is itself a whose distribution
 * converges to a normal distribution as the number of samples increases.
 * Therefore, physical quantities that are expected to be the sum of many
 * independent processes, such as measurement errors, often have distributions
 * that are nearly normal.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class GaussianDensityFunction implements
                                     RealProbabilityDensityFunction
{

  @Override
  public String toString()
  {
    return "GaussianDensityFunction[μ=" + μ.toString(5) + ", σ=" + σ.toString(5) + "]";
  }

  public RealFunction inv = new InverseGaussianDensityFunction(this);
  private Real        μ;
  private Real        σ;

  public GaussianDensityFunction(Real μ,
                                 Real σ)
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
  public Real evaluate(Real z, int order, int prec, Real result)
  {
    order = Math.max(order, 1);
    assert order < 2;
    // e^( -( ( ( x - μ ) ÷ σ )²) ÷ 2) ÷ ( σ * √(2π) )
    try ( Real t = new Real())
    {
      z.sub(μ, prec, t).div(σ, prec).pow(2, prec, result).div(2, prec).neg(result).exp(prec, result);
      return result.div(sqrt2π.mul(σ, prec, t), prec, result);
    }
  }

}
