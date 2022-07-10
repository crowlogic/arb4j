package arb.stochastic;

import static arb.Constants.*;

import arb.*;

public class UnitCenteredGaussianCharacteristicFunction implements
                                                        CharacteristicFunction<UnitCenteredGaussianProbabilityDensity>
{

  @Override
  public Real evaluate(Real z, int order, int prec, Real res)
  {
    order = Math.max(order, 1);
    assert order < 2;
    return z.pow(2, prec, res).mul(πsquared, prec, res).negate(res).exp(prec, res).mul(sqrtπ, prec, res);
  }

}
