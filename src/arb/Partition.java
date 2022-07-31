package arb;

import java.io.Closeable;
import java.lang.ref.Cleaner.Cleanable;
import java.util.*;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import jdk.incubator.foreign.MemorySegment;
import jdk.incubator.foreign.ResourceScope;

/**
 * A {@link Partition} denoted P of ...
 * 
 * @see <a href="functions/doc-files/IntegrationNotes.pdf">notes on Riemann
 *      integration</a>
 */
public class Partition implements
                       AutoCloseable,
                       Closeable,
                       Cleanable,
                       Iterable<Float>
{
  FloatInterval   interval;
  Float           partitions;
  int             n;
  public Real     δt;
  private int     prec;
  private Float[] elements;

  ResourceScope   scope = ResourceScope.newSharedScope();

  MemorySegment   segment;

  private long    swigCPtr;
  private Float   dtfloat;

  /**
   * Construct a {@link Partition} of a {@link FloatInterval} TODO: should the
   * mesh be a Real instead of a Float?
   * 
   * 
   * @param precision
   * @param interval
   * @param n
   */
  public Partition(int precision, FloatInterval interval, int n)
  {
    segment           = MemorySegment.allocateNative(Float.BYTES * (n + 1), scope);
    swigCPtr          = segment.address().toRawLongValue();
    this.n            = n;
    this.prec         = precision;
    dtfloat           = new Float();
    δt                = new Real(interval.length(precision, dtfloat).div(n, precision),
                                 MagnitudeConstants.zeroMag);
    δt.printPrecision = true;
    elements          = new Float[n + 1];
    for (int i = 0; i <= n; i++)
    {
      Float τi = elements[i] = new Float(swigCPtr + Float.BYTES * i,
                                         false);
      dtfloat.mul(i, prec, τi);
    }
  }

  /**
   * 
   * @param i
   * @return the i-th element of the {@link Partition}
   */
  public Float get(int i)
  {
    return elements[i];

  }

  /**
   * Once this is called, the {@link Float}s returned from this{@link #get(int)}
   * are no longer valid
   */
  @Override
  public void close()
  {
    if (swigCPtr == 0)
    {
      return;
    }
    dtfloat.close();
    δt.close();
    scope.close();
  }

  @Override
  public void clean()
  {
    close();
  }

  @Override
  public Iterator<Float> iterator()
  {
    return new PartitionIterator(this);
  }

  public Stream<Float> stream()
  {
    return StreamSupport.stream(Spliterators.spliterator(iterator(), n, Spliterator.SIZED | Spliterator.ORDERED),
                                false);
  }
}
