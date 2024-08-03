package arb.functions.real;

import arb.RationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.Function;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RationalFunctional extends Function<RationalFunction, RationalFunction>
{

  public static RationalFunctional express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                RationalFunction.class,
                                RationalFunction.class,
                                RationalFunctional.class,
                                functionName);
  }

  public static RationalFunctional express(String expression, Context context)
  {
    return express(null, expression, context);
  }
}
