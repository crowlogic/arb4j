package arb.functions.polynomials;

import java.util.concurrent.ConcurrentHashMap;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A memoizing wrapper for {@link PolynomialSequence} that caches computed
 * polynomial values.
 * 
 * <p>
 * This class wraps any polynomial sequence and maintains a cache of previously
 * computed polynomials. When a polynomial at index n is requested:
 * </p>
 * <ul>
 * <li>If it exists in the cache, the cached value is returned immediately</li>
 * <li>If not cached, the underlying sequence computes it, caches it, and
 * returns it</li>
 * </ul>
 * 
 * <p>
 * The cache uses a {@link ConcurrentHashMap} for thread-safe access. Cache keys
 * are the integer index values. Cached polynomials are independent copies to
 * prevent mutation issues.
 * </p>
 * 
 * <p>
 * Usage:
 * </p>
 * 
 * <pre>
 * RealPolynomialSequence jacobi = ...;
 * var memoized = new MemoizedPolynomialSequence<>(jacobi, RealPolynomial.class);
 * // or use the convenience method:
 * var memoized = jacobi.memoize();
 * </pre>
 *
 * @param <X> The coefficient/variable type of the polynomials
 * @param <P> The polynomial type (e.g., RealPolynomial, ComplexPolynomial)
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MemoizedPolynomialSequence<X, P> implements
                                       PolynomialSequence<X, P>
{
  private final PolynomialSequence<X, P>            delegate;
  private final ConcurrentHashMap<java.lang.Integer, P> cache;
  private final Class<P>                            polynomialClass;

  /**
   * Creates a memoized wrapper around the given polynomial sequence.
   * 
   * @param delegate        The underlying polynomial sequence to memoize
   * @param polynomialClass The class of polynomials returned by the sequence
   */
  public MemoizedPolynomialSequence(PolynomialSequence<X, P> delegate, Class<P> polynomialClass)
  {
    this.delegate        = delegate;
    this.polynomialClass = polynomialClass;
    this.cache           = new ConcurrentHashMap<>();
  }

  @Override
  public P evaluate(Integer n, int order, int bits, P result)
  {
    int key = n.getSignedValue();

    // Check cache first
    P cached = cache.get(key);
    if (cached != null)
    {
      return copyPolynomial(cached, result);
    }

    // Compute and cache
    P computed = delegate.evaluate(n, order, bits, result);

    // Store a copy in the cache to prevent mutation
    try
    {
      P cacheEntry = polynomialClass.getDeclaredConstructor().newInstance();
      copyPolynomial(computed, cacheEntry);
      cache.put(key, cacheEntry);
    }
    catch (Exception e)
    {
      // If we can't create a copy, just don't cache
      // This shouldn't happen for standard polynomial types
    }

    return computed;
  }

  @SuppressWarnings("unchecked")
  private P copyPolynomial(P source, P dest)
  {
    if (source instanceof arb.RealPolynomial srcPoly && dest instanceof arb.RealPolynomial dstPoly)
    {
      srcPoly.copyTo(dstPoly);
      return (P) dstPoly;
    }
    if (source instanceof arb.ComplexPolynomial srcPoly && dest instanceof arb.ComplexPolynomial dstPoly)
    {
      srcPoly.copyTo(dstPoly);
      return (P) dstPoly;
    }
    if (source instanceof arb.IntegerPolynomial srcPoly && dest instanceof arb.IntegerPolynomial dstPoly)
    {
      srcPoly.copyTo(dstPoly);
      return (P) dstPoly;
    }
    // Fallback: just return source (no copy)
    return source;
  }

  /**
   * Clears the memoization cache.
   */
  public void clearCache()
  {
    cache.clear();
  }

  /**
   * Returns the number of cached entries.
   * 
   * @return The cache size
   */
  public int cacheSize()
  {
    return cache.size();
  }

  /**
   * Checks if a value is cached for the given index.
   * 
   * @param n The index to check
   * @return true if the value is cached
   */
  public boolean isCached(int n)
  {
    return cache.containsKey(n);
  }

  @Override
  public Class<P> coDomainType()
  {
    return delegate.coDomainType();
  }
}
