package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealIdentityFunction implements RealFunction
{

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return res.set(t);
  }

  public static RealIdentityFunction instance = new RealIdentityFunction();

}
