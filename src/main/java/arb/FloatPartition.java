package arb;

import java.io.Closeable;
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.ref.Cleaner.Cleanable;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A {@link FloatPartition} is a {@link Partition} of arbitrary precision
 * {@link Float}ing point numbers specified by their midpoint and radius
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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

  Arena           arena = Arena.ofAuto();

  MemorySegment   segment;

  private long    swigCPtr;
  private Float   dtfloat;

  public FloatPartition(int precision, FloatInterval interval, int n)
  {
    segment           = arena.allocate(Float.BYTES * (n + 1));
    swigCPtr          = segment.address();
    this.n            = n;
    this.prec         = precision;
    dtfloat           = new Float();
    δt                = new Real(interval.length(precision, dtfloat).div(n, precision),
                                 MagnitudeConstants.zeroMag);
    δt.printPrecision = true;
    elements          = new Float[n];
    for (int i = 0; i < n; i++)
    {
      dtfloat.mul(i,
                  prec,
                  elements[i] = new Float(swigCPtr + Float.BYTES * i,
                                          false))
             .add(interval.getA(), precision);
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
  public FloatPartitionIterator iterator()
  {
    return new FloatPartitionIterator(this);
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
