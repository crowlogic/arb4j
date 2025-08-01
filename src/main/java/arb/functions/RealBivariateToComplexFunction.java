package arb.functions;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * @author Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealBivariateToComplexFunction extends
                                                BivariateFunction<Real,
                                                              Complex,
                                                              RealToComplexFunction>
{
  public static RealBivariateToComplexFunction express(String expression)
  {
    return Function.express(Real.class,
                            RealToComplexFunction.class,
                            RealBivariateToComplexFunction.class,
                            expression);
  }

  public static RealBivariateToComplexFunction express(String expression, Context context)
  {
    return Function.express(Real.class,
                            RealToComplexFunction.class,
                            RealBivariateToComplexFunction.class,
                            null,
                            expression,
                            context);
  }
}
