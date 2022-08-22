package arb.topological;

import arb.Set;

/**
 * a binary relation R across a set X is reflexive if each element of set X is
 * related or linked to itself. In terms of relations, this can be defined as
 * (a, a) ∈ R ∀ a ∈ X or as I ⊆ R where I is the identity relation on A. Thus,
 * it has a reflexive property and is said to hold reflexivity.
 * 
 * @author crow
 *
 * @param <A>
 * @param <B>
 */
public interface ReflexiveRelation<X extends Set> extends
                                  BinaryRelation<X, X>
{

}
