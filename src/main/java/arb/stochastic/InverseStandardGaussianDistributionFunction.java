package arb.stochastic;

import static arb.RealConstants.one;
import static arb.RealConstants.sqrt2;
import static arb.arblib.arb_hypgeom_erfinv;

import arb.Real;
import arb.functions.real.RealFunction;

public class InverseStandardGaussianDistributionFunction implements
                                                         RealFunction
{

  @Override
  public Real evaluate(Real x, int order, int prec, Real res)
  {
    order = Math.max(0, order);
    assert order == 1 : "TODO: only 1st order implemented (for now)";
    arb_hypgeom_erfinv(res, x.mul(2, prec, res).sub(one, prec, res), prec);
    res.mul(sqrt2, prec, res);
    return res;
  }

}
