package arb.differential.geometry;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.geometry.DifferentiableManifold;
import arb.space.topological.Bundle;
import arb.space.topological.CotangentSpace;

/**
 * 
 * @param <X>
 * @param <M>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface CotangentBundle<X extends Field<? extends X>, M extends DifferentiableManifold<? extends X>> extends
                                Bundle<X, M, CotangentSpace<? extends M, ? extends X>, Function<? extends M, CotangentSpace<? extends M, ? extends X>>>
{

}
