package arb.geometry;

import arb.curves.Circle;
import arb.curves.Lemniscate;
import arb.spaces.EuclideanSpace;
import arb.spaces.Space;
import arb.surfaces.Sphere;
import arb.surfaces.Surface;

/**
 * A manifold is a topological space that locally resembles {@link EuclideanSpace} near
 * each point. More precisely, an n-dimensional manifold, or n-manifold for
 * short, is a topological space with the property that each point has a
 * neighborhood that is homeomorphic to an open subset of n-dimensional
 * Euclidean space.
 * 
 * One-dimensional manifolds include lines and {@link Circle}s, but not
 * {@link Lemniscate}s. Two-dimensional manifolds are also called
 * {@link Surface}. Examples include the plane, the {@link Sphere}, and the
 * torus, and also the Klein bottle and real projective plane.
 * 
 */
public interface Manifold extends
                          Space
{

}
