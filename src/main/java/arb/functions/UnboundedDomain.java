package arb.functions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class UnboundedDomain<D> implements
                            Domain<D>
{

  @Override
  public boolean contains(D point)
  {
    return true;
  }

}
