package arb.functions.real;

import arb.Real;
import arb.expressions.Context;
import arb.functions.Function;

/*
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @param <K> domain
 */
public interface RealFunctional<K> extends
                               Functional<K, Real, Real, RealFunction>
{
  public static <K> RealFunctional<K> express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static <K> RealFunctional<K> express(String expression)
  {
    return express(null, expression, null);
  }

  @SuppressWarnings("unchecked")
  public static <K> RealFunctional<K> express(String name, String expression, Context context)
  {
    return Function.express(Object.class, RealFunction.class, RealFunctional.class, name, expression, context);
  }

}