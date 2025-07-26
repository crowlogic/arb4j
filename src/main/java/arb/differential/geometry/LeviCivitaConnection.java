package arb.differential.geometry;

import arb.Field;

import arb.geometry.Manifold;
import arb.space.topological.TopologicalSpace;

/**
 * the Levi-Civita connection is the unique {@link AffineConnection} on the
 * {@link TangentBundle} of a {@link Manifold} (i.e. affine connection) that
 * preserves the (pseudo-)Riemannian metric and is torsion-free.
 * 
 * The fundamental theorem of Riemannian geometry states that there is a unique
 * connection which satisfies these properties.
 * 
 * In the theory of Riemannian and pseudo-Riemannian manifolds the term
 * covariant derivative is often used for the Levi-Civita connection. The
 * components (structure coefficients) of this connection with respect to a
 * system of local coordinates are called Christoffel symbols.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface LeviCivitaConnection<X extends Field<X>, B extends TopologicalSpace<X>, M extends RiemannianManifold<X>>
                                     extends
                                     AffineConnection<X, B, M>
{

}
