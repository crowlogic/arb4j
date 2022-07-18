package arb.stochastic;

import static arb.RealConstants.*;

import arb.FloatInterval;
import arb.Real;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.GaussianProcess;
import arb.viz.RealFunctionPlotter;

/**
 * Normal distributions are important in statistics and are often used in the
 * natural and social sciences to represent real-valued random variableExpressions whose
 * distributions are not known. Their importance is partly due to the central
 * limit theorem. It states that, under some conditions, the average of many
 * samples (observations) of a random variable with finite mean and variance is
 * itself a random variable—whose distribution converges to a normal
 * distribution as the number of samples increases. Therefore, physical
 * quantities that are expected to be the sum of many independent processes,
 * such as measurement errors, often have distributions that are nearly normal.
 * 
 * @see https://en.wikipedia.org/wiki/Normal_distribution
 */
public class GaussianDensityFunction implements
                                     DensityFunction
{

  public static void main(String args[])
  {
    GaussianProcess     gp      = new GaussianProcess(zero,
                                                      one);
    RealFunctionPlotter plotter = new RealFunctionPlotter(new GaussianDensityFunction(gp),
                                                          new FloatInterval(-5,
                                                                            5),
                                                          new FloatInterval(0,
                                                                            0.5),
                                                          500);
    plotter.plot();
  }

  @Override
  public String toString()
  {
    return "GaussianDensityFunction[μ=" + process.μ.toString(5) + ", σ=" + process.σ.toString(5) + "]";
  }

  public RealFunction     inv = new InverseGaussianDensityFunction(this);
  private GaussianProcess process;

  public GaussianDensityFunction(GaussianProcess gaussianProcess)
  {
    this.process = gaussianProcess;
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
    // e^(-(((x-μ)/σ)^2)/2)/(σ*√(2π))
    Real μ = process.μ;
    Real σ = process.σ;
    try ( Real t = new Real())
    {
      z.sub(μ, prec, t).div(σ, prec).pow(2, prec, result).div(2, prec).negate(result).exp(prec, result);
      return result.div(sqrt2π.mul(σ, prec, t), prec, result);
    }
  }

}
