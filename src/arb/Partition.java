package arb;

import java.io.Closeable;
import java.lang.ref.Cleaner.Cleanable;

import sun.misc.Unsafe;

/**
 * A {@link Partition} denoted P of ...
 * 
 * @see <a href="functions/doc-files/IntegrationNotes.pdf">notes on Riemann
 *      integration</a>
 */
public class Partition extends
                       Float implements
                       AutoCloseable,
                       Closeable,
                       Cleanable
{
  FloatInterval       interval;
  Float               partitions;
  final static Unsafe fun = Unsafe.getUnsafe();

  public Partition(FloatInterval interval, int n)
  {
    super(fun.allocateMemory(n * FloatInterval.BYTES),
          false);
    // TODO: add indexed accessor and generate uniformly spaced partition
  }

  @Override
  public void close()
  {
    fun.freeMemory(pointer());
  }

  @Override
  public void clean()
  {
    close();
  }
}
