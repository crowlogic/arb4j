package arb;

import java.util.Iterator;

public abstract class ComplexPartIterator implements
                                          Iterator<Real>
{

  protected Complex x;
  protected int     i = 0;

  public ComplexPartIterator()
  {
    super();
  }

  @Override
  public boolean hasNext()
  {
    return i < x.dim;
  }

}