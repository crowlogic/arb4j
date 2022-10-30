package arb.geometry.differential;

import arb.functions.Function;
import arb.geometry.Manifold;
import arb.topological.spaces.TangentSpace;

/**
 * Let (M, g) be a {@link RiemannianManifold} and X(M) be the space of all
 * {@link VectorField}s on M. We define the Riemann curvature tensor as a
 * {@link Function}
 * 
 * R : X(M) × X(M) × X(M)→X(M) by the following formula where ∇ is an
 * {@link AffineConnection}:
 * 
 * R(X,Y)Z = ∇X∇YZ − ∇Y∇XZ − ∇[X,Y]Z
 * 
 * or equivalently
 * 
 * R(X,Y)=[∇X,∇Y] − ∇[X,Y]
 * 
 * where [X, Y] is the Lie bracket of {@link VectorField} and [X,∇Y] is a
 * commutator of differential operators. For each pair of tangent vectors u, v,
 * R(u, v) is a linear transformation of the {@link TangentSpace} of the
 * {@link Manifold}. It is linear in u and v, and so defines a tensor.
 *
 */
public interface RiemannCurvatureTensor<M extends RiemannianManifold> extends
                                       TidalTensor
{

}
