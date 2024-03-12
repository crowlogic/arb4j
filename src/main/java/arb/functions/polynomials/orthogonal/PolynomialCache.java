package arb.functions.polynomials.orthogonal;

import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * first pass at <a href="https://github.com/crowlogic/arb4j/issues/314">
 * compiler: cache functions whose domain is the integers #314 </a>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class PolynomialCache
{
  private RealPolynomial[] cache = new RealPolynomial[1]; // Initial size of 1

  /**
   * Retrieves a polynomial from the cache.
   * 
   * @param key The index of the polynomial to retrieve.
   * @return The RealPolynomial at the specified index, or null if not set.
   */
  public RealPolynomial getCachedPolynomial(int key)
  {
    if (key < cache.length)
    {
      return cache[key];
    }
    return null; // Key is beyond the current cache size
  }

  /**
   * Adds or updates a polynomial in the cache at the specified index.
   * Automatically resizes the cache if the specified index is beyond the current
   * cache size.
   * 
   * @param key        The index at which to add or update the polynomial.
   * @param polynomial The RealPolynomial object to store in the cache.
   */
  public void addOrUpdatePolynomial(int key, RealPolynomial polynomial)
  {
    // Ensure the cache is large enough for the key
    if (key >= cache.length)
    {
      int              newSize  = Math.max(key + 1, cache.length * 2);
      RealPolynomial[] newCache = new RealPolynomial[newSize];
      System.arraycopy(cache, 0, newCache, 0, cache.length);
      cache = newCache;
    }
    cache[key] = polynomial;
  }
}
