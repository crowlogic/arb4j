package arb.space.topological;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.SurjectiveFunction;

/**
 * A fiber bundle is a structure (E, B, π, F), where E, B, and F are Surjection
 * a local triviality condition.
 *
 * The base space B is assumed to be connected. For every x in B, there is an
 * open trivializing neighborhood U of x such that there is a homeomorphism φ :
 * π^(−1)(U)→U×F where π^(−1)(U) is given the subspace topology, and U × F is
 * the product space in such a way that π agrees with the projection onto the
 * first factor.
 *
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Fiber_bundle">FiberBundle@Wikipedia</a>
 *
 * @param <E> total space (a {@link TopologicalSpace})
 * @param <B> base space (a {@link TopologicalSpace})
 * @param <F> fiber (a {@link TopologicalSpace} over each point of B)
 * @param <π> the projection map from the total space E to the base space B
 *            (also known as bundle projection)
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface FiberBundle<X extends Field<? extends X>, E extends TopologicalSpace<? extends X>, B extends TopologicalSpace<? extends X>, F extends TopologicalSpace<? extends X>, π extends SurjectiveFunction<E, B>>
                            extends
                            Bundle<X, E, B, π>
{
  /**
   * Retrieves the fiber F over a given point in the base space B.
   *
   * @param point The point in the base space B.
   * @return The fiber over the specified point.
   */
  F fiber(B point);

  /**
   * Checks if a given point in the total space E is in the fiber over a specified
   * point in the base space B.
   *
   * @param pointInTotalSpace The point in the total space E.
   * @param pointInBaseSpace  The point in the base space B.
   * @return true if the point in the total space is in the fiber over the
   *         specified point in the base space, false otherwise.
   */
  boolean isInFiber(E pointInTotalSpace, B pointInBaseSpace);

  /**
   * Returns a section of the bundle. A section of a fiber bundle is a continuous
   * map that sends each point in the base space B to a point in the fiber over B.
   *
   * @return A section of the bundle.
   */
  Section<X, E, B, F> section();

  /**
   * Checks if the fiber bundle is trivial. A fiber bundle is trivial if it is
   * isomorphic to the product of its base space B and fiber F.
   *
   * @return true if the fiber bundle is trivial, false otherwise.
   */
  boolean isTrivial();

}
