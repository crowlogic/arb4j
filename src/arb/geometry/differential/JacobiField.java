package arb.geometry.differential;

import arb.topological.spaces.TangentSpace;

/**
 * a Jacobi field is a vector field along a geodesic γ in a
 * {@link RiemannianManifold} describing the difference between the geodesic and
 * an "infinitesimally close" geodesic. In other words, the Jacobi fields along
 * a geodesic form the {@link TangentSpace} to the geodesic in the space of all
 * geodesics
 * 
 * @param <M>
 */
public interface JacobiField<M extends RiemannianManifold> extends
                            VectorField<M>
{

}
