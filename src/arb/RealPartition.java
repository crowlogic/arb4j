package arb;

import java.io.Closeable;
import java.lang.ref.Cleaner.Cleanable;
import java.util.Iterator;

public class RealPartition implements
                           AutoCloseable,
                           Closeable,
                           Cleanable,
                           Iterable<Real>
{
  public final Real  x;

  public final Float dt     = new Float();
  public final Float halfdt = new Float();

  public RealPartition(FloatInterval interval, int prec, int n)
  {
    x = Real.newVector(n);
    interval.length(prec, dt).div(n, prec);
    x.printPrecision = true;
    dt.div(2, prec,
           halfdt);
    Real xi = x;
    for (int i = 0; i < n; i++)
    {
      xi = x.get(i);
      xi.printPrecision = true;
      interval.getA().add(halfdt.add(dt.mul(i, prec, xi.getMid()), prec), prec);
      dt.getMagnitude(xi.getRad());
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
    x.close();
  }

}
