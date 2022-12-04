package arb.geometry;

import arb.geometry.curves.Circle;
import arb.geometry.curves.Lemniscate;
import arb.geometry.surfaces.Plane;
import arb.geometry.surfaces.Sphere;
import arb.geometry.surfaces.Surface;
import arb.geometry.surfaces.Torus;
import arb.topological.TopologicalSpace;
import arb.topological.spaces.EuclideanSpace;

/**
 * A {@link Manifold} is a {@link TopologicalSpace} that locally resembles
 * {@link EuclideanSpace} near each point. More precisely, an n-dimensional
 * manifold, or n-manifold for short, is a topological space with the property
 * that each point has a neighborhood that is homeomorphic to an open subset of
 * n-dimensional {@link EuclideanSpace}.
 * 
 * One-dimensional manifolds include {@link Line}s and {@link Circle}s, but not
 * {@link Lemniscate}s. Two-dimensional {@link Manifold}s are otherwise known as
 * {@link Surface}; examples include the {@link Plane}, the {@link Sphere}, and
 * the {@link Torus}, and also the Klein bottle and real projective plane.
 * 
 */
public interface Manifold<X> extends
                          TopologicalSpace<X>
{
  public int dim();

}
