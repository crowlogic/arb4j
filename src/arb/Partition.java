package arb;

import java.io.*;
import java.lang.ref.Cleaner.*;
import java.util.*;

import jdk.incubator.foreign.*;
import jdk.incubator.foreign.MemorySegment;

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

  public Partition(int precision, FloatInterval interval, int n)
  {
    segment   = MemorySegment.allocateNative(Float.BYTES * (n + 1), scope);
    swigCPtr  = segment.address().toRawLongValue();
    this.n    = n;
    this.prec = precision;
    dtfloat   = new Float();
    δt        = new Real(interval.length(precision, dtfloat).div(n, precision),
                         MagnitudeConstants.zeroMag);
    elements  = new Float[n + 1];
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
    scope.close();
    swigCPtr = 0;
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
}
