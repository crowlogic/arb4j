package arb.functions.real;

import static arb.expressions.Expression.instantiate;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne copyright terms governing the {@link TheArb4jLibrary} 
 * 
 * @param <R>
 */
public interface NullaryFunction<R> extends
                                Function<Void, R>
{

 
  @SuppressWarnings("unchecked")
  public static <R, F extends NullaryFunction<R>>
         F
         express(Class<? extends R> rangeClass, String functionName, String expression, Context context)
  {
    return (F) instantiate(expression, context, Void.class, rangeClass, NullaryFunction.class, functionName);
  }

  public static <R> NullaryFunction<R> express(Class<? extends R> rangeClass, String expression)
  {
    return express(rangeClass, null, expression, null);
  }
}