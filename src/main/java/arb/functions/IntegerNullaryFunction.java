package arb.functions;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface IntegerNullaryFunction extends
                                        NullaryFunction<Integer>
{
  public static IntegerNullaryFunction
         express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                Integer.class,
                                IntegerNullaryFunction.class,
                                functionName);
  }

  public static IntegerNullaryFunction express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static IntegerNullaryFunction express(String expression)
  {
    return express(null, expression, null);
  }

  static IntegerNullaryFunction compile(String expression)
  {
    return IntegerNullaryFunction.compile(expression, null);
  }

  static IntegerNullaryFunction compile(String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                Integer.class,
                                IntegerNullaryFunction.class,
                                null);
  }

}
