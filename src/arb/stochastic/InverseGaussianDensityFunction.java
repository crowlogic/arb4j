package arb.stochastic;

import arb.Real;
import arb.RealConstants;
import arb.functions.real.RealFunction;

public final class InverseGaussianDensityFunction implements
                                                  RealFunction
{
  private GaussianDensityFunction f;

  public InverseGaussianDensityFunction(GaussianDensityFunction gaussianDensityFunction)
  {
    this.f = gaussianDensityFunction;
  }

  @Override
  public Real evaluate(Real t, int order, int prec, Real res)
  {
    assert false : "TODO";
    return RealConstants.one.div(t, prec, res).log(prec, res).sqrt(prec, res);
  }
}