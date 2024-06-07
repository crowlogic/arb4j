package arb.physics;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BinaryOccupationBasis implements
                                    Domain<Integer>
{

  @Override
  public boolean contains(Integer point)
  {
    int intVal = point.intValue();
    return intVal == 0 || intVal == 1;
  }

}
