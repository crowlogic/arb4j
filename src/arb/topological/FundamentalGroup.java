package arb.topological;

import arb.EquivalenceClass;
import arb.geometry.differential.homotopy.Homotopy;
import arb.geometry.differential.homotopy.Loop;
import arb.groups.Group;

/**
 * The fundamental group of a topological {@link TopologicalSpace} is the
 * {@link Group} of the {@link EquivalenceClass} under homotopy of the
 * {@link Loop}s contained in the space. It records information about the basic
 * shape, or holes, of the topological space.
 * 
 * The fundamental group is the first and simplest {@link Homotopy} group.
 * 
 * The fundamental group is a homotopy invariant; in other words,
 * {@link TopologicalSpace} that are either homotopy equivalent or homeomorphic
 * have isomorphic {@link FundamentalGroup}s.
 * 
 * The {@link FundamentalGroup} of a topological {@link TopologicalSpace} X is
 * denoted by π₁(X)
 * 
 * @author crow
 *
 *         FIXME: define more thoroughly
 */
public interface FundamentalGroup<X extends TopologicalSpace> extends
                                 Group<X>
{

}
