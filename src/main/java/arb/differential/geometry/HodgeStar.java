package arb.differential.geometry;

import arb.operators.LinearOperator;

/**
 * the Hodge star operator or Hodge star is a map defined by a
 * {@link LinearOperator} defined on the exterior algebra of a
 * finite-dimensional oriented vector space endowed with a nondegenerate
 * symmetric bilinear form. Applying the operator to an element of the algebra
 * produces the Hodge dual of the element. This map was introduced by W. V. D.
 * Hodge.
 * 
 * For example, in an oriented 3-dimensional Euclidean space, an oriented plane
 * can be represented by the exterior product of two basis vectors, and its
 * Hodge dual is the normal vector given by their cross product; conversely, any
 * vector is dual to the oriented plane perpendicular to it, endowed with a
 * suitable bivector. Generalizing this to an n-dimensional vector space, the
 * Hodge star is a one-to-one mapping of k-vectors to (n – k)-vectors; the
 * dimensions of these spaces are the binomial coefficients ( n k ) = ( n n − k
 * ) {\displaystyle {\tbinom {n}{k}}={\tbinom {n}{n-k}}} {\displaystyle {\tbinom
 * {n}{k}}={\tbinom {n}{n-k}}}.
 * 
 * The naturalness of the star operator means it can play a role in differential
 * geometry, when applied to the cotangent bundle of a pseudo-Riemannian
 * manifold, and hence to differential k-forms. This allows the definition of
 * the codifferential as the Hodge adjoint of the exterior derivative, leading
 * to the Laplace–de Rham operator. This generalizes the case of 3-dimensional
 * Euclidean space, in which divergence of a vector field may be realized as the
 * codifferential opposite to the gradient operator, and the Laplace operator on
 * a function is the divergence of its gradient. An important application is the
 * Hodge decomposition of differential forms on a closed Riemannian manifold.
 * 
 * @see <a href=
 *      "https://en.m.wikipedia.org/wiki/Hodge_star_operator">HodgeStarOperator@Wikipedia</a>
 */
public interface HodgeStar extends
                           LinearOperator
{

}
