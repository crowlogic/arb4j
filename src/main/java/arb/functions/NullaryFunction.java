package arb.functions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * @see BusinessSourceLicenseVersionOnePointOne copyright terms governing the
 *      {@link TheArb4jLibrary}
 * 
 * @param <R>
 */
public interface NullaryFunction<R> extends
                                Function<Object, R>
{

  @SuppressWarnings("unchecked")
  public static <R, F extends Function<Object, R>>
         F
         express(Class<? extends R> coDomainClass,
                 String functionName,
                 String expression,
                 Context context)
  {
    return (F) Function.instantiate(expression,
                                    context,
                                    Object.class,
                                    coDomainClass,
                                    NullaryFunction.class,
                                    functionName);
  }

  public static <R, F extends Function<Object, R>>
         F
         express(Class<? extends R> coDomainClass,
                 String expression)
  {
    return express(coDomainClass,
                   null,
                   expression,
                   null);
  }

  public default R
         evaluate(int bits,
                  R realPolynomial)
  {
    return evaluate(null,
                    0,
                    bits,
                    realPolynomial);
  }

  /**
   * Invokes this{@link #evaluate(Object, int, int, Object)} after calling
   * this{@link #newCoDomainInstance()}
   * 
   * @param bits
   * @return newly allocated via this{@link #newCoDomainInstance()} element of
   *         type this{@link #coDomainType()}
   */
  public default R
         evaluate(int bits)
  {
    return evaluate(null,
                    0,
                    bits,
                    newCoDomainInstance());
  }
}