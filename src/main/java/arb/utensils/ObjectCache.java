package arb.utensils;

import java.util.ArrayList;

/**
 * A simple yet effective {@link ArrayList} based cache that resizes to
 * accommodate insertions
 * 
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted of the same document respectively.
 * 
 * @param <T>
 */
public class ObjectCache<T>
{
  private ArrayList<T> cache;

  public ObjectCache()
  {
    cache = new ArrayList<>();
  }

  public T get(int key)
  {
    if (key < cache.size())
    {
      return cache.get(key);
    }
    return null;
  }

  public void put(int key, T value)
  {
    ensureCapacity(key);
    cache.set(key, value);
  }

  private void ensureCapacity(int key)
  {
    while (key >= cache.size())
    {
      cache.add(null);
    }
  }
}
