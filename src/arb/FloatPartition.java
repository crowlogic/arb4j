package arb;

import java.io.Closeable;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.MemorySession;
import java.lang.ref.Cleaner.Cleanable;
import java.util.Iterator;

/**
 * A {@link FloatPartition} denoted P of ...
 * 
 * @see <a href="functions/doc-files/IntegrationNotes.pdf">notes on Riemann
 *      integration</a>
 * 
 *      TODO: fix after adapting {@link Float} to support being an array
 */
public class FloatPartition implements
                            AutoCloseable,
                            Closeable,
                            Cleanable,
                            Partition<Float>
{
  FloatInterval   interval;
  Float           partitions;
  int             n;
  public Real     δt;
  private int     prec;
  private Float[] elements;

  MemorySession   scope = MemorySession.openShared();

  MemorySegment   segment;

  private long    swigCPtr;
  private Float   dtfloat;

  /**
   * Construct a {@link FloatPartition} of a {@link FloatInterval} TODO: should
   * the mesh be a Real instead of a Float?
   * 
   * 
   * @param precision
   * @param interval
   * @param n
   */
  public FloatPartition(int precision, FloatInterval interval, int n)
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
   * @return the i-th element of the {@link FloatPartition}
   */
  @Override
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
    try
    {
      dtfloat.close();
      δt.close();
      scope.close();
    }
    finally
    {
      swigCPtr = 0;
    }
  }

  @Override
  public Iterator<Float> iterator()
  {
    return new PartitionIterator(this);
  }

  @Override
  public int count()
  {
    return n;
  }

  @Override
  public void clean()
  {
    close();
  }

}
