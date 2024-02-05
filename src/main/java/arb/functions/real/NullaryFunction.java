package arb.functions.real;

import static arb.expressions.Expression.instantiate;

import arb.Real;
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

  public default R evaluate(Void t, int order, int bits, R result)
  {
    return evaluate(bits, result);
  }

  public R evaluate(int bits, R result);

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