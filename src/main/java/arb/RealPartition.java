package arb;

import java.io.Closeable;
import java.io.Serializable;
import java.lang.ref.Cleaner.Cleanable;
import java.util.Iterator;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealPartition implements
                           AutoCloseable,
                           Closeable,
                           Cleanable,
                           Partition<Real>,
                           Serializable
{
  private static final long serialVersionUID = 1L;

  @Override
  public String toString()
  {
    return T.toString();
  }

  public final Real     T;

  public final Real     dt     = new Real();
  public final Real     halfdt = new Real();

  private FloatInterval interval;

  public RealPartition(FloatInterval interval, int bits, Real T, boolean includeError)
  {
    final int n = T.size();
    this.T = T;
    (this.interval = interval).length(bits, dt.getMid()).div(n, bits);
    T.printPrecision = true;
    dt.div(2, bits, halfdt);

    generate(bits, includeError);
  }

  private Real generate(int prec, boolean includeError)
  {
    final int n = T.size();

    try ( Real t0 = new Real())
    {
      t0.set(this.interval.getA()).add(this.halfdt, prec);
      for (int i = 0; i < n; i++)
      {
        Real ti = this.T.get(i);
        ti.printPrecision = true;
        this.dt.mul(i, prec, ti).add(t0, prec);
        if (includeError)
        {
          this.halfdt.getMid().getMagnitude(ti.getRad());
        }
      }
    }

    return T;
  }

  /**
   * 
   * @param interval
   * @param prec
   * @param n
   * @param includeError if true then the radius of each element of the partition
   *                     is set to the width of the partition interval.length/n,
   *                     otherwise it is set to 0
   * 
   */
  public RealPartition(FloatInterval interval, int prec, int n, boolean includeError)
  {
    this(interval,
         prec,
         Real.newVector(n),
         includeError);
  }

  @Override
  public Iterator<Real> iterator()
  {
    return new RealPartitionIterator(this);
  }

  @Override
  public void clean()
  {
    close();

  }

  @Override
  public void close()
  {
    T.close();
    dt.close();
    halfdt.close();
  }

  @Override
  public int count()
  {
    return T.dim;
  }

  @Override
  public Real get(int i)
  {
    return T.get(i);
  }

}
