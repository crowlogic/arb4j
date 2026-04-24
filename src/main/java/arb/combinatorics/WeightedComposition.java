package arb.combinatorics;

import java.util.Arrays;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * An immutable weighted composition: a finite multiset of positive integer
 * weights with prescribed total.
 *
 * <p>
 * Represented as two parallel arrays {@code weights} and {@code multiplicities}
 * of equal length, where {@code weights} is strictly ascending, all entries
 * of {@code multiplicities} are positive, and
 * {@code Σ weights[i] · multiplicities[i] = totalWeight()}.
 *
 * <p>
 * Typical usage is to enumerate compositions of a given {@link #totalWeight()}
 * restricted to a prescribed set of allowed weights (e.g. odd positive
 * integers for the convolution sums {@code M_b} and {@code N_{2c}} of the
 * moment closed form).
 *
 * @see WeightedCompositions
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class WeightedComposition
{
  private final int[] weights;
  private final int[] multiplicities;
  private final int   total;

  /**
   * @param weights        strictly ascending positive integer weights (length
   *                       may be 0 only for the empty composition)
   * @param multiplicities positive multiplicities, same length as
   *                       {@code weights}
   */
  public WeightedComposition(int[] weights, int[] multiplicities)
  {
    if (weights.length != multiplicities.length)
    {
      throw new IllegalArgumentException("weights and multiplicities length mismatch: "
                                         + weights.length + " vs "
                                         + multiplicities.length);
    }
    int t = 0;
    for (int i = 0; i < weights.length; i++)
    {
      int w = weights[i];
      int m = multiplicities[i];
      if (w <= 0)
      {
        throw new IllegalArgumentException("weights must be positive at index "
                                           + i + ": " + w);
      }
      if (m <= 0)
      {
        throw new IllegalArgumentException("multiplicities must be positive at index "
                                           + i + ": " + m);
      }
      if (i > 0 && weights[i - 1] >= w)
      {
        throw new IllegalArgumentException("weights must be strictly ascending at index "
                                           + i + ": " + weights[i - 1]
                                           + " >= " + w);
      }
      t += w * m;
    }
    this.weights        = weights.clone();
    this.multiplicities = multiplicities.clone();
    this.total          = t;
  }

  /** The total weight {@code Σ weights[i] · multiplicities[i]}. */
  public int totalWeight()
  {
    return total;
  }

  /** Number of distinct weights present. */
  public int length()
  {
    return weights.length;
  }

  /** The i-th distinct weight, {@code 0 ≤ i < length()}, ascending. */
  public int weight(int i)
  {
    return weights[i];
  }

  /** The multiplicity of the i-th distinct weight. */
  public int multiplicity(int i)
  {
    return multiplicities[i];
  }

  /** Defensive copy of the weights array. */
  public int[] weights()
  {
    return weights.clone();
  }

  /** Defensive copy of the multiplicities array. */
  public int[] multiplicities()
  {
    return multiplicities.clone();
  }

  /**
   * Number of parts, i.e. {@code Σ multiplicities[i]}.
   */
  public int numberOfParts()
  {
    int s = 0;
    for (int m : multiplicities)
    {
      s += m;
    }
    return s;
  }

  /**
   * Multinomial-type factor {@code (Σ multiplicities)! / ∏ multiplicities!} used
   * in the closed-form convolution sums {@code M_b}, {@code N_{2c}}. Overflow
   * into {@code long} is possible; callers needing arbitrary precision should
   * recompute using {@link arb.Integer#factorial}.
   */
  public long permutationCount()
  {
    int  k = numberOfParts();
    long num = 1L;
    for (int i = 2; i <= k; i++)
    {
      num *= i;
    }
    long den = 1L;
    for (int m : multiplicities)
    {
      long mf = 1L;
      for (int i = 2; i <= m; i++)
      {
        mf *= i;
      }
      den *= mf;
    }
    return num / den;
  }

  @Override
  public boolean equals(Object o)
  {
    return o instanceof WeightedComposition w
                  && Arrays.equals(weights, w.weights)
                  && Arrays.equals(multiplicities, w.multiplicities);
  }

  @Override
  public int hashCode()
  {
    return 31 * Arrays.hashCode(weights) + Arrays.hashCode(multiplicities);
  }

  @Override
  public String toString()
  {
    if (weights.length == 0)
    {
      return "()";
    }
    StringBuilder sb = new StringBuilder();
    sb.append('(');
    for (int i = 0; i < weights.length; i++)
    {
      if (i > 0)
      {
        sb.append('+');
      }
      sb.append(multiplicities[i]).append('*').append(weights[i]);
    }
    sb.append(')');
    return sb.toString();
  }
}
