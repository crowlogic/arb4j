package arb.geometry.differential;

import arb.geometry.Manifold;
import arb.topological.spaces.EuclideanSpace;
import arb.topological.spaces.TangentSpace;

/**
 * the covariant derivative is a way of specifying a derivative along tangent
 * vectors of a {@link Manifold}. Alternatively, the covariant derivative is a
 * way of introducing and working with a {@link Connection} on a
 * {@link Manifold} by means of a differential operator, to be contrasted with
 * the approach given by a principal connection on the frame bundle – see
 * {@link AffineConnection}. In the special case of a manifold isometrically
 * embedded into a higher-dimensional {@link EuclideanSpace}, the covariant
 * derivative can be viewed as the orthogonal projection of the Euclidean
 * directional derivative onto the manifold's {@link TangentSpace}. In this case
 * the Euclidean derivative is broken into two parts, the extrinsic normal
 * component (dependent on the embedding) and the intrinsic covariant derivative
 * component.
 * 
 * The name is motivated by the importance of changes of coordinate in physics:
 * the covariant derivative transforms covariantly under a general coordinate
 * transformation, that is, linearly via the Jacobian matrix of the
 * transformation.[1]
 * 
 * This article presents an introduction to the covariant derivative of a vector
 * field with respect to a vector field, both in a coordinate free language and
 * using a local coordinate system and the traditional index notation. The
 * covariant derivative of a tensor field is presented as an extension of the
 * same concept. The covariant derivative generalizes straightforwardly to a
 * notion of differentiation associated to a connection on a vector bundle, also
 * known as a Koszul connection.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Covariant_derivative">CovariantDerivative@Wikipedia</a>
 */
public interface CovariantDerivative
{

}
