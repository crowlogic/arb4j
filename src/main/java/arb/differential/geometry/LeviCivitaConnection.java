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
 * <pre>
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 * 
 * @author ©2023 Stephen Crowley
 * 
 */
public interface LeviCivitaConnection<X extends Field<X>, B extends TopologicalSpace<X>, M extends Manifold<X>>
                                     extends
                                     AffineConnection<X, B, M>
{

}
