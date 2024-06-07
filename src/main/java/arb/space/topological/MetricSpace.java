package arb.space.topological;

import arb.Metric;
import arb.Real;
import arb.geometry.Manifold;
import arb.space.bornological.BornologicalSpace;

/**
 * A MetricSpace is a set equipped with a metric that defines the distance
 * between elements of the set. This interface eRealtends HausdorffSpace and
 * BornologicalSpace, incorporating concepts of separability and boundedness.
 */
public interface MetricSpace extends
                             HausdorffSpace<Real>,
                             BornologicalSpace<Real>,
                             Manifold<Real>
{

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
  Real distance(int bits, Real Real, Real y, Real res);

  /**
   * Provides the metric used in this space for distance calculations.
   * 
   * @return Metric object which can compute the distance between two points.
   */
  Metric<Real> metric();

  /**
   * Overrides the separability test from HausdorffSpace using the metric defined.
   * 
   * @param Real The first element to test for separability.
   * @param y    The second element to test for separability.
   *
   * @return true if the elements are separable, false otherwise.
   */
  @Override
  default boolean isSeparable(int bits, Real Real, Real y)
  {
    try ( Real distance = distance(bits, Real, y, new Real()))
    {
      return distance.isPositive();
    }
  }
}
