package arb.stochastic;

import arb.Complex;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class StandardGaussianCharacteristicFunction implements
                                                    CharacteristicFunction
{

  @Override
  public String toString()
  {
    return String.format("StandardGaussianCharacteristicFunction");
  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex res)
  {
    order = Math.max(order, 1);
    assert order < 2;
    z.pow(2, prec, res).div(2, prec).negate().exp(prec).div(RealConstants.sqrt2π, prec);
    return res;
  }


}
