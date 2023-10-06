package arb.space.topological;

import arb.*;
import arb.space.bornological.BornologicalSpace;

/**
 * A metric space is a {@link Set} together with a notion of distance between
 * its elements, usually called points. The distance is measured by a function
 * called a metric or distance function. Metric spaces are the most general
 * setting for studying many of the concepts of mathematical analysis and
 * geometry.
 * 
 * The most familiar example of a metric space is 3-dimensional Euclidean space
 * with its usual notion of distance. Other well-known examples are a sphere
 * equipped with the angular distance and the hyperbolic plane.
 * 
 * Many types of mathematical objects have a natural notion of distance and
 * therefore admit the structure of a metric space, including Riemannian
 * manifolds, normed vector spaces, and graphs.
 * 
 * In abstract algebra, the p-adic numbers arise as elements of the completion
 * of a metric structure on the rational numbers. Metric spaces are also studied
 * in their own right in metric geometry and analysis on metric spaces.
 * 
 * Many of the basic notions of mathematical analysis, including balls,
 * completeness, as well as uniform, Lipschitz, and Hölder continuity, can be
 * defined in the setting of metric spaces. Other notions, such as continuity,
 * compactness, and {@link OpenSet} and ClosedSet, can be defined for metric
 * spaces, but also in the even more general setting of topological
 * {@link TopologicalSpace}s.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Metric_space">MetricSpace@Wikipedia</a>
 * @param <F>  the field over which the vector space is defined
 * @param <VE> the type of the vector element
 * @param <V>  the type of the vector
 */
public interface MetricSpace<X extends Field<X>> extends
                            HausdorffSpace<X>,
                            BornologicalSpace<X>

{

  /**
   * If distance is positive, x and y can be separated.
   * 
   * See {@link HausdorffSpace#isSeparable(Object, Object)}
   */
  @Override
  public default boolean isSeparable(X x, X y)
  {
    try ( Real dist = new Real();)
    {
      Real distance = norm(new OrderedPair<>(x,
                                             y),
                           128,
                           dist);
      return distance.isPositive();
    }
  }

  /**
   * Calculates the norm (magnitude) of a given vector in the metric space with a
   * specified precision. This is done by calling the {@code evaluate} method on
   * the metric associated with this space.
   * 
   * @param v          the vector for which the norm is to be calculated.
   * @param bits       the number of bits of precision for the result of the
   *                   calculation.
   * @param normResult the {@code Real} instance in which to store the result of
   *                   the norm calculation. If this is null, a new {@code Real}
   *                   object will be returned with the result.
   *
   * @return the calculated norm of the vector {@code v} to the specified
   *         precision. If {@code normResult} was not null, it will be returned
   *         with the calculated value; otherwise, a new {@code Real} instance
   *         will be returned containing the result.
   */
  public default Real norm(OrderedPair<X, X> v, int bits, Real normResult)
  {
    return metric().evaluate(v, 1, bits, normResult);
  }

  /**
   * @return the distance function metric
   */
  public Metric<X> metric();

}
