package arb.space.bornological;

import java.util.Set;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A Bornology is a mathematical structure that is defined on a set and consists of a
 * collection of subsets, referred to as "bounded sets", that satisfy certain axioms.
 *
 * In a Bornological space, the concept of boundedness is well-defined, but it's
 * independent from the notions of distance or topology. Bornologies provide a formalized
 * understanding of concepts like boundedness, absorbency, and balancedness.
 *
 * @param <X> the type of elements in the space
 *
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public interface Bornology<X>
{

  /**
   * Returns the set of bounded subsets for a given point.
   *
   * @param point the point for which the bounded sets are to be returned
   * @return a set of bounded subsets for the point
   */
  Set<Set<X>> getBoundedSets(X point);

  /**
   * Checks if the given subset is bounded.
   *
   * @param subset the subset to be checked
   * @return true if the subset is bounded, false otherwise
   */
  boolean isBounded(Set<X> subset);
}
