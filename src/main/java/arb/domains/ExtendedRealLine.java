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
public class ExtendedRealLine implements
                              Domain<Real>
{

  public static final Domain<Real> instance = new ExtendedRealLine();

  @Override
  public boolean contains(Real point)
  {
    return !point.equals(RealConstants.indeterminant);
  }

}
