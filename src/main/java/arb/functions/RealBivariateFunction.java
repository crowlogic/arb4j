package arb.functions;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealBivariateFunction extends
                                       BivariateFunction<Real, Real, RealFunction>
{

  public static RealBivariateFunction express(String expression)
  {
    return Function.express(Real.class,
                            RealFunction.class,
                            RealBivariateFunction.class,
                            expression);
  }

  public static RealBivariateFunction express(String expression, Context context)
  {
    return Function.express(Real.class,
                            RealFunction.class,
                            RealBivariateFunction.class,
                            null,
                            expression,
                            context);
  }

  public static Expression<Real, RealFunction, RealBivariateFunction> parse(String expression)
  {
    return Function.parse(Real.class, RealFunction.class, RealBivariateFunction.class, expression);
  }

  public static Expression<Real, RealFunction, RealBivariateFunction> parse(String expression,
                                                                            Context context)
  {
    return Function.parse(Real.class,
                          RealFunction.class,
                          RealBivariateFunction.class,
                          expression,
                          context);
  }

}
