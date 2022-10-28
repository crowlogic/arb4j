package arb.stochastic;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.functions.real.RealFunction;

public class StandardGaussianDensityFunction implements
                                             RealProbabilityDensityFunction
{

  public static final RealFunction inv = (t, order, prec, res) -> RealConstants.one.div(t, prec, res)
                                                                                   .log(prec)
                                                                                   .sqrt(prec);

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
    return z.pow(2, prec, res).negate().exp(prec);
  }

  public Real evaluate(Complex point, int order, int prec, Real real)
  {
    return evaluate(point.getReal(), order, prec, real);

  }

}
