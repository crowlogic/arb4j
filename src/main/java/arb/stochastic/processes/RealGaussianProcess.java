package arb.stochastic.processes;

import arb.Pair;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.space.topological.EuclideanSpace;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
interface RealGaussianProcess<K extends Pair<Real, Real>, F extends Function<K, Real>> extends
                             GaussianProcess<Real, F, EuclideanSpace<Real>>
{

}
