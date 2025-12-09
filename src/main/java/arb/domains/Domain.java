package arb.domains;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.TopologicalSpace;

/**
 * A Domain is a set of "points" over which a mathematical function is defined.
 * This interface extends the TopologicalSpace interface, indicating that a
 * domain is a topological space with the added ability to check whether a
 * certain point is within it.
 *
 * @param <X> the type of elements in the domain
 *
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Domain<X> extends
                       TopologicalSpace<X>
{

  /**
   * Returns whether the domain contains a certain point.
   *
   * This default implementation throws an AssertionError, indicating it should be
   * overridden by implementing classes.
   *
   * @param point the point to check
   * @return true if the domain contains the point, false otherwise
   * @throws AssertionError if the method is not overridden
   */
  public boolean contains(X point);
}
