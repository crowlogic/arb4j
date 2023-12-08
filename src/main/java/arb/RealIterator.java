package arb;

import java.util.Iterator;

public class RealIterator implements
                          Iterator<Real>
{
  int  i = 0;
  Real x = null;

  public RealIterator(Real x)
  {
    this.x = x;
  }

  @Override
  public boolean hasNext()
  {
    return i < x.dim;
  }

  @Override
  public Real next()
  {
    if (!hasNext())
    {
      throw new IndexOutOfBoundsException(String.format("index=%d must be less than length=%d\n", i, x.dim));
    }
    return x.get(i++);
  }

}
