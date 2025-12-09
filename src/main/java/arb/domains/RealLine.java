package arb.domains;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealLine implements
                      Domain<Real>
{

  @Override
  public boolean contains(Real point)
  {
    return point.isFinite();
  }

}
