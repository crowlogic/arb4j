package arb.functions.complex;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexIdentityFunction implements ComplexFunction
{

  public static ComplexIdentityFunction instance = new ComplexIdentityFunction();

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex res)
  {
    return res.set(t);
  }

}
