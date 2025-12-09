package arb.functions;

import arb.algebra.Ring;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.*;

/**
 * @see BusinessSourceLicenseVersionOnePointOne copyright terms governing the
 *      {@link TheArb4jLibrary}
 * 
 * @param <R>
 */
public interface NullaryFunction<R> extends
                                Function<Object, R>
{

  @Override
  default Class<Object> domainType()
  {
    return Object.class;
  }

  public static <R extends Ring<?>, N extends NullaryFunction<? extends R>>
         Expression<Object, R, N>
         parse(Class<? extends R> elementType,
               Class<? extends N> nullaryFunctionType,
               String functionName,
               String expression,
               Context context)
  {
    return Function.parse(functionName != null ? functionName : Parser.hashString(expression),
                          expression,
                          context,
                          Object.class,
                          elementType,
                          nullaryFunctionType,
                          functionName,
                          null);
  }

  @SuppressWarnings("unchecked")
  public static <R, F extends Function<Object, R>>
         F
         express(Class<? extends R> coDomainClass, String functionName, String expression, Context context)
  {
    return (F) Function.instantiate(expression,
                                    context,
                                    Object.class,
                                    coDomainClass,
                                    NullaryFunction.class,
                                    functionName);
  }

  public static <R, F extends Function<Object, R>> F express(Class<? extends R> coDomainClass,
                                                             Class<? extends F> functionClass,
                                                             String expression)
  {
    return (F) Function.instantiate(expression, null, Object.class, coDomainClass, functionClass, null);
  }

  public static <R, F extends NullaryFunction<R>> F express(Class<? extends R> coDomainClass, String expression)
  {
    return express(coDomainClass, null, expression, null);
  }

  public default R evaluate(int bits, R realPolynomial)
  {
    assert realPolynomial != null : "realPolynomial should not be null";
    assert bits > 0 : "bits must be positive";
    int order = 0;
    return evaluate(order, bits, realPolynomial);
  }

  public default R evaluate(int order, int bits, R realPolynomial)
  {
    return evaluate(null, order, bits, realPolynomial);
  }

  /**
   * Invokes this{@link #evaluate(Object, int, int, Object)} after calling
   * this{@link #newCoDomainInstance()}
   * 
   * @param bits
   * @return newly allocated via this{@link #newCoDomainInstance()} element of
   *         type this{@link #coDomainType()}
   */
  public default R evaluate(int bits)
  {
    return evaluate(null, 0, bits, newCoDomainInstance());
  }

  public default R evaluate()
  {
    return evaluate(128);
  }

  public static <R extends Ring<?>, N extends NullaryFunction<? extends R>>
         Expression<Object, R, N>
         parse(Class<? extends R> domainClass, Class<? extends N> functionClass, String expression)
  {
    return parse(domainClass, functionClass, null, expression, null);
  }

}