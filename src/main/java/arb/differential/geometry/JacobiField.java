package arb.differential.geometry;

import arb.Field;
import arb.space.topological.TangentSpace;

/**
 * a Jacobi field is a vector field along a geodesic γ in a
 * {@link RiemannianManifold} describing the difference between the geodesic and
 * an "infinitesimally close" geodesic. In other words, the Jacobi fields along
 * a geodesic form the {@link TangentSpace} to the geodesic in the space of all
 * geodesics
 * 
 * @param <M>
 */
public interface JacobiField<X extends Field<X>, M extends RiemannianManifold<X>> extends
                            VectorField<X, M>
{

}
