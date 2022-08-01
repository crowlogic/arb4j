package arb;

import static arb.utensils.Utilities.println;

import java.io.Closeable;
import java.lang.ref.Cleaner.Cleanable;
import java.util.Iterator;

public class RealPartition implements
                           AutoCloseable,
                           Closeable,
                           Cleanable,
                           Iterable<Real>
{
  public final Real  T;

  public final Float dt     = new Float();
  public final Float halfdt = new Float();

  public RealPartition(FloatInterval interval, int prec, int n)
  {
    T = Real.newVector(n);
    interval.length(prec, dt).div(n, prec);
    T.printPrecision = true;
    dt.div(2, prec, halfdt);
    Real ti = T;
    println("halfdt=" + halfdt);
    try ( Float t = new Float())
    {
      t.assign(interval.getA()).add(halfdt, prec);
      for (int i = 0; i < n; i++)
      {
        ti                = T.get(i);
        ti.printPrecision = true;
        dt.mul(i, prec, ti.getMid()).add( halfdt, prec );
        halfdt.getMagnitude(ti.getRad());
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

}
