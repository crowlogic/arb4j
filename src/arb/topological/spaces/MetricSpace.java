package arb.topological.spaces;

import arb.Field;
import arb.Metric;
import arb.OpenSet;
import arb.Set;
import arb.topological.TopologicalSpace;

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
 */
public interface MetricSpace<X extends Field> extends
                            TopologicalSpace<X>
{
  /**
   * @return the distance function metric
   */
  public Metric<X> metric();
}
