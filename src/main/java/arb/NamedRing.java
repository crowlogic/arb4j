package arb;

import arb.algebra.Ring;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface NamedRing<A extends NamedRing<A>> extends
                          Ring<A>,
                          Named,
                          AutoCloseable
{

  @Override
  public void
         close();

}
