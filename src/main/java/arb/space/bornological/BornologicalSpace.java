package arb.space.bornological;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.Space;
import arb.space.topological.*;

/**
 * A BornologicalSpace is a mathematical space in which the concept of "boundedness" is
 * well-defined, independent of a metric or topological structure. This interface extends
 * the more general {@link Space} interface, indicating that a bornological space is a set
 * of points with an additional structure of "bornology".
 *
 * The bornology structure can be formally defined as a set of "bounded sets" for each
 * point, that satisfies certain axioms. This bornology provides a formalized
 * understanding of concepts like boundedness, absorbency and balancedness.
 *
 * A bornological space is a fundamental concept in analysis and topology. Common types of
 * bornological spaces include {@link NormedSpace}, {@link MetricSpace}s , and locally
 * convex spaces.
 *
 * The study of bornological spaces in their own right is referred to as "bornological
 * analysis".
 *
 * Note: This interface should be implemented by classes representing specific types of
 * bornological spaces. It defines a default method {@link #bornology} that should be
 * overridden to provide the specific {@link Bornology} structure of the space.
 *
 * @param <X> the type of elements in the space
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public interface BornologicalSpace<X>
                                  extends
                                  Space<X>
{

  /**
   * Returns the {@link Bornology} of the space.
   *
   * This default implementation throws an AssertionError, indicating it should be
   * overridden by implementing classes.
   *
   * @return the bornology structure of the space
   * @throws AssertionError if the method is not overridden
   */
  public default Bornology<X> bornology()
  {
    assert false : "This method should be overridden in the implementing class.";
    return null;
  }
}
