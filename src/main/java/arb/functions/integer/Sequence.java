package arb.functions.integer;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.IntFunction;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.utensils.ShellFunctions;

/**
 * 
 * @param <C> the codomain of the {@link Function}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Sequence<C> extends
                         Function<Integer, C>,
                         IntFunction<C>
{
  /**
   * Cache for sequence values. Keys are (sequenceId, index) pairs.
   */
  static final ConcurrentHashMap<Long, Object> cache = new ConcurrentHashMap<>();

  static long cacheKey(int sequenceId, int index)
  {
    return ((long) sequenceId << 32) | (index & 0xFFFFFFFFL);
  }

  public default int bits()
  {
    return 128;
  }

  public default List<C> enumerate(int i, int j)
  {
    return ShellFunctions.seq(i, j, m -> evaluate(m, bits()));
  }

  @Override
  default C apply(int value)
  {
    return evaluate(value, bits());
  }

  @Override
  default Class<Integer> domainType()
  {
    return Integer.class;
  }

  @SuppressWarnings("unchecked")
  public default C evaluate(int t, int bits)
  {
    long key = cacheKey(System.identityHashCode(this), t);
    
    Object cached = cache.get(key);
    if (cached != null)
    {
      return (C) cached;
    }

    C result;
    try (Integer integer = new Integer(t))
    {
      result = evaluate(integer, bits);
    }

    if (result != null)
    {
      cache.put(key, result);
    }

    return result;
  }

  public default C evaluate(int t, int bits, C res)
  {
    try (Integer integer = new Integer(t))
    {
      return evaluate(integer, bits, res);
    }
  }

  public static <R, F extends Sequence<? extends R>, PD, PR, PF extends Function<? extends PD, ? extends PR>>
         Expression<Integer, R, F>
         parse(String className,
               String expressionString,
               Context context,
               Class<? extends R> coDomainClass,
               Class<? extends F> functionClass,
               String functionName,
               Expression<PD, PR, PF> containingExpression)
  {
    return Function.parse(className,
                          expressionString,
                          context,
                          Integer.class,
                          coDomainClass,
                          functionClass,
                          functionName,
                          containingExpression);
  }

  public static <Q> Sequence<? extends Q> express(String name,
                                                  Class<? extends Q> coDomainType,
                                                  String expression,
                                                  Class<? extends Sequence<Q>> functionClass)
  {
    return Function.express(name, Integer.class, coDomainType, functionClass, expression);
  }

  public static <Q> Sequence<? extends Q> express(String name,
                                                  Class<? extends Q> coDomainType,
                                                  String expression,
                                                  Class<? extends Sequence<Q>> functionClass,
                                                  Context context)
  {
    return Function.express(name, Integer.class, coDomainType, functionClass, expression, context);
  }

  public static <Q> Sequence<? extends Q> express(Class<? extends Q> coDomainType,
                                                  String expression,
                                                  Class<? extends Sequence<Q>> functionClass)
  {
    return Function.express(Integer.class, coDomainType, functionClass, expression);
  }

  public static <Q> Sequence<? extends Q> express(Class<? extends Q> coDomainType,
                                                  String expression,
                                                  Class<? extends Sequence<Q>> functionClass,
                                                  Context context)
  {
    return express(null, coDomainType, expression, functionClass, context);
  }

  public static <C, S extends Sequence<? extends C>>
         Expression<Integer, C, S>
         parse(String className, Class<S> seq, Class<C> coDomainType, String expr)
  {
    return Function.parse(className, expr, null, Integer.class, coDomainType, seq, expr, null);
  }

  public static <C, S extends Sequence<? extends C>>
         Expression<Integer, C, S>
         parse(String className, Class<S> seq, Class<C> coDomainType, String expr, Context context)
  {
    return Function.parse(className, expr, context, Integer.class, coDomainType, seq, null, null);
  }

}
