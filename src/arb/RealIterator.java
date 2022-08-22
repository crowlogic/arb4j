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
    return x.get(i++);
  }

}
