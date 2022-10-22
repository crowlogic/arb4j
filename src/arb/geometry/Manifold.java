package arb.geometry;

import arb.geometry.curves.Circle;
import arb.geometry.curves.Lemniscate;
import arb.geometry.differential.TangentBundle;
import arb.geometry.surfaces.*;
import arb.topological.TopologicalSpace;
import arb.topological.spaces.*;

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
