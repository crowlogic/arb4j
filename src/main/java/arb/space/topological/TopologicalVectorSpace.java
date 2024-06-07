package arb.space.topological;

import arb.Field;

/**
 * A Topological Vector Space is a vector space that is also a topological
 * space, such that vector addition and scalar multiplication are continuous
 * functions.
 *
 * It generalizes the concept of Euclidean space by combining the structures of
 * a vector space and a topological space in a compatible way.
 *
 * This interface is parameterized over a {@link Field} F of scalars and a type
 * VE representing vector elements.
 * 
 * @param <F>  The type of the field over which the vector space is defined.
 *             This should extend the {@link Field} interface.
 * @param <VE> The type of the elements in the vector space.
 *
 * @see VectorSpace
 * @see TopologicalSpace
 */
public interface TopologicalVectorSpace<F extends Field<? extends F>> extends
                                       VectorSpace<F>,
                                       TopologicalSpace<F>
{
}
