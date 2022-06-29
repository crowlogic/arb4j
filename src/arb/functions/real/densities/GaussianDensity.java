package arb.functions.real.densities;

import arb.Real;
import arb.probability.ProbabilityDensity;

public class GaussianDensity implements
                             ProbabilityDensity
{

  @Override
  public Real evaluate(Real z, int order, int prec, Real res)
  {
    order = Math.max(order, 1);
    assert order < 2;
    return z.pow(2, prec, res).negate(res).exp( prec, res );
  }

}
