package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public interface Named 
{

  public default <N extends Named> N setName(String name)
  {
    assert false : "TODO: " + getClass().getSimpleName() + " needs to implement setName(String)";
    return null;
  }

  public String getName();

}
