package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.NullaryFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RationalNullaryFunction extends NullaryFunction<RationalFunction>
{
  public static RationalNullaryFunction express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                RationalFunction.class,
                                RationalNullaryFunction.class,
                                functionName);
  }

  public static RationalNullaryFunction express(String string)
  {
    return express(null, string, null);
  }

 
}
