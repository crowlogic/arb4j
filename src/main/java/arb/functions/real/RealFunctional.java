package arb.functions.real;

import arb.expressions.Context;
import arb.functions.Function;

/*
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

/**
 * 
 * @param <K> domain
 * @param <F> the co-domain which is a subclass of {@link RealFunction}
 */
public interface RealFunctional<K, F extends RealFunction> extends
                               Function<K, F>
{
  public static <K, F extends RealFunction> RealFunctional<K, F> express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static <K, F extends RealFunction> RealFunctional<K, F> express(String expression)
  {
    return express(null, expression, null);
  }

  public static <K,
                F extends RealFunction>
         RealFunctional<K, F>
         express(String name, String expression, Context context)
  {
    return Function.express(Object.class, RealFunction.class, RealFunctional.class, name, expression, context);
  }

}