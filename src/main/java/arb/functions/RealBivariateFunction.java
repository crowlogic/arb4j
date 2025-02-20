package arb.functions;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealBivariateFunction extends
                                       BivariateFunction<Real, RealFunction>
{

  public static RealBivariateFunction express(String expression)
  {
    return Function.express(Real.class, RealFunction.class, RealBivariateFunction.class, expression);
  }

}
