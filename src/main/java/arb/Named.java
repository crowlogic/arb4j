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
  public <N extends Named> N setName(String name);

  public String getName();

  public default String toStringWithoutName()
  {
    assert false : "todo: implement";
    return "todo";
  }
}
