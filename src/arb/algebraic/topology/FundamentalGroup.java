package arb.algebraic.topology;

import arb.EquivalenceClass;
import arb.differential.homotopy.Homotopy;
import arb.differential.homotopy.Loop;
import arb.groups.Group;
import arb.topological.Space;

/**
 * The fundamental group of a topological {@link Space} is the {@link Group} of
 * the {@link EquivalenceClass} under homotopy of the {@link Loop}s contained in the
 * space. It records information about the basic shape, or holes, of the
 * topological space. The fundamental group is the first and simplest
 * {@link Homotopy} group. The fundamental group is a homotopy
 * invariant—topological spaces that are homotopy equivalent (or the stronger
 * case of homeomorphic) have isomorphic fundamental groups. The
 * {@link FundamentalGroup} of a topological {@link Space} X is denoted by π₁(X)
 * 
 * @author crow
 *
 */
public interface FundamentalGroup<X extends Space> extends
                                 Group
{

}
