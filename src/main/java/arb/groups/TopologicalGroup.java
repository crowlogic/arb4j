package arb.groups;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.Space;
import arb.space.topological.TopologicalSpace;
import arb.space.topological.Topology;

/**
 * Represents a topological group, which is both a {@link Group} and a
 * {@link TopologicalSpace}. In a topological group, the group operations (group
 * multiplication and taking inverses) are continuous with respect to the
 * {@link Topology} of the {@link Space}
 * 
 * This interface ensures that any implementing class adheres to the
 * mathematical structure of topological groups, which is critical for the
 * correct application in contexts requiring continuity of group operations,
 * such as in harmonic analysis and applications involving symmetry groups.
 *
 * @param <X> the type of elements in the topological group.
 *
 * @see BusinessSourceLicenseVersionOnePointOne for terms of the
 *      {@link TheArb4jLibrary}.
 */
public interface TopologicalGroup<X> extends
                                 Group<X>, // Ensures the algebraic structure of a group
                                 TopologicalSpace<X> // Ensures the topological structure
{
  // Additional methods specific to the behavior of topological groups can be
  // defined here.
}
