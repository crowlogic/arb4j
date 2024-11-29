package arb.functions.real;

import arb.expressions.Context;
import arb.functions.Function;

/*
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @param <K> domain
 */
public interface RealFunctional<K> extends
                               Function<K, RealFunction>
{
  public static <K> RealFunctional<K> express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static <K> RealFunctional<K> express(String expression)
  {
    return express(null, expression, null);
  }

  public static <K> RealFunctional<K> express(String name, String expression, Context context)
  {
    return Function.express(Object.class, RealFunction.class, RealFunctional.class, name, expression, context);
  }

}