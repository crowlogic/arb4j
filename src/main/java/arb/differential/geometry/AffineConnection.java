package arb.differential.geometry;

import arb.Field;
import arb.functions.Function;
import arb.geometry.Manifold;
import arb.space.topological.*;

/**
 * An {@link AffineConnection} is a geometric object on a smooth
 * {@link Manifold} which connects nearby {@link TangentSpace}s, so it permits
 * tangent vector fields to be differentiated as if they were {@link Function}s
 * on the {@link Manifold} with values in a fixed {@link VectorSpace}.
 * Connections are among the simplest methods of defining differentiation of the
 * sections of a {@link VectorBundle}
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Affine_connection">AffineConnection@Wikipedia</a>
 *
 */
public interface AffineConnection<X extends Field<X>, B extends TopologicalSpace<X>, M extends Manifold<X>> extends
                                 Connection<X, B>
{
  public RiemannCurvatureTensor getCurvatureTensor();
}
