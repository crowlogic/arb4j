package arb.functions.integer;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.IntFunction;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
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
   * Cache for memoized sequence values. Keys are integer index values.
   */
  static final ConcurrentHashMap<SequenceCacheKey, Object> cache = new ConcurrentHashMap<>();

  /**
   * Key class for the memoization cache, combining sequence identity and index.
   */
  record SequenceCacheKey(int sequenceId, int index) {}

  /**
   * Returns whether this sequence should cache computed values.
   * Override to return true to enable memoization.
   * 
   * @return true if memoization is enabled
   */
  default boolean isMemoized()
  {
    return false;
  }

  /**
   * Enables or disables memoization for this sequence.
   * Default implementation does nothing - override in implementing classes.
   * 
   * @param memoize true to enable caching
   * @return this sequence for chaining
   */
  default Sequence<C> setMemoized(boolean memoize)
  {
    return this;
  }

  /**
   * Clears the memoization cache for this sequence.
   */
  default void clearCache()
  {
    int id = System.identityHashCode(this);
    cache.keySet().removeIf(key -> key.sequenceId() == id);
  }

  /**
   * Returns the number of cached values for this sequence.
   */
  default int cacheSize()
  {
    int id = System.identityHashCode(this);
    return (int) cache.keySet().stream().filter(key -> key.sequenceId() == id).count();
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
    // Check cache first if memoization is enabled
    if (isMemoized())
    {
      SequenceCacheKey key = new SequenceCacheKey(System.identityHashCode(this), t);
      Object cached = cache.get(key);
      if (cached != null)
      {
        return (C) cached;
      }
    }

    // Compute the value
    C result;
    try (Integer integer = new Integer(t))
    {
      result = evaluate(integer, bits);
    }

    // Cache if memoization is enabled
    if (isMemoized() && result != null)
    {
      SequenceCacheKey key = new SequenceCacheKey(System.identityHashCode(this), t);
      cache.put(key, result);
    }

    return result;
  }

  public default C evaluate(int t, int bits, C res)
  {
    try ( Integer integer = new Integer(t))
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
