package arb.space.topological;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.Space;

/**
 * A TopologicalSpace is a mathematical space in which the concept of
 * "closeness" or "limit" is well-defined, but not necessarily through a numeric
 * distance measure. This interface extends the more general {@link Space}
 * interface, indicating that a topological space is a set of points with an
 * additional structure of "topology".
 *
 * The topology structure can be formally defined as a set of "open sets" (or
 * neighborhoods) for each point, that satisfies certain axioms. This topology
 * provides a formalized understanding of concepts like continuity, limits, and
 * convergence.
 *
 * A topological space is a fundamental concept in virtually every branch of
 * modern mathematics. Common types of topological spaces include Euclidean
 * spaces, metric spaces, and manifolds.
 *
 * The study of topological spaces in their own right is referred to as
 * "point-set topology" or "general topology".
 *
 * Note: This interface should be implemented by classes representing specific
 * types of topological spaces. It defines a default method {@link #topology}
 * that should be overridden to provide the specific topology structure of the
 * space.
 *
 * @param <X> the type of elements in the space
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface TopologicalSpace<X> extends
                                 Space<X>
{

  /**
   * Returns the topology structure of the space.
   *
   * This default implementation throws an AssertionError, indicating it should be
   * overridden by implementing classes.
   *
   * @return the topology structure of the space
   * @throws AssertionError if the method is not overridden
   */
  public default Topology<X> topology()
  {
    assert false : "This method should be overridden in the implementing class.";
    return null;
  }
}
