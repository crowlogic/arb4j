package arb;

import java.io.Closeable;
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
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
                            Partition<Float>
{
  FloatInterval       interval;
  Float               partitions;
  int                 n;
  public Real         δt;
  private int         prec;
  private Float[]     elements;

  MemorySegment       segment;

  private long        swigCPtr;
  private Float       dtfloat;
  public static Arena arena = Arena.ofAuto();

  /**
   * Construct a {@link FloatPartition} of a {@link FloatInterval} TODO: should
   * the mesh be a Real instead of a Float?
   * 
   * 
   * @param precision
   * @param interval
   * @param n
   */
  @SuppressWarnings("resource")
  public FloatPartition(int precision, FloatInterval interval, int n)
  {
    segment           = arena.allocate(Float.BYTES * (n + 1), arb.arblib.getpagesize());    swigCPtr          = segment.address();
    this.n            = n;
    this.prec         = precision;
    dtfloat           = new Float();
    δt                = new Real(interval.length(precision, dtfloat).div(n, precision),
                                 MagnitudeConstants.zeroMag);
    δt.printPrecision = true;
    elements          = new Float[n];
    for (int i = 0; i < n; i++)
    {
      Float τi = elements[i] = new Float(swigCPtr + Float.BYTES * i,
                                         false);
      dtfloat.mul(i, prec, τi);
      τi.add(interval.getA(), precision);
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

}
