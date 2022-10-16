package arb;

import java.io.Closeable;
import java.io.Serializable;
import java.lang.ref.Cleaner.Cleanable;
import java.util.Iterator;

public class RealPartition implements
                           AutoCloseable,
                           Closeable,
                           Cleanable,
                           Partition<Real>,
                           Serializable
{
  public final Real T;

  public final Real dt     = new Real();
  public final Real halfdt = new Real();

  public RealPartition(FloatInterval interval, int prec, int n)
  {
    T = Real.newVector(n);
    interval.length(prec, dt.getMid()).div(n, prec);
    T.printPrecision = true;
    dt.div(2, prec, halfdt);
    Real ti = T;
    try ( Real t = new Real())
    {
      t.set(interval.getA()).add(halfdt, prec);
      for (int i = 0; i < n; i++)
      {
        ti                = T.get(i);
        ti.printPrecision = true;
        dt.mul(i, prec, ti).add(halfdt, prec);
        halfdt.getMid().getMagnitude(ti.getRad());
      }
    }
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
