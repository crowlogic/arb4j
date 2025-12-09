package arb.domains;

import arb.OpenSet;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Interval<F extends Comparable<F>> extends
                         Domain<F>,
                         OpenSet<F>
{
  @Override
  default boolean contains(F element)
  {
    return left().compareTo(element) <= 0 && right().compareTo(element) >= 0;
  }

  public F left();

  public F right();

}
