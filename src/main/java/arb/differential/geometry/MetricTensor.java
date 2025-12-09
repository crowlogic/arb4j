package arb.differential.geometry;

import arb.Field;
import arb.space.topological.NormedVectorSpace;

/**
 * Represents a metric tensor, a fundamental object in differential geometry,
 * specifically designed for use on {@link NormedVectorSpace}s. The metric
 * tensor provides a way to measure distances, define angles, and calculate
 * inner products in a space, encapsulating the geometric structure of the
 * space.
 *
 * A metric tensor generalizes the concept of a dot product in Euclidean space
 * and extends it to more complex spaces, serving as a key tool in general
 * relativity and other fields of physics.
 *
 * @param <F> The type of the field over which the normed vector space is
 *            defined, typically real or complex numbers.
 * @param <V> The specific normed vector space on which this metric tensor
 *            operates.
 */
public interface MetricTensor<F extends Field<? extends F>, V extends NormedVectorSpace<? extends F, ? extends V>>
{

  /**
   * Computes the metric tensor value for a pair of vectors in the normed vector
   * space. This function quantifies the inner product of these vectors,
   * fundamental to the geometric interpretations of the space.
   *
   * @param v1 the first vector
   * @param v2 the second vector
   * @return the inner product of the vectors, represented as an element of the
   *         field F
   */
  F computeMetric(V v1, V v2);

  /**
   * Retrieves the components of the metric tensor, typically represented as a
   * matrix. Each component in the matrix represents the inner product between
   * basis vectors of the normed vector space, providing the fundamental geometric
   * structure of the space.
   *
   * @return a matrix of field elements F, representing the components of the
   *         metric tensor
   */
  F[][] getMetricComponents();

  /**
   * Sets the components of the metric tensor. This method allows for adjustments
   * of the tensor's definition, which might be necessary during transformations
   * or in adaptive computational models.
   *
   * @param components the new components of the metric tensor, given as a matrix
   *                   of field elements F
   */
  void setMetricComponents(F[][] components);
}
