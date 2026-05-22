package arb.functions;

import java.util.ArrayList;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Memoization cache keyed by a signed {@code int} index, backed by two
 * {@link ArrayList}s that grow on demand — one for non-negative indices, one for
 * negative — so a lookup is O(1) array indexing with no tree or hash navigation
 * and no per-access key allocation.
 *
 * <p>
 * This replaces the {@link java.util.TreeMap TreeMap}{@code <Integer,C>} cache
 * that generated function classes previously used for {@link Function#peek} /
 * {@link Function#poke}: profiling recursive-sequence evaluation showed
 * {@link arb.Integer#compareTo} (the red-black-tree comparator path) as the
 * dominant application hotspot, plus a per-{@code poke} {@code new arb.Integer}
 * key allocation. Array indexing removes both.
 *
 * <p>
 * Negative indices are supported: index {@code n < 0} maps to the negative list
 * at position {@code -n-1}. The original single-{@code ArrayList} cache could
 * not do this — it returned {@code null} for negative arguments and triggered
 * unbounded recompute on recurrences that reach them.
 *
 * <p>
 * A stored {@code null} is indistinguishable from "absent"; generated code only
 * ever pokes a non-null function or value instance, so {@code null} means
 * not-yet-cached. Not thread-safe — each function instance owns its own cache.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class IndexCache<C>
{
  /** Diagnostic counters — incremented on every {@link #get(int)}. Tests read these. */
  public static long         HITS   = 0, MISSES = 0;

  private final ArrayList<C> nonneg = new ArrayList<>();
  private final ArrayList<C> neg    = new ArrayList<>();

  /** @return the cached value at {@code index}, or {@code null} if not cached. */
  public C get(int index)
  {
    C v;
    if (index >= 0)
      v = index < nonneg.size() ? nonneg.get(index) : null;
    else
    {
      int i = -index - 1;
      v = i < neg.size() ? neg.get(i) : null;
    }
    if (v == null)
      MISSES++;
    else
      HITS++;
    return v;
  }

  /**
   * Store {@code value} at {@code index}, growing the relevant backing list with
   * {@code null} padding as needed.
   *
   * @return {@code value} (for call-site chaining)
   */
  public C put(int index, C value)
  {
    if (index >= 0)
      set(nonneg, index, value);
    else
      set(neg, -index - 1, value);
    return value;
  }

  private static <C> void set(ArrayList<C> list, int i, C value)
  {
    while (list.size() <= i)
      list.add(null);
    list.set(i, value);
  }

  /** Drop every cached value (used on {@code invalidateCache}). */
  public void clear()
  {
    nonneg.clear();
    neg.clear();
  }

  public boolean isEmpty()
  {
    return nonneg.isEmpty() && neg.isEmpty();
  }
}
