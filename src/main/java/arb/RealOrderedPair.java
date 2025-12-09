package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealOrderedPair extends
                             OrderedPair<Real, Real> implements
                             AutoCloseable
{

  @Override
  public String toString()
  {
    return String.format("RealOrderedPair[a=%s, b=%s]", a.toFixedString(), b.toFixedString());
  }

  public RealOrderedPair()
  {
    super(
          new Real(),
          new Real());
  }

  public RealOrderedPair(Real a,
                         Real b)
  {
    super(
          a,
          b);
  }

  @Override
  public void close()
  {
    if (a != null)
    {
      a.close();
    }
    if (b != null)
    {
      b.close();
    }
  }

}
