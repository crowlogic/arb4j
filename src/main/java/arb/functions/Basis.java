package arb.functions;

import arb.domains.Domain;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Basis<X,T>
{
  public default Domain<? extends X> domainOfOrthogonality()
  {
    assert false : getClass() + " should implement getDomain()";
    return null;
  }
}
