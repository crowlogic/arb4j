package arb.differential.geometry;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.geometry.DifferentiableManifold;
import arb.geometry.Manifold;
import arb.space.topological.Bundle;
import arb.space.topological.TangentSpace;

/**
 * the tangent bundle of a {@link DifferentiableManifold} is a {@link Manifold}
 * TM which assembles all the tangent vectors in M. As a set, it is given by the
 * disjoint union of the tangent spaces of M
 * 
 * TODO: also {@link CotangentBundle}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface TangentBundle<X extends Field<? extends X>, M extends DifferentiableManifold<X>> extends
                              Bundle<X, M, TangentSpace<M, X>, Function<M, TangentSpace<M, X>>>
{

}
