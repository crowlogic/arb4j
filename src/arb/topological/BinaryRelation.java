package arb.topological;

import arb.*;

/**
 * A {@link BinaryRelation} is {@link SubSet} of the {product} of an
 * {@link OrderedPair} of {@link Set}s, R : A x B. If (a, b)∈R then we write a R
 * b, meaning a is related to b by R. A relation may be a:
 * {@link ReflexiveRelation} (a R a) -> (a R b -> b R a), a
 * {@link TransitiveRelation} (a R b and b R c -> a R c), an
 * {@link AntiSymmetricRelation} (a R b & b R a -> a = b) or a
 * {@link TotalRelation} (a R b or b R a).
 * 
 * @see {@link EquivalenceRelation}
 * @see {partial ordering}
 * @see {pre-order}
 * @see {total ordering}
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Relation_(mathematics)">Wikipedia</a>
 */
public interface BinaryRelation<A, B> extends
                               Comparable<Object>
{

}
