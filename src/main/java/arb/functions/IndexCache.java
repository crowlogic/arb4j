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

  /**
   * Set by the generating sequence when this cache <em>exclusively owns</em> its
   * entries: a value sequence stores deep copies and its cache-hit path returns a
   * copy ({@code result.set(cached)}), so no consumer ever aliases a cached
   * entry. Such entries hold native (arb/FLINT) memory that nothing else
   * references, so {@link #clear()} must {@code close()} them or the memory leaks.
   *
   * <p>
   * Left {@code false} for function sequences, whose cache-hit path returns the
   * cached instance <em>by reference</em> (a caller may still hold it) and whose
   * {@code close()} cascades into shared referents the cache does not own — those
   * are disposed by their owner, not here. Ownership is a property of the
   * sequence's codomain contract, fixed when the cache is created, not something
   * to infer from an entry's runtime type.
   */
  public boolean             ownsValues;

  /**
   * Two-dimensional backing store keyed by {@code (order, index)}. The outer
   * list is indexed by the evaluation {@code order} (derivative/Taylor order);
   * each element is the per-index list for that order — one for non-negative
   * indices, one for negative. A value computed at a given order is therefore
   * cached in a slot distinct from the same index at any other order, so a
   * re-entrant {@link Function#peek peek} for order N never returns a result
   * that was produced for a different order (which would have the wrong shape:
   * an order-1 scalar vs. an order-N jet). The single-argument {@link #get(int)}
   * / {@link #put(int,Object)} operate on the canonical value order ({@code 1}).
   */
  private final ArrayList<ArrayList<C>> nonnegByOrder = new ArrayList<>();
  private final ArrayList<ArrayList<C>> negByOrder    = new ArrayList<>();

  /** @return the cached value at {@code index} for the canonical value order
   *          ({@code 1}), or {@code null} if not cached. */
  public C get(int index)
  {
    return get(index, 1);
  }

  /**
   * @param index signed index — may be negative
   * @param order evaluation order the value was computed at
   * @return the cached value at {@code (index, order)}, or {@code null} if not
   *         cached.
   */
  public C get(int index, int order)
  {
    ArrayList<ArrayList<C>> byOrder = index >= 0 ? nonnegByOrder : negByOrder;
    int                     i       = index >= 0 ? index : -index - 1;
    ArrayList<C>            list    = (order >= 0 && order < byOrder.size()) ? byOrder.get(order) : null;
    C                       v       = (list != null && i < list.size()) ? list.get(i) : null;
    if (v == null)
      MISSES++;
    else
      HITS++;
    return v;
  }

  /**
   * Store {@code value} at {@code index} for the canonical value order
   * ({@code 1}), growing the backing list with {@code null} padding as needed.
   *
   * @return {@code value} (for call-site chaining)
   */
  public C put(int index, C value)
  {
    return put(index, 1, value);
  }

  /**
   * Store {@code value} at {@code (index, order)}, growing both the per-order
   * and per-index backing lists with {@code null} padding as needed.
   *
   * @return {@code value} (for call-site chaining)
   */
  public C put(int index, int order, C value)
  {
    ArrayList<ArrayList<C>> byOrder = index >= 0 ? nonnegByOrder : negByOrder;
    int                     i       = index >= 0 ? index : -index - 1;
    if (order < 0)
      order = 0;
    while (byOrder.size() <= order)
      byOrder.add(new ArrayList<>());
    ArrayList<C> list = byOrder.get(order);
    while (list.size() <= i)
      list.add(null);
    list.set(i, value);
    return value;
  }

  /**
   * Drop every cached value (used on {@code invalidateCache}).
   *
   * <p>
   * When {@link #ownsValues} is set, each entry is a reified value this cache
   * owns exclusively; dropping the Java reference without {@code close()}ing it
   * leaks the entry's native (arb/FLINT) memory, which is what made a parameter
   * sweep that repeatedly invalidates — e.g. a Levenberg–Marquardt calibration
   * re-pricing on every step — grow without bound and get OOM-killed. Owned
   * entries are closed here, freeing that memory immediately. When
   * {@code ownsValues} is false the entries are shared function references and
   * are left for their owner to dispose.
   */
  public void clear()
  {
    if (ownsValues)
    {
      closeEntries(nonnegByOrder);
      closeEntries(negByOrder);
    }
    nonnegByOrder.clear();
    negByOrder.clear();
  }

  /**
   * Invalidate every cached entry in place instead of dropping it. The entries
   * of a curried/functional sequence's cache are inner {@link Function}
   * instances this sequence constructed and owns; they are reusable across a
   * change to a Context variable (the perturbation point {@code v}) or to the
   * functional's parameters — only their own per-call memo / value sub-cache
   * goes stale. Propagating the invalidation into each entry resets that state
   * and closes the native memory the entry owns, while keeping the instance
   * itself for reuse. Dropping the instances (the former {@link #clear()} on a
   * functional cache) orphaned their owned scratch — a leak — and forced their
   * reconstruction on the next evaluation, which is what made a {@code v}-sweep
   * (and the Levenberg–Marquardt calibration that drives one per step) grow
   * without bound and run slowly.
   *
   * @param propagate {@code true} to drive each entry's {@link
   *                  Function#invalidateCache()} (which cascades into the
   *                  entry's own referents), {@code false} for the
   *                  non-cascading {@link Function#invalidateLocalCache()}.
   */
  public void invalidateEntries(boolean propagate)
  {
    invalidateEntries(nonnegByOrder, propagate);
    invalidateEntries(negByOrder, propagate);
  }

  private static void invalidateEntries(ArrayList<? extends ArrayList<?>> byOrder, boolean propagate)
  {
    for (ArrayList<?> list : byOrder)
    {
      for (int i = 0; i < list.size(); i++)
      {
        if (list.get(i) instanceof Function<?, ?> entry)
        {
          if (propagate)
            entry.invalidateCache();
          else
            entry.invalidateLocalCache();
        }
      }
    }
  }

  private static void closeEntries(ArrayList<? extends ArrayList<?>> byOrder)
  {
    for (ArrayList<?> list : byOrder)
    {
      for (int i = 0; i < list.size(); i++)
      {
        if (list.get(i) instanceof AutoCloseable entry)
        {
          try
          {
            entry.close();
          }
          catch (Exception e)
          {
            // arb value close() does not throw — surface the impossible loudly
            // rather than hide a corrupted dispose.
            throw new RuntimeException("failed to close cached entry during cache invalidation", e);
          }
        }
      }
    }
  }

  public boolean isEmpty()
  {
    return allEmpty(nonnegByOrder) && allEmpty(negByOrder);
  }

  private static boolean allEmpty(ArrayList<? extends ArrayList<?>> byOrder)
  {
    for (ArrayList<?> list : byOrder)
      if (!list.isEmpty())
        return false;
    return true;
  }
}
