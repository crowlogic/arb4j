package arb.stochastic.processes;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.space.topological.VectorSpace;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface GaussianProcess<D extends Field<? extends D>,
              R extends Field<? extends R>,
              K extends Function<? extends D, ? extends R>,
              V extends VectorSpace<? extends D>>
{

}
