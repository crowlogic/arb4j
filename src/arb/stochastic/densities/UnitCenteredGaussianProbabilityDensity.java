package arb.stochastic.densities;

import arb.*;
import arb.functions.real.*;

public class UnitCenteredGaussianProbabilityDensity implements
                                         ProbabilityDensity
{

  public static RealFunction inv = new RealFunction()
  {
    @Override
    public Real evaluate(Real t, int order, int prec, Real res)
    {
      return Constants.one.div(t, prec, res).log(prec, res).sqrt(prec, res);
    }
  };

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
    return z.pow(2, prec, res).negate(res).exp(prec, res);
  }

}
