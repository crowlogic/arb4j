package arb.geometry;

import java.util.Set;

import org.fxyz3d.shapes.Torus;

import arb.Field;
import arb.geometry.curves.Circle;
import arb.geometry.curves.Lemniscate;
import arb.geometry.surfaces.Plane;
import arb.geometry.surfaces.Sphere;
import arb.geometry.surfaces.Surface;
import arb.space.topological.EuclideanSpace;
import arb.space.topological.TopologicalSpace;

/**
 * A {@link Manifold} is a {@link TopologicalSpace} that locally resembles
 * {@link EuclideanSpace} near each point. More precisely, an n-dimensional
 * manifold, or n-manifold for short, is a topological space with the property
 * that each point has a neighborhood that is homeomorphic to an open subset of
 * n-dimensional {@link EuclideanSpace}.
 * 
 * One-dimensional manifolds include {@link Line}s and {@link Circle}s.
 * Two-dimensional {@link Manifold}s are otherwise known as {@link Surface};
 * examples include the {@link Plane}, the {@link Sphere}, and the
 * {@link Torus}, and also the Klein bottle and real projective plane.
 *
 * Note that {@link Lemniscate}s are not considered manifolds because they do
 * not fulfill the above condition at the intersection of the two loops. More
 * precisely, the neighborhood around the intersection point does not resemble
 * an open subset of the one-dimensional Euclidean space.
 * 
 */
public interface Manifold<X extends Field<X>> extends
                         TopologicalSpace<X>
{

  /**
   * Returns the dimensionality of the manifold.
   */
  int dim();

  /**
   * Returns the tangent space at a given point. The tangent space is a vector
   * space that contains all possible directions at that point.
   *
   * @param point A point on the manifold.
   * @return The tangent space at the given point.
   */
  default EuclideanSpace<X> tangentSpace(X point)
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
