package arb.stochastic;

import static arb.RealConstants.sqrtπ;
import static arb.RealConstants.πsquared;

import arb.Complex;
import arb.Real;

public class StandardGaussianCharacteristicFunction implements
                                                    CharacteristicFunction
{

  @Override
  public Complex evaluate(Real z, int order, int prec, Complex res)
  {
    order = Math.max(order, 1);
    assert order < 2;
    z.pow(2, prec, res.getReal()).mul(πsquared, prec).negate().exp(prec).mul(sqrtπ, prec);
    return res;
  }

}
