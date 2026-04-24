package arb.combinatorics;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Enumerator factories for {@link WeightedComposition}s over a specified set
 * of allowed positive integer weights.
 *
 * <p>
 * The primary factories produce iterators over all compositions
 * {@code Σ weights[i] · multiplicities[i] = total} where {@code weights} is
 * drawn from a restricted set (all positives, odd only, or even only).
 *
 * <p>
 * Enumeration order: lexicographic on the multiplicity vector indexed by the
 * allowed-weight set in ascending weight order. Each returned
 * {@link WeightedComposition} contains only those weights with strictly
 * positive multiplicity.
 *
 * <p>
 * The enumeration is materialized eagerly: for the small totals arising in
 * the moment closed form ({@code total ≤ n} with {@code n} small) the number
 * of compositions {@code p(total)} is tiny. This eliminates the subtlety of
 * incremental advancement and makes correctness self-evident.
 *
 * @see WeightedComposition
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class WeightedCompositions
{
  private WeightedCompositions()
  {
  }

  /**
   * Iterator over compositions {@code total = Σ w·m_w} where the admissible
   * weights are the odd positive integers {@code {1,3,5,...}} not exceeding
   * {@code total}. This is the index set of the convolution sums {@code M_b}
   * (with {@code total = b}) and {@code N_{2c}} (with {@code total = 2c}) in
   * the moment closed form.
   *
   * @param total non-negative total weight
   */
  public static Iterator<WeightedComposition> ofOddWeights(int total)
  {
    if (total < 0)
    {
      throw new IllegalArgumentException("total must be non-negative: " + total);
    }
    return over(oddWeightsUpTo(total), total);
  }

  /**
   * Iterator over compositions {@code total = Σ w·m_w} where the admissible
   * weights are the even positive integers {@code {2,4,6,...}} not exceeding
   * {@code total}. This is the index set of the product
   * {@code ∏_{ℓ≥1} (...)^{k_{2ℓ+1}}} in the moment closed form when one
   * substitutes the weight {@code 2ℓ} for each exponent {@code k_{2ℓ+1}}.
   *
   * @param total non-negative total weight
   */
  public static Iterator<WeightedComposition> ofEvenWeights(int total)
  {
    if (total < 0)
    {
      throw new IllegalArgumentException("total must be non-negative: " + total);
    }
    return over(evenWeightsUpTo(total), total);
  }

  /**
   * General iterator: compositions of {@code total} over the given strictly
   * ascending set of positive integer weights.
   *
   * @param allowedWeights strictly ascending positive integers
   * @param total          non-negative total weight
   */
  public static Iterator<WeightedComposition> over(int[] allowedWeights,
                                                   int total)
  {
    int[] weights = validateWeights(allowedWeights);
    List<WeightedComposition> all = new ArrayList<>();
    if (total == 0)
    {
      all.add(new WeightedComposition(new int[0], new int[0]));
    }
    else if (weights.length > 0)
    {
      int[] multiplicities = new int[weights.length];
      enumerate(weights, multiplicities, weights.length - 1, total, all);
    }
    return all.iterator();
  }

  /** Stream of {@link #ofOddWeights(int)}. */
  public static Stream<WeightedComposition> streamOfOddWeights(int total)
  {
    return asStream(ofOddWeights(total));
  }

  /** Stream of {@link #ofEvenWeights(int)}. */
  public static Stream<WeightedComposition> streamOfEvenWeights(int total)
  {
    return asStream(ofEvenWeights(total));
  }

  /** Stream of {@link #over(int[], int)}. */
  public static Stream<WeightedComposition> streamOver(int[] allowedWeights,
                                                      int total)
  {
    return asStream(over(allowedWeights, total));
  }

  /**
   * Recursive descent: at the current index {@code idx}, try every
   * multiplicity {@code m} in {@code 0..remaining/weights[idx]}, recurse
   * on {@code idx-1} with {@code remaining - m*weights[idx]}. At
   * {@code idx == 0} emit if the residue is divisible by {@code weights[0]}.
   *
   * <p>
   * Emission order: we iterate {@code m} from largest to smallest at the
   * top level, giving descending-lex on the multiplicity vector in
   * highest-index position first. Flip the inner/outer loops to change
   * order; users should treat the order as implementation-defined and use
   * a set or sort when order matters.
   */
  private static void enumerate(int[] weights,
                                int[] multiplicities,
                                int idx,
                                int remaining,
                                List<WeightedComposition> out)
  {
    if (idx == 0)
    {
      if (remaining % weights[0] == 0)
      {
        multiplicities[0] = remaining / weights[0];
        out.add(snapshot(weights, multiplicities));
        multiplicities[0] = 0;
      }
      return;
    }
    int maxM = remaining / weights[idx];
    for (int m = maxM; m >= 0; m--)
    {
      multiplicities[idx] = m;
      enumerate(weights, multiplicities, idx - 1, remaining - m * weights[idx],
                out);
    }
    multiplicities[idx] = 0;
  }

  private static WeightedComposition snapshot(int[] weights,
                                              int[] multiplicities)
  {
    int nonzero = 0;
    for (int m : multiplicities)
    {
      if (m > 0)
      {
        nonzero++;
      }
    }
    int[] w  = new int[nonzero];
    int[] mm = new int[nonzero];
    int   k  = 0;
    for (int i = 0; i < multiplicities.length; i++)
    {
      if (multiplicities[i] > 0)
      {
        w[k]  = weights[i];
        mm[k] = multiplicities[i];
        k++;
      }
    }
    return new WeightedComposition(w, mm);
  }

  private static int[] oddWeightsUpTo(int total)
  {
    int count = (total + 1) / 2;
    int[] w = new int[count];
    for (int i = 0; i < count; i++)
    {
      w[i] = 2 * i + 1;
    }
    return w;
  }

  private static int[] evenWeightsUpTo(int total)
  {
    int count = total / 2;
    int[] w = new int[count];
    for (int i = 0; i < count; i++)
    {
      w[i] = 2 * (i + 1);
    }
    return w;
  }

  private static int[] validateWeights(int[] w)
  {
    for (int i = 0; i < w.length; i++)
    {
      if (w[i] <= 0)
      {
        throw new IllegalArgumentException("weights must be positive at index "
                                           + i + ": " + w[i]);
      }
      if (i > 0 && w[i - 1] >= w[i])
      {
        throw new IllegalArgumentException("weights must be strictly ascending at index "
                                           + i);
      }
    }
    return w.clone();
  }

  private static Stream<WeightedComposition>
         asStream(Iterator<WeightedComposition> it)
  {
    return StreamSupport.stream(Spliterators.spliteratorUnknownSize(it,
                                                                    Spliterator.ORDERED
                                                                                         | Spliterator.NONNULL
                                                                                         | Spliterator.DISTINCT),
                                false);
  }

  /** Number of compositions of {@code total} over the given weight set. */
  public static int count(int[] allowedWeights, int total)
  {
    int c = 0;
    Iterator<WeightedComposition> it = over(allowedWeights, total);
    while (it.hasNext())
    {
      it.next();
      c++;
    }
    return c;
  }

  /** Number of odd-weight compositions of {@code total}. */
  public static int countOfOddWeights(int total)
  {
    int c = 0;
    Iterator<WeightedComposition> it = ofOddWeights(total);
    while (it.hasNext())
    {
      it.next();
      c++;
    }
    return c;
  }

  /** Number of even-weight compositions of {@code total}. */
  public static int countOfEvenWeights(int total)
  {
    int c = 0;
    Iterator<WeightedComposition> it = ofEvenWeights(total);
    while (it.hasNext())
    {
      it.next();
      c++;
    }
    return c;
  }

  /** Unused-at-present helper retained for future refactors. */
  @SuppressWarnings("unused")
  private static List<WeightedComposition>
         sorted(List<WeightedComposition> list)
  {
    Collections.sort(list, (a, b) ->
    {
      int la = a.length();
      int lb = b.length();
      int lim = Math.min(la, lb);
      for (int i = 0; i < lim; i++)
      {
        int cmp = java.lang.Integer.compare(a.weight(i), b.weight(i));
        if (cmp != 0)
        {
          return cmp;
        }
        cmp = java.lang.Integer.compare(a.multiplicity(i), b.multiplicity(i));
        if (cmp != 0)
        {
          return cmp;
        }
      }
      return java.lang.Integer.compare(la, lb);
    });
    return list;
  }
}
