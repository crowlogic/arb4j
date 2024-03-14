package arb.functions.complex.hyperbolic;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.OddFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HyperbolicTangent implements
                               OddFunction
{

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    assert (order = Math.max(1, order)) == 1 : "TODO: implement order>1";
    return t.tanh(prec, res);
  }

}
