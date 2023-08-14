package arb.space.topological;

import arb.Field;
import arb.operators.LinearFunctional;

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
 * @param <F>  The type of the field over which the vector space is defined.
 *             This should extend the {@link Field} interface.
 * @param <VE> The type of the elements in the vector space.
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Vector_space">VectorSpace
 *      (Mathematics)@Wikipedia</a>
 */
public interface VectorSpace<F extends Field<F>, VE> extends
                            Space<VE>
{
  /**
   * Returns the field over which the vector space is defined.
   *
   * @return The field over which the vector space is defined.
   */
  F field();

  /**
   * Add two vectors together.
   *
   * @param a         The first vector.
   * @param b         The second vector.
   * @param precision The number of bits of precision to use in the addition.
   * @param result    The resulting vector.
   * @return The result of adding a and b, represented as a VectorSpace<F, VE>.
   */
  VectorSpace<F, VE> add(VE a, VE b, int precision, VE result);

  /**
   * Scale a vector by a scalar.
   *
   * @param vector    The vector to be scaled.
   * @param scalar    The scalar to multiply the vector by.
   * @param precision The number of bits of precision to use in the scaling.
   * @param result    The resulting vector.
   * @return The result of scaling the vector, represented as a VectorSpace<F,
   *         VE>.
   */
  VectorSpace<F, VE> scale(VE vector, F scalar, int precision, VE result);

  /**
   * Returns the dual space of the current vector space. The dual space consists
   * of linear functionals, which are mappings from the vector space to its
   * underlying field. Each linear functional takes a vector from the vector space
   * and produces a scalar value.
   *
   * @return The dual space of the vector space, represented as a VectorSpace<F,
   *         LinearFunctional<F, VE>>.
   */
  VectorSpace<F, LinearFunctional<F, VE>> dual();
}
