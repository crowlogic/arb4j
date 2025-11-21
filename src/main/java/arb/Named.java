package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Named
{
  public default <N extends Named> N setName(String name)
  {
    assert false : "either this shouldn't be called or " + getClass() + " needs to implement this";
    return (N) this;
  }

  public String getName();

}
