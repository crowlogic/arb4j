package arb.functions.complex;

import arb.Complex;
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
public interface ComplexNullaryFunction extends
                                        NullaryFunction<Complex>
{
  public static ComplexNullaryFunction express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                Complex.class,
                                ComplexNullaryFunction.class,
                                functionName);
  }

  public static ComplexNullaryFunction express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static ComplexNullaryFunction express(String expression)
  {
    return express(null, expression, null);
  }
}
