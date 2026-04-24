package arb.combinatorics;

import arb.Integer;
import arb.Real;
import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * The multinomial coefficient
 * <pre>
 *   C(n; k_1, k_2, ..., k_m) = n! / (k_1! · k_2! · ... · k_m!)
 * </pre>
 * where {@code n = k_1 + k_2 + ... + k_m}.
 *
 * <p>
 * Entries must be non-negative. The empty tuple has coefficient {@code 1}.
 * All arithmetic is exact via FLINT's {@code fmpz_fac_ui}.
 *
 * <p>
 * Static utility class — not a {@code Function} implementation, because the
 * multinomial does not fit a {@code Function<D, CO>} signature cleanly:
 * the natural domain is a vector of non-negative integers which no existing
 * arb domain type captures (and forcing an {@link arb.IntegerPolynomial}
 * encoding is awkward at the {@code int}/{@code long} boundary).
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class MultinomialCoefficient
{
  private MultinomialCoefficient()
  {
  }

  /**
   * Exact integer multinomial coefficient {@code (Σ k_i)! / ∏ k_i!}.
   *
   * @param counts  non-negative entries; may be empty (yielding 1)
   * @param result  receives the coefficient
   * @return {@code result}
   */
  public static Integer of(long[] counts, Integer result)
  {
    long sum = 0;
    for (int i = 0; i < counts.length; i++)
    {
      long c = counts[i];
      if (c < 0)
      {
        throw new IllegalArgumentException("counts must be non-negative at index "
                                           + i + ": " + c);
      }
      sum += c;
    }
    Integer.factorial(sum, result);
    if (counts.length == 0)
    {
      return result;
    }
    try ( Integer denom = new Integer(); Integer term = new Integer())
    {
      denom.set(1L);
      for (long c : counts)
      {
        Integer.factorial(c, term);
        denom.mul(term, denom);
      }
      result.div(denom, result);
    }
    return result;
  }

  /** Convenience overload for {@code int[]} counts. */
  public static Integer of(int[] counts, Integer result)
  {
    long[] longs = new long[counts.length];
    for (int i = 0; i < counts.length; i++)
    {
      longs[i] = counts[i];
    }
    return of(longs, result);
  }

  /**
   * Exact multinomial coefficient cast to a {@link Real} at the given
   * precision.
   */
  public static Real of(long[] counts, int bits, Real result)
  {
    try ( Integer integral = new Integer())
    {
      of(counts, integral);
      // bits retained for API symmetry; exact integer-to-Real conversion
      // does not truncate.
      return result.set(integral);
    }
  }

  /** Convenience overload for {@code int[]} counts. */
  public static Real of(int[] counts, int bits, Real result)
  {
    long[] longs = new long[counts.length];
    for (int i = 0; i < counts.length; i++)
    {
      longs[i] = counts[i];
    }
    return of(longs, bits, result);
  }

  /**
   * Exact multinomial coefficient cast to a {@link Complex} at the given
   * precision (imaginary part zero).
   */
  public static Complex of(long[] counts, int bits, Complex result)
  {
    try ( Integer integral = new Integer())
    {
      of(counts, integral);
      result.set(integral);
      return result;
    }
  }

  /** Convenience overload for {@code int[]} counts. */
  public static Complex of(int[] counts, int bits, Complex result)
  {
    long[] longs = new long[counts.length];
    for (int i = 0; i < counts.length; i++)
    {
      longs[i] = counts[i];
    }
    return of(longs, bits, result);
  }
}
