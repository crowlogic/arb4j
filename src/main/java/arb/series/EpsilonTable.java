package arb.series;

import arb.Field;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Wynn's epsilon table of a series over a field element type {@code X}: the
 * triangular array
 *
 * <pre>
 *   ε₋₁⁽ⁿ⁾ ≡ 0,   ε₀⁽ⁿ⁾ = S(n),
 *   ε_{k+1}⁽ⁿ⁾ = ε_{k-1}⁽ⁿ⁺¹⁾ + 1/(ε_k⁽ⁿ⁺¹⁾ − ε_k⁽ⁿ⁾),
 * </pre>
 *
 * whose even-order columns are the diagonal Padé approximants [m/m] of the
 * (possibly divergent / asymptotic) series. This object holds the table's live
 * state as a single moving anti-diagonal in one {@code X} vector (an {@code X}
 * <em>is</em> the vector — no Java arrays), so feeding one more partial sum with
 * {@link #next} advances the table in <b>O(order)</b> work and O(order) storage,
 * versus O(order²)/O(order²) for a rebuild. {@link #limit} drives it to the
 * resummed value.
 *
 * <p>
 * The algorithm is field-agnostic; a concrete table over {@link arb.Real} or
 * {@link arb.Complex} supplies only four primitives —
 * {@link #newVector}, {@link #isFinite}, {@link #setInfinite},
 * {@link #magnitude} — everything else (the update, the singular rule, the
 * resummation driver) lives here once.
 *
 * @param <X> the field element type
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class EpsilonTable<X extends Field<X>> implements
                                  AutoCloseable
{
  /** Moving anti-diagonal of the table (one handle — X is the vector). */
  protected final X    e;
  /** Forward-difference magnitude treated as exact convergence (2^-bits). */
  private final Real   tiny;

  private int          n           = 0;
  private long         cellUpdates = 0;

  protected EpsilonTable(int capacity, int bits)
  {
    e    = newVector(capacity);
    tiny = new Real();
    tiny.one().mul2e(-bits, tiny);
  }

  // ── the field-specific primitives (a handful of lines per element type) ──

  /** Allocate an {@code X} vector of the given dimension. */
  protected abstract X newVector(int capacity);

  /** The field's multiplicative-identity constant (1), for the reciprocal — not owned. */
  protected abstract X one();

  /** Whether {@code x} is finite (not the singular-rule infinity). */
  protected abstract boolean isFinite(X x);

  /** Set {@code x} to (the field's) infinity, in place. */
  protected abstract void setInfinite(X x);

  /** Write the magnitude |{@code x}| into the real {@code result}. */
  protected abstract void magnitude(X x, int bits, Real result);

  /** Number of partial sums consumed since construction or the last {@link #limit}. */
  public int count()
  {
    return n;
  }

  /**
   * Total inner-loop cell updates performed. After feeding m terms this is
   * 0+1+…+(m-1) = m(m-1)/2 — the running O(order)-per-term cost, not an
   * O(order²) per-term rebuild (≈ m³/6 total).
   */
  public long cellUpdates()
  {
    return cellUpdates;
  }

  /**
   * Advance the table by one partial sum S(n); {@code dst} receives the current
   * diagonal Padé approximant (the deepest even-order column), or the field's
   * infinity while that cell is still singular. Returns {@code dst}.
   */
  public X next(X sum, int bits, X dst)
  {
    X en = e.get(n);
    en.set(sum); // value-copy into the contiguous vector slot
    try ( X t1 = newVector(1); X t = newVector(1); X d = newVector(1);
          X recip = newVector(1); X val = newVector(1); Real mag = new Real())
    {
      t.zero();
      for (int j = n; j > 0; j--)
      {
        t1.set(t);
        X ej1 = e.get(j - 1);
        X ej  = e.get(j);
        t.set(ej1);
        ej.sub(t, bits, d);
        magnitude(d, bits, mag);
        if (mag.compareTo(tiny) <= 0)
        {
          setInfinite(ej1);          // Wynn singular rule: 1/0 → ∞ ⇒ next level adds 0
        }
        else
        {
          one().div(d, bits, recip);
          t1.add(recip, bits, val);
          ej1.set(val);
        }
        cellUpdates++;
      }
      X cell = e.get(n & 1);         // deepest even-order ε = diagonal Padé approximant
      dst.set(cell);
    }
    n++;
    return dst;
  }

  /**
   * Resum the series whose partial sums {@code partials} supplies for indices
   * {@code startIndex..maxOrder}: feed each into a fresh sweep of this table, keep
   * the diagonal estimate at the global smallest successive change, and stop when
   * consecutive estimates agree within {@code 2^(-bits/2)} or a raw partial sum is
   * non-finite. The resummed value is written to {@code result}.
   */
  public final X limit(TermSupplier<X> partials, int startIndex, int maxOrder, int bits, X result)
  {
    return limit(partials, startIndex, maxOrder, bits, bits, result);
  }

  /**
   * As {@link #limit(TermSupplier, int, int, int, Field)} but with the
   * intermediate working precision {@code workBits} (the precision at which the
   * partial sums are evaluated and the ε-recurrence is run) decoupled from
   * {@code thresholdBits} (the requested output precision that sets the stop test
   * {@code 2^(-thresholdBits/2)}). When the partial sums of a divergent asymptotic
   * series reach magnitude 2^M before they cancel, evaluating them at the output
   * precision leaves only (output−M) valid bits feeding the recurrence; raising
   * {@code workBits} above M+output restores a correct resummed value at the
   * requested output precision without inflating the request.
   */
  public final X limit(TermSupplier<X> partials, int startIndex, int maxOrder, int workBits, int thresholdBits, X result)
  {
    n           = 0;
    cellUpdates = 0;
    try ( X cur = newVector(1); X est = newVector(1); X prev = newVector(1);
          X d = newVector(1); X best = newVector(1);
          Real diff = new Real(); Real threshold = new Real(); Real bestMag = new Real())
    {
      threshold.one().mul2e(-thresholdBits / 2, threshold);
      bestMag.posInf();
      boolean started = false;
      for (int idx = startIndex; idx <= maxOrder; idx++)
      {
        partials.term(idx, workBits, cur);
        if (!isFinite(cur))
          break;
        next(cur, workBits, est);

        // the first non-trivial diagonal Padé [m/m] (m ≥ 1) appears at the 3rd term
        if (count() < 3 || !isFinite(est))
        {
          if (isFinite(est))
            best.set(est);
          continue;
        }
        if (!started)
        {
          best.set(est);
          prev.set(est);
          started = true;
          continue;
        }
        est.sub(prev, workBits, d);
        magnitude(d, workBits, diff);
        if (diff.compareTo(bestMag) < 0)
        {
          best.set(est);
          bestMag.set(diff);
        }
        if (diff.compareTo(threshold) <= 0)
          break;
        prev.set(est);
      }
      result.set(best);
    }
    return result;
  }

  @Override
  public void close()
  {
    e.close();
    tiny.close();
  }
}
