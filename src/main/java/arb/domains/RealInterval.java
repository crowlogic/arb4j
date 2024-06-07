package arb.domains;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealInterval extends
                          Real implements
                          Interval<Real>
{
  private static final long serialVersionUID = 1L;

  public RealInterval(long cPtr,
                      boolean cMemoryOwn,
                      Real left,
                      Real right)
  {
    super(cPtr,
          cMemoryOwn);
    this.left  = left;
    this.right = right;
  }

  public Real left;
  public Real right;

  @Override
  public Real left()
  {
    return left;
  }

  @Override
  public Real right()
  {
    return right;
  }

}
