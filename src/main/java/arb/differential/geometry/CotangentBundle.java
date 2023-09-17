package arb.differential.geometry;

import arb.Field;
import arb.functions.Function;
import arb.geometry.DifferentiableManifold;
import arb.space.topological.Bundle;
import arb.space.topological.CotangentSpace;

public interface CotangentBundle<X extends Field<X>, M extends DifferentiableManifold<X>> extends
                                Bundle<X, M, CotangentSpace<X>, Function<M, CotangentSpace<X>>>
{

}
