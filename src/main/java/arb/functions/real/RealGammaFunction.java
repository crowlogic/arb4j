package arb.functions.real;

import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealGammaFunction implements
                           RealFunction
{

  @Override
  public String toString()
  {
    return "Γ";
  }

  public static final RealGammaFunction instance = new RealGammaFunction();

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    assert order <= 1 : "todo: orders >1";
    arblib.arb_gamma(res, t, bits);
    return res;
  }

}
