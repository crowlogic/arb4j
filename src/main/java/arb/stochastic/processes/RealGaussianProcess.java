package arb.stochastic.processes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.RealSquareIntegrableFunctions;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealGaussianProcess<K extends RealFunction> extends
                                    GaussianProcess<Real, Real, K, RealSquareIntegrableFunctions>

{

}
