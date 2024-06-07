package arb.space.topological;

import java.util.Set;

/**
 * A Topology is a set of subsets (usually referred to as "open sets") of a
 * given Set, satisfying certain properties that formalize the intuitive notion
 * of 'closeness' or 'limit' in a set.
 * 
 * The interface is parameterized by a type X which represents the type of
 * elements in the sets of the topology.
 * 
 * This interface extends Set<Set<X>>, indicating that a topology is essentially
 * a set of subsets of X.
 * 
 * Each method in this interface should be overridden by implementing classes to
 * provide functionality that is specific to the particular topology.
 * 
 * @param <X> the type of elements in the sets of the topology
 */
public interface Topology<X>
{

  /**
   * Returns a set containing all the open sets of the topology.
   *
   * @return the set of all open sets in the topology
   */
  Set<X> getOpenSets();

  /**
   * Checks if a given function is continuous with respect to this topology. The
   * definition of continuity may vary based on the specific type of topology.
   * 
   * In the most common case, a function is considered continuous if the pre-image
   * of every open set under the function is also an open set.
   *
   * @param function the function to check for continuity
   * @return true if the function is continuous, false otherwise
   */
  boolean isContinuous(Set<X> function);

  // Proposed methods:

  /**
   * Checks if a given set is an open set in this topology.
   *
   * @param set the set to check
   * @return true if the set is an open set in this topology, false otherwise
   */
  boolean isOpen(X set);

  /**
   * Checks if a given set is a closed set in this topology.
   *
   * A set is considered closed if its complement is an open set.
   *
   * @param set the set to check
   * @return true if the set is a closed set in this topology, false otherwise
   */
  boolean isClosed(Set<X> set);
}
