package arb.combinatorics;

import arb.Integer;
import arb.IntegerPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * Counts weighted compositions, as a {@link Function} from
 * {@link IntegerPolynomial} to {@link Integer}.
 *
 * <p>
 * The input {@link IntegerPolynomial} is interpreted as
 * {@code [total, w_1, w_2, ..., w_k]} where
 * <ul>
 * <li>coefficient 0 is the non-negative target {@code total}, and</li>
 * <li>coefficients {@code 1..k} are the strictly ascending positive allowed
 * weights {@code w_1 < w_2 < ... < w_k}.</li>
 * </ul>
 * The returned {@link Integer} is the number of multiplicity vectors
 * {@code (m_1, ..., m_k)} with non-negative integer entries satisfying
 * {@code Σ w_i · m_i = total}.
 *
 * <p>
 * When no allowed weights are supplied ({@code getLength() == 1}), the count
 * is {@code 1} if {@code total == 0} and {@code 0} otherwise. When
 * {@code total == 0} with any weight set, the count is {@code 1} (the empty
 * composition).
 *
 * @see WeightedCompositions
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class WeightedCompositionCountFunction implements
                                                    Function<IntegerPolynomial, Integer>
{
  @Override
  public Integer evaluate(IntegerPolynomial input,
                          int order,
                          int bits,
                          Integer res)
  {
    int len = input.getLength();
    if (len == 0)
    {
      // Empty polynomial ≡ [0]: total 0, no weights, exactly one (empty)
      // composition.
      res.set(1L);
      return res;
    }
    int total = input.get(0).getSignedValue();
    if (total < 0)
    {
      throw new IllegalArgumentException("total must be non-negative: " + total);
    }
    int k = len - 1;
    int[] weights = new int[k];
    for (int i = 0; i < k; i++)
    {
      int w = input.get(i + 1).getSignedValue();
      if (w <= 0)
      {
        throw new IllegalArgumentException("allowed weights must be positive at index "
                                           + (i + 1) + ": " + w);
      }
      if (i > 0 && weights[i - 1] >= w)
      {
        throw new IllegalArgumentException("allowed weights must be strictly ascending at index "
                                           + (i + 1));
      }
      weights[i] = w;
    }
    long count = WeightedCompositions.count(weights, total);
    res.set(count);
    return res;
  }

  @Override
  public Class<IntegerPolynomial> domainType()
  {
    return IntegerPolynomial.class;
  }

  @Override
  public Class<Integer> coDomainType()
  {
    return Integer.class;
  }
}
