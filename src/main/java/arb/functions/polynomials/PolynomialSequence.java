package arb.functions.polynomials;

import java.util.Iterator;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.integer.Sequence;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface PolynomialSequence<X, E> extends
                                   PolynomialBasis<X, E>,
                                   Sequence<E>
{

  public static <X, E> PolynomialSequence<X, E> express(String expression, Context context, Class<E> coDomainType)
  {
    return express(null, expression, context, coDomainType);
  }

  public static <X, E> PolynomialSequence<X, E> express(String expression, Class<E> coDomainType)
  {
    return express(null, expression, null, coDomainType);
  }

  @SuppressWarnings("unchecked")
  public static <X, E>
         PolynomialSequence<X, E>
         express(String name, String expression, Context context, Class<E> coDomainType)
  {
    return Function.express(Integer.class, coDomainType, PolynomialSequence.class, name, expression, context);
  }

  @Override
  default Iterator<E> iterator()
  {
    Integer n = new Integer();
    return new Iterator<>()
    {

      @Override
      public boolean hasNext()
      {
        return true;
      }

      @Override
      public E next()
      {
        E val = evaluate(n, 128);
        n.increment();
        return val;
      }
    };
  }

  /**
   * Returns a memoized (cached) version of this polynomial sequence.
   * 
   * <p>
   * The returned sequence caches computed polynomials so that repeated
   * evaluations at the same index return immediately without recomputation. This
   * is particularly useful for:
   * </p>
   * <ul>
   * <li>Recursive polynomial definitions where lower-order terms are needed
   * repeatedly</li>
   * <li>Iterative algorithms that access the same polynomials multiple times</li>
   * <li>Building operational matrices or Gram matrices from polynomial bases</li>
   * </ul>
   * 
   * @return A memoized wrapper around this sequence
   */
  @SuppressWarnings("unchecked")
  default MemoizedPolynomialSequence<X, E> memoize()
  {
    if (this instanceof MemoizedPolynomialSequence)
    {
      return (MemoizedPolynomialSequence<X, E>) this;
    }
    return new MemoizedPolynomialSequence<>(this,
                                            coDomainType());
  }

}
