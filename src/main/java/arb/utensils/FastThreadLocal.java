package arb.utensils;

import java.util.HashMap;

/**
 * A thread-local caches structure that provides fast access to caches for a
 * given thread. It internally uses a integer array for storing caches. it is
 * faster than {@link ThreadLocal} because it avoids the use of {@link HashMap}s
 * or any maps besides array indexing
 * 
 * @param <T> The type of object to be stored in the thread-local.
 */
public class FastThreadLocal<T>
{

  @Override
  public String toString()
  {
    return String.format("FastThreadLocal [firstFreeIndex=%s]", firstFreeIndex);
  }

  private final Cache<T>[] caches;
  private volatile int     firstFreeIndex;

  /**
   * The class represents a cache caches structure for storing thread-specific
   * caches.
   * 
   * @param <S> The type of object to be stored in the cache.
   */
  public static class Cache<S>
  {
    @Override
    public String toString()
    {
      return String.format("Cache [owner=%s, caches=%s]", owner, data);
    }

    long owner;
    S    data;
  }

  /**
   * Default constructor for FastThreadLocal. It initializes the internal cache
   * array with the default size of 1024.
   */
  public FastThreadLocal()
  {
    this(1024);
  }

  /**
   * Overloaded constructor for FastThreadLocal. It initializes the internal cache
   * array with a specified size.
   * 
   * @param size The size of the cache array.
   */
  @SuppressWarnings("unchecked")
  public FastThreadLocal(int size)
  {
    caches         = new Cache[size];
    firstFreeIndex = 0;
  }

  /**
   * Sets the thread-specific caches for the current thread.
   * 
   * @param caches The caches to be set for the current thread.
   * @return The caches that was set.
   */
  public T set(T data)
  {
    long     threadId = Thread.currentThread().threadId();
    Cache<T> cache    = getForThread(threadId);
    assert cache != null;
    return cache.data = data;
  }

  /**
   * Gets the thread-specific caches for the current thread.
   * 
   * @return The caches for the current thread.
   */
  public T get()
  {
    long     threadId = Thread.currentThread().threadId();
    Cache<T> cache    = getForThread(threadId);
    assert cache != null;
    return cache.data;
  }

  /**
   * Gets the cache for the given thread ID. If none exists, it creates a new one.
   * 
   * @param threadId The ID of the thread.
   * @return The cache for the given thread ID.
   */
  public Cache<T> getForThread(long threadId)
  {
    int      index = getThreadIndex(threadId);
    Cache<T> cache = caches[index];
    if (cache != null)
    {
      if (cache.owner == threadId)
      {
        return cache;
      }
      else
      {
        index = getAndIncrementFirstFreeIndex();
        if (index < 0)
        {
          throw new RuntimeException("cache full");
        }
        cache       = caches[index];
        cache.owner = threadId;
      }
    }
    else
    {
      cache         = new Cache<T>();
      cache.owner   = threadId;
      caches[index] = cache;
    }
    return cache;
  }

  public int getThreadIndex(long threadId)
  {
    int index = (int) (threadId % caches.length);
    return index;
  }

  /**
   * Gets and increments the first free index.
   * 
   * @return The first free index, or -1 if none found.
   */
  private synchronized int getAndIncrementFirstFreeIndex()
  {
    int i = firstFreeIndex;
    for (; i < caches.length; i++)
    {
      if (caches[i] == null)
      {
        return firstFreeIndex = i + 1;
      }
    }
    return -1;
  }

  /**
   * Releases a cache index, making it available for future use.
   * 
   * @param index The index to be released.
   */
  public void releasecCache(int index)
  {
    caches[index] = null;
    updateFirstFreeIndex(index);
  }

  /**
   * Updates the first free index to be the given index if it is smaller.
   * 
   * @param index The candidate for the new first free index.
   */
  private synchronized void updateFirstFreeIndex(int index)
  {
    if (index < firstFreeIndex)
    {
      firstFreeIndex = index;
    }
  }
}
