package arb.space.topological;

import arb.Field;
import arb.Metric;
import arb.geometry.Manifold;
import arb.space.bornological.BornologicalSpace;

/**
 * A MetricSpace is a set equipped with a metric that defines the distance
 * between elements of the set. This interface eRealtends HausdorffSpace and
 * BornologicalSpace, incorporating concepts of separability and boundedness.
 */
public interface MetricSpace<F extends Field<? extends F>> extends
                            HausdorffSpace<F>,
                            BornologicalSpace<F>,
                            Manifold<F>
{

  @Override
  default boolean isSeparable(int bits, F x, F y)
  {
    try ( F distance = distance(bits, x, y, y.newFieldElement()))
    {
      return distance.isPositive();
    }
  }

  public int[] signature();

  /**
   * Calculates the distance between two points in the space. This method should
   * be defined to utilize the metric associated with the space.
   * 
   * @param Real The first point in the metric space.
   * @param y    The second point in the metric space.
   * @param res  where to store the result
   * 
   * @return The distance as a Real number.
   */
  F distance(int bits, F Real, F y, F res);

  /**
   * Provides the metric used in this space for distance calculations.
   * 
   * @return Metric object which can compute the distance between two points.
   */
  Metric<F> metric();

  /**
   * Overrides the separability test from HausdorffSpace using the metric defined.
   * 
   * @param Real The first element to test for separability.
   * @param y    The second element to test for separability.
   *
   * @return true if the elements are separable, false otherwise.
   */

}
