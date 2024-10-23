package arb.domains;

import arb.Integer;

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
