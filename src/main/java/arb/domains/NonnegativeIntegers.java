package arb.domains;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NonnegativeIntegers extends
                                 Integers
{

  @Override
  public boolean contains(Integer point)
  {
    return point.isPositive();
  }

}
