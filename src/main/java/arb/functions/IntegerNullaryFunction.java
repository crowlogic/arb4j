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

  default Integer evaluate()
  {
    return evaluate(0);
  }

}
