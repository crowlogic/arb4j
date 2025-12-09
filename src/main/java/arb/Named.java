package arb;

import java.util.HashMap;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public interface Named
{
  public static HashMap<Named, String> names = new HashMap<>();

  public default <N extends Named> N setName(String name)
  {
    names.put(this,
              name);
    return (N) this;
  }

  public default String getName()
  {
    return names.get(this);
  }

}
