package arb.functions.real;

import static arb.expressions.Expression.instantiate;

import arb.expressions.Context;
import arb.functions.Function;

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

}