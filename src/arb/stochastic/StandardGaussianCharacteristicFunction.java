package arb.stochastic;

import static arb.RealConstants.sqrtπ;
import static arb.RealConstants.πsquared;

import arb.Complex;

public class StandardGaussianCharacteristicFunction implements
                                                    CharacteristicFunction
{

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex res)
  {
    order = Math.max(order, 1);
    assert order < 2;
    return z.pow(2, prec, res).mul(πsquared, prec).negate().exp(prec).mul(sqrtπ, prec);
  }

}
