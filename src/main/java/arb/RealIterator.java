package arb;

import java.util.Iterator;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
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
