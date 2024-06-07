package arb.differential.geometry;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.geometry.Manifold;
import arb.space.topological.TangentSpace;
import arb.space.topological.TopologicalSpace;
import arb.space.topological.VectorSpace;

/**
 * An {@link AffineConnection} is a geometric object on a smooth
 * {@link Manifold} which connects nearby {@link TangentSpace}s, so it permits
 * tangent vector fields to be differentiated as if they were {@link Function}s
 * on the {@link Manifold} with values in a fixed {@link VectorSpace}.
 * Connections are among the simplest methods of defining differentiation of the
 * sections of a {@link VectorBundle}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface AffineConnection<X extends Field<? extends X>, B extends TopologicalSpace<? extends X>, M extends RiemannianManifold<? extends X>>
                                 extends
                                 Connection<X, B>
{
  public RiemannCurvatureTensor<? extends X, ? extends M> getCurvatureTensor();
}
