package arb.space.topological;

import arb.Field;
import arb.Real;

/**
 * An EuclideanVectorSpace represents a special kind of VectorSpace where the
 * field of scalars and vector elements are the same. An EuclideanVectorSpace
 * also has a notion of inner product which defines an angle between any two
 * vectors. It additionally extends the EuclideanSpace, implying it has a
 * geometric structure allowing the concept of angle and length.
 * 
 * EuclideanVectorSpaces play a fundamental role in analytical geometry,
 * physics, and many other fields.
 *
 * @param <X> The type of the field over which the vector space is defined. This
 *            should extend the {@link Field} interface. In an
 *            EuclideanVectorSpace, the same type also represents vector
 *            elements.
 *
 * @see <a href="https://en.wikipedia.org/wiki/Euclidean_vector_space">Euclidean
 *      Vector Space (Mathematics)@Wikipedia</a>
 */
public interface EuclideanVectorSpace extends
                                     VectorSpace<Real>,
                                     EuclideanSpace,
                                     InnerProductSpace<Real>
{

  /**
   * Returns the dimension of the vector space.
   * 
   * @return The dimension of the vector space.
   */
  @Override
  public int intrinsicDimension();

}
