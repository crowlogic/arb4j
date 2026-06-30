package arb.functions;

import arb.Integer;
import arb.Real;

public final class ConvergentSeriesAccumulator implements
                                               AutoCloseable
{
  private final Real tolerance = new Real();

  private final Real termValue = new Real();

  private final Real absTerm   = new Real();

  private final Real best      = new Real();

  private final Real bestMag   = new Real();

  /**
   * The index at which the most recent {@link #accumulate} call truncated: the
   * index whose term first fell below tolerance, or — when tolerance was never
   * reached within the upper limit — the index of the smallest-magnitude term
   * (the optimal-truncation point whose partial sum is returned). Lets callers
   * differentiate the asymptotic series at exactly the order the value was
   * truncated to.
   */
  public int         truncationOrder;

  @SuppressWarnings("unchecked")
  public Real accumulate(@SuppressWarnings("rawtypes") Function term,
                         Integer index,
                         Integer upperLimit,
                         int bits,
                         Real sum)
  {
    sum.zero();
    tolerance.one().mul2e(-(bits / 2), tolerance);
    boolean haveBest = false;
    int     bestIdx  = index.getSignedValue();
    for (; index.compareTo(upperLimit) <= 0; index.increment())
    {
      term.evaluate(index, 1, bits, termValue);
      sum.add(termValue, bits, sum);
      termValue.abs(bits, absTerm);
      if (absTerm.compareTo(tolerance) <= 0)
      {
        truncationOrder = index.getSignedValue();
        return sum;
      }
      if (!haveBest || absTerm.compareTo(bestMag) < 0)
      {
        bestMag.set(absTerm);
        best.set(sum);
        bestIdx  = index.getSignedValue();
        haveBest = true;
      }
    }
    truncationOrder = bestIdx;
    return haveBest ? sum.set(best) : sum;
  }

  @Override
  public void close()
  {
    tolerance.close();
    termValue.close();
    absTerm.close();
    best.close();
    bestMag.close();
  }
}
