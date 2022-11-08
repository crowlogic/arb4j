package arb.differential.geometry;

import arb.functions.Function;
import arb.geometry.DifferentiableManifold;
import arb.topological.spaces.Bundle;
import arb.topological.spaces.CotangentSpace;

public interface CotangentBundle<M extends DifferentiableManifold> extends
                                Bundle<M, CotangentSpace<M>, Function<M, CotangentSpace<M>>>
{

}
