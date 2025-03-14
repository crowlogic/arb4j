package arb.stochastic.processes;

import arb.Pair;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.space.topological.VectorSpace;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface GaussianProcess<F, K extends Function<? extends Pair<? extends F, ? extends F>, ? extends F>,
              V extends VectorSpace<? extends F>>
{

}
