package arb;

import arb.topological.EquivalenceRelation;

/**
 * when the elements of some {@link Set} S S have a notion of equivalence
 * (formalized as an {@link EquivalenceRelation}), then one may naturally split
 * the set S into {@link EquivalenceClass}es. These equivalence classes are
 * constructed so that elements a and b belong to the same
 * {@link EquivalenceClass} if, and only if, they are equivalent.
 * 
 * Formally, given a set S and an {@link EquivalenceRelation} on S ,
 * {@link EquivalenceClass} of an element a in S is denoted by [ a ] { x ∈ S : x
 * ∼ a } of elements which are equivalent to a. It may be proven, from the
 * defining properties of {@link EquivalenceRelation}, that the
 * {@link EquivalenceClass} form a partition of S This partition—the set of
 * {@link EquivalenceClass}es—is sometimes called the {@link QuotientSet} or the
 * quotient space of S by ∼ and is denoted by S / ∼ <br>
 * <br>
 * 
 * When the set S {\displaystyle S} S has some structure (such as a group
 * operation or a topology) and the {@link EquivalenceRelation} ∼ is compatible
 * with this structure, the {@link QuotientSet} often inherits a similar
 * structure from its parent set. Examples include quotient spaces in linear
 * algebra, quotient spaces in topology, quotient groups, homogeneous spaces,
 * quotient rings, quotient monoids, and quotient categories.
 * 
 * @author crow
 *
 * @param <X>
 */
public interface EquivalenceClass<X extends Set> extends
                                 Set<X>
{
  public EquivalenceRelation<X, X> equivalenceRelation();
}
