package arb.differential.geometry;

import arb.geometry.Manifold;

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
 * @author crow
 *
 */
public interface LeviCivitaConnection<M extends Manifold> extends
                                     AffineConnection<M>
{

}
