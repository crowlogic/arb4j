package arb.combinatorics;

import java.util.Arrays;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Enumerator factories for {@link IntegerPartition}s.
 *
 * <p>
 * The general-purpose {@link #of(int)} iterator uses the ZS1 algorithm of
 * Zoghbi &amp; Stojmenovi&#x107; (1998) &mdash; partitions emitted in
 * decreasing lexicographic order with O(1) amortized work per step and
 * O(n) working memory, no recursion.
 *
 * <p>
 * The bounded-length variant {@link #of(int, int)} restricts enumeration to
 * partitions with at most {@code maxLength} parts.
 *
 * @see IntegerPartition
 * @see BusinessSourceLicenseVersionOnePointOne &copy; terms of the
 *      {@link TheArb4jLibrary}
 */
public final class IntegerPartitions
{
  private IntegerPartitions()
  {
  }

  /**
   * Iterator over all integer partitions of {@code n} in decreasing
   * lexicographic order (e.g. for {@code n=4}: 4, 3+1, 2+2, 2+1+1, 1+1+1+1).
   *
   * @param n non-negative integer
   */
  public static Iterator<IntegerPartition> of(int n)
  {
    if (n < 0)
    {
      throw new IllegalArgumentException("n must be non-negative: " + n);
    }
    if (n == 0)
    {
      return singleton(new IntegerPartition(new int[0]));
    }
    return new ZS1(n);
  }

  /**
   * Iterator over integer partitions of {@code n} with at most
   * {@code maxLength} parts, in decreasing lexicographic order.
   *
   * @param n         non-negative
   * @param maxLength non-negative upper bound on the number of parts
   */
  public static Iterator<IntegerPartition> of(int n, int maxLength)
  {
    if (n < 0)
    {
      throw new IllegalArgumentException("n must be non-negative: " + n);
    }
    if (maxLength < 0)
    {
      throw new IllegalArgumentException("maxLength must be non-negative: "
                                         + maxLength);
    }
    if (n == 0)
    {
      return singleton(new IntegerPartition(new int[0]));
    }
    if (maxLength == 0)
    {
      return emptyIterator();
    }
    return new BoundedLength(n, maxLength);
  }

  /** Stream of all partitions of {@code n}. */
  public static Stream<IntegerPartition> stream(int n)
  {
    return asStream(of(n));
  }

  /** Stream of partitions of {@code n} with at most {@code maxLength} parts. */
  public static Stream<IntegerPartition> stream(int n, int maxLength)
  {
    return asStream(of(n, maxLength));
  }

  /**
   * {@code p(n)}, the number of partitions of {@code n}, via FLINT's
   * Hardy&ndash;Ramanujan&ndash;Rademacher evaluator.
   *
   * @param n      non-negative
   * @param result receives {@code p(n)}
   * @return result
   */
  public static Integer count(int n, Integer result)
  {
    return Integer.numberOfPartitions(n, result);
  }

  // ---------------------------------------------------------------------
  // ZS1 algorithm (Zoghbi & Stojmenović, 1998).
  //
  // Maintains x[1..m] as the current partition in descending order. The
  // auxiliary index h is the position of the last part that is >= 2; all
  // parts x[h+1..m] equal 1. Thus the count of trailing 1s is (m - h).
  //
  // To advance: if x[h] == 2, absorb it into the trailing 1s (one extra 1);
  // otherwise decrement x[h] to t = x[h] - 1 and repack the sum t + (m - h)
  // + 1 = (old x[h]) + (m - h) into copies of t followed by a remainder.
  // ---------------------------------------------------------------------
  private static final class ZS1
                             implements
                             Iterator<IntegerPartition>
  {
    private final int[] x;    // 1-based; slots 1..m are live
    private int         h;    // largest index with x[h] >= 2, or 0 if all 1s
    private int         m;    // index of the last part
    private boolean     done;

    ZS1(int n)
    {
      this.x    = new int[n + 1];
      this.x[1] = n;
      this.m    = 1;
      this.h    = (n >= 2) ? 1 : 0;
      this.done = false;
    }

    @Override
    public boolean hasNext()
    {
      return !done;
    }

    @Override
    public IntegerPartition next()
    {
      if (done)
      {
        throw new NoSuchElementException();
      }
      int[] parts = Arrays.copyOfRange(x, 1, m + 1);
      advance();
      return new IntegerPartition(parts);
    }

    private void advance()
    {
      if (h == 0)
      {
        // Current partition is all 1s, nothing follows.
        done = true;
        return;
      }
      if (x[h] == 2)
      {
        // Turn a trailing 2 into two 1s: x[h] := 1 and extend by one 1.
        x[h] = 1;
        m++;
        x[m] = 1;
        h--;
        return;
      }
      // x[h] >= 3. Decrement and repack.
      int t = x[h] - 1;
      x[h] = t;
      // Budget of trailing 1s to redistribute: old tail (m - h) trailing 1s
      // plus the 1 we just subtracted from x[h].
      int rem = (m - h) + 1;
      while (rem >= t)
      {
        h++;
        x[h] = t;
        rem -= t;
      }
      if (rem == 0)
      {
        m = h;
      }
      else
      {
        // Remainder part rem < t, placed at position h+1.
        m    = h + 1;
        x[m] = rem;
        // The new tail is either a single part >= 2 (rem) or a single 1.
        // If rem == 1, h stays at the position of the last >=2 part.
        // If rem >= 2, h advances to m.
        if (rem >= 2)
        {
          h = m;
        }
      }
      // Zero out any stale slots beyond m so subsequent snapshots are safe.
      for (int i = m + 1; i < x.length && x[i] != 0; i++)
      {
        x[i] = 0;
      }
    }
  }

  // ---------------------------------------------------------------------
  // Partitions with at most maxLength parts, in decreasing-lex order.
  //
  // Represent the state as parts[0..depth-1] where parts is descending and
  // sums to n, with depth <= maxLength. Advance by finding the rightmost
  // position i that can be decremented while keeping the result a valid
  // partition (descending, each part >= 1, total == n, length <= maxLength),
  // then greedily repack the tail with the maximum-lex suffix: fill with
  // copies of the new value at position i until the remainder fits in the
  // remaining slot budget.
  //
  // Greedy max-lex suffix: given remaining S to distribute in slotsLeft
  // slots with each part <= cap (= parts[i] after decrement) and each
  // part >= 1, the lex-max suffix is: put cap in slot i+1, then recursively
  // fill S - cap. This gives floor(S/cap) copies of cap then one part of
  // S mod cap if non-zero. But we must verify slotsLeft suffices AND that
  // the final part is >= 1. If S mod cap == 0 there is no final remainder.
  // ---------------------------------------------------------------------
  private static final class BoundedLength
                             implements
                             Iterator<IntegerPartition>
  {
    private final int   n;
    private final int   maxLength;
    private final int[] parts;
    private int         depth;
    private IntegerPartition next;

    BoundedLength(int n, int maxLength)
    {
      this.n         = n;
      this.maxLength = maxLength;
      this.parts     = new int[maxLength];
      // First in descending-lex is [n] (single part), provided maxLength>=1
      // and n>=1. Callers guarantee maxLength>=1 and n>=1.
      this.parts[0]  = n;
      this.depth     = 1;
      this.next      = snapshot();
    }

    private IntegerPartition snapshot()
    {
      return new IntegerPartition(Arrays.copyOf(parts, depth));
    }

    @Override
    public boolean hasNext()
    {
      return next != null;
    }

    @Override
    public IntegerPartition next()
    {
      if (next == null)
      {
        throw new NoSuchElementException();
      }
      IntegerPartition r = next;
      next = computeNext();
      return r;
    }

    /**
     * Advance to the next partition in descending-lex order. Walk positions
     * i from depth-1 down to 0. At each position, try decrementing parts[i]
     * to candidate = parts[i] - 1. The sum to redistribute across positions
     * i+1..maxLength-1 is {@code tail = parts[i]+...+parts[depth-1] - candidate}.
     * Also ensure candidate is consistent with parts[i-1] (parts[i-1] >=
     * candidate; since parts was descending and candidate < parts[i] <=
     * parts[i-1], this holds automatically).
     *
     * The max-lex repack is: floor(tail/candidate) copies of candidate then
     * one remainder part (tail mod candidate) if non-zero. Accept this
     * repack if the total length i + 1 + floor(tail/candidate) + (rem>0?1:0)
     * is <= maxLength.
     */
    private IntegerPartition computeNext()
    {
      for (int i = depth - 1; i >= 0; i--)
      {
        int candidate = parts[i] - 1;
        if (candidate < 1)
        {
          continue;
        }
        int sumFromI = 0;
        for (int j = i; j < depth; j++)
        {
          sumFromI += parts[j];
        }
        int tail = sumFromI - candidate;
        int full = tail / candidate;
        int rem  = tail % candidate;
        int newLength = (i + 1) + full + (rem > 0 ? 1 : 0);
        if (newLength > maxLength)
        {
          continue;
        }
        parts[i] = candidate;
        int pos = i + 1;
        for (int j = 0; j < full; j++)
        {
          parts[pos++] = candidate;
        }
        if (rem > 0)
        {
          parts[pos++] = rem;
        }
        depth = pos;
        return snapshot();
      }
      return null;
    }
  }

  // ---------------------------------------------------------------------
  // Utilities.
  // ---------------------------------------------------------------------
  private static Iterator<IntegerPartition> singleton(IntegerPartition p)
  {
    return new Iterator<>()
    {
      boolean taken;

      @Override
      public boolean hasNext()
      {
        return !taken;
      }

      @Override
      public IntegerPartition next()
      {
        if (taken)
        {
          throw new NoSuchElementException();
        }
        taken = true;
        return p;
      }
    };
  }

  private static Iterator<IntegerPartition> emptyIterator()
  {
    return new Iterator<>()
    {
      @Override
      public boolean hasNext()
      {
        return false;
      }

      @Override
      public IntegerPartition next()
      {
        throw new NoSuchElementException();
      }
    };
  }

  private static Stream<IntegerPartition>
         asStream(Iterator<IntegerPartition> it)
  {
    return StreamSupport.stream(Spliterators.spliteratorUnknownSize(it,
                                                                    Spliterator.ORDERED
                                                                                         | Spliterator.NONNULL
                                                                                         | Spliterator.DISTINCT),
                                false);
  }
}
