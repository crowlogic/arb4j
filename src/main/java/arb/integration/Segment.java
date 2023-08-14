package arb.integration;

import java.io.Closeable;

import arb.*;

public class Segment implements
                     AutoCloseable,
                     Closeable
{
  @Override
  public String toString()
  {
    return String.format("Segment[size=%s, as=%s, bs=%s, vs=%s, ms=%s]", size, as, bs, vs, ms);
  }

  public void resizeVectors(int allocation)
  {
    int k = allocation;
    allocation *= 2;
    as.resize(allocation);
    bs.resize(allocation);
    vs.resize(allocation);
    ms.resize(allocation);
    for (; k < allocation; k++)
    {
      as.get(k).init();
      bs.get(k).init();
      vs.get(k).init();
      ms.get(k).init();
    }
    this.size = allocation;
  }

  public Segment(int allocation)
  {
    super();
    this.size = allocation;
    as        = Complex.newVector(2 * allocation, "as");
    bs        = Complex.newVector(2 * allocation, "bs");
    vs        = Complex.newVector(2 * allocation, "vs");
    ms        = Magnitude.newVector(2 * allocation, "ms");
  }

  int              size;

  public Complex   as;
  public Complex   bs;
  public Complex   vs;
  public Magnitude ms;

  @Override
  public void close()
  {
    as.close();
    bs.close();
    vs.close();
    ms.close();
  }

  public void setInterval(Real a, Real b)
  {
    as.re().set(a);
    bs.im().set(b);
  }
}