package arb.stochastic;

import static arb.RealConstants.*;

import arb.Complex;
import arb.Real;

public class StandardGaussianCharacteristicFunction implements
                                                    CharacteristicFunction<StandardGaussianDensityFunction>
{

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex res)
  {
    order = Math.max(order, 1);
    assert order < 2;
    return z.pow(2, prec, res).mul(πsquared, prec, res).negate(res).exp(prec, res).mul(sqrtπ, prec, res);
  }

}
