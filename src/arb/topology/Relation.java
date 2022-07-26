package arb.topology;

import arb.*;

/**
 * relation
 * 
 * 1. A subset of the {product} of two {@link Set}s, R : A x B. If (a, b) is an
 * element of R then we write a R b, meaning a is related to b by R. A relation
 * may be: {reflexive} (a R a), {symmetric} (a R b => b R a), {transitive} (a R
 * b & b R c => a R c), {antisymmetric} (a R b & b R a => a = b) or {total} (a R
 * b or b R a).
 * 
 * See {equivalence relation}, {partial ordering}, {pre-order}, {total
 * ordering}.
 * 
 *
 * 
 */
public class Relation<A, B> extends
                     OrderedPair<A, B>
{

}
