package arb.spaces;

import arb.Set;
import arb.topology.Topology;

/**
 * A topological space is, roughly speaking, a geometrical {@link Space} in
 * which closeness is defined but cannot necessarily be measured by a numeric
 * distance. More specifically, a {@link TopologicalSpace} is a {@link Space}
 * (which is itself a {@link Set} with additional structure) whose elements are
 * called points, along with an additional structure called a {@link Topology}
 * that can be defined as a set of neighbourhoods for each point, that satisfy
 * some axioms formalizing the concept of closeness. There are several
 * equivalent definitions of a topology, the most commonly used is the
 * definition through open sets, which is easier to manipulate.
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
public interface TopologicalSpace<X, T extends Topology> extends
                                 Space<X>
{
  public T topology();
}
