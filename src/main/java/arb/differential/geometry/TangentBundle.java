package arb.differential.geometry;

import arb.Field;
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
 */
public interface TangentBundle<X extends Field<X>, M extends DifferentiableManifold<X>> extends
                              Bundle<M, TangentSpace<M>, Function<M, TangentSpace<M>>>
{

}
