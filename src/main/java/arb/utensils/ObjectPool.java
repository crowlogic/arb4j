package arb.utensils;

import java.util.Stack;
import java.util.function.Supplier;

/**
 * a simple {@link Stack} based {@link Object} pool whose this{@link #acquire()}
 * methods returns elements provided by the {@link Supplier} it was constructed
 * with
 * 
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted of the same document respectively.
 * 
 * @param <T>
 */
public class ObjectPool<T>
{
  private final Stack<T>    pool;
  private final Supplier<T> provider;

  public ObjectPool(Supplier<T> provider)
  {
    pool          = new Stack<>();
    this.provider = provider;
  }

  public T acquire()
  {
    if (pool.isEmpty())
    {
      return provider.get();
    }
    return pool.pop();
  }

  public void release(T instance)
  {
    pool.push(instance);
  }
}
