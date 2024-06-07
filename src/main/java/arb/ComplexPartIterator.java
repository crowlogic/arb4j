package arb;

import java.util.Iterator;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
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