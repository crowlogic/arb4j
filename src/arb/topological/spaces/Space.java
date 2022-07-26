package arb.topological.spaces;

import arb.OpenSet;
import arb.Set;
import arb.topological.Topology;

/**
 * A topological {@link Space} is a geometrical space in which closeness is
 * defined but cannot necessarily be measured by a numeric distance. More
 * specifically, a topological {@link Space} is a {@link Set} whose elements are
 * called points, along with an additional structure called a {@link Topology}
 * that can be defined as a set of neighbourhoods for each point, that satisfy
 * some axioms formalizing the concept of closeness. There are several
 * equivalent definitions of a topology, the most commonly used is the
 * definition through {@link OpenSet}, which is easier to work with.
 * 
 * A topological space is the most general type of a mathematical {@link Space}
 * that allows for the definition of limits, continuity, and connectedness.
 * Common types of topological spaces include {@link EuclideanSpace}, metric
 * spaces and manifolds.
 * 
 * Although very general, the concept of topological spaces is a fundamental and
 * used in virtually every branch of modern mathematics. The study of
 * topological spaces in their own right is called point-set topology or general
 * topology.
 *
 * @see <a href="https://en.wikipedia.org/wiki/Topological_space">Wikipedia</a>
 * 
 * @param <X>
 */
public interface Space<X> extends
                      Set<X>
{
  public default Topology topology()
  {
    assert false : "implement me, possibly by adding a generic variable T extendeding Topology";
    return null;
  }
}