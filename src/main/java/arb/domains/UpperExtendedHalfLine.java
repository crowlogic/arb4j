package arb.domains;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class UpperExtendedHalfLine implements
                                   Domain<Real>
{
  public static final UpperExtendedHalfLine instance = new UpperExtendedHalfLine();

  @Override
  public boolean contains(Real point)
  {
    return !point.equals(RealConstants.indeterminant) && point.sign() >= 0;
  }

}
