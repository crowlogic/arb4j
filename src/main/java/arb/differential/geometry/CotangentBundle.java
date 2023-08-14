package arb.differential.geometry;

import arb.functions.Function;
import arb.geometry.DifferentiableManifold;
import arb.space.topological.Bundle;
import arb.space.topological.CotangentSpace;

public interface CotangentBundle<M extends DifferentiableManifold> extends
                                Bundle<M, CotangentSpace<M>, Function<M, CotangentSpace<M>>>
{

}
