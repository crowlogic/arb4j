package arb.geometry;

import java.util.Set;

import arb.Field;
import arb.space.topological.TangentSpace;
import arb.space.topological.TopologicalSpace;

public interface Manifold<X extends Field<? extends X>> extends
                         TopologicalSpace<X>
{

  /**
   * Returns the dimensionality of the manifold which is the number of its degrees
   * of freedom, for a circle for instance this would be 1, not 2 because 2 is the
   * dimension of the space its embedced in, not its intrinisic dimension
   */
  int intrinsicDimension();

  /**
   * Returns the tangent space at a given point. The tangent space is a vector
   * space that contains all possible directions at that point.
   *
   * @param point A point on the manifold.
   * @return The tangent space at the given point.
   */
  default TangentSpace<Manifold<X>, X> tangentSpace(X point)
  {
    assert false : "TODO: have " + getClass() + " implement this";
    return null;
  }

  /**
   * Checks if the given set of points forms a chart. A chart is a homeomorphism
   * from an open subset of the manifold to an open subset of the n-dimensional
   * Euclidean space.
   *
   * @param points A set of points on the manifold.
   * @return true if the points form a chart, false otherwise.
   */
  default boolean formsChart(Set<X> points)
  {
    assert false : "TODO: have " + getClass() + " implement this";
    return false;
  }

  /**
   * Maps a point from one chart to another.
   *
   * @param fromChart The original chart.
   * @param toChart   The target chart.
   * @param point     A point on the original chart.
   * @return The point mapped to the target chart.
   */
  default X mapPoint(Set<X> fromChart, Set<X> toChart, X point)
  {
    assert false : "TODO: have " + getClass() + " implement this";
    return null;
  }

}
