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

  public default boolean isRenameable()
  {
    return false;
  }

  public default <N extends Named> N setName(String name)
  {
    assert isRenameable() : this + " of class " + getClass().getSimpleName() + " is not renamable";
    assert false : "TODO: "
                   + getClass().getSimpleName()
                   + " needs to implement setName(String) since apparently "
                   + this
                   + " is renamable";
    return null;
  }

  public String getName();

}
