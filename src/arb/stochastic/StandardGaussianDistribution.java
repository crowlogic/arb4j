package arb.stochastic;

import static arb.RealConstants.sqrt2π;

import arb.*;
import arb.functions.real.RealFunction;
import arb.utensils.*;

public class StandardGaussianDistribution implements
                                          ProbabilityDistributionFunction<StandardGaussianDensityFunction>
{
  public RealFunction inv = new InverseStandardGaussianDistributionFunction();

  public StandardGaussianDistribution()
  {

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
    // e^(-(x^2)/2)/√(2π)
    try ( Real t = new Real())
    {
      z.pow(2, prec, result).div(2, prec).negate(result).exp(prec, result);
      return result.div(sqrt2π, prec, result);
    }
  }

}
