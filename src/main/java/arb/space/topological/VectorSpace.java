package arb.space.topological;

import arb.Field;

/**
 * Represents a vector space over a field F with elements of type VE.
 *
 * A vector space is a mathematical structure formed by a collection of elements
 * called vectors, which may be added together and multiplied by numbers, called
 * scalars. Scalars are often taken to be real numbers, but some vector spaces
 * allow scalars from other number systems.
 *
 * This interface is parameterized over a field F that extends Field (the field
 * of scalars), and a type VE representing vector elements.
 *
 * @param <F> The type of the field over which the vector space is defined. This
 *            should extend the {@link Field} interface.
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Vector_space">VectorSpace
 *      (Mathematics)@Wikipedia</a>
 */
public interface VectorSpace<F extends Field<? extends F>> extends
                            Space<F>
{

}
