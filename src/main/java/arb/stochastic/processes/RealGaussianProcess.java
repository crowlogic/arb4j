package arb.stochastic.processes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.RealSquareIntegrableFunctions;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.operators.RealIntegralCovarianceOperator;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealGaussianProcess<F extends RealFunction, R extends RealIntegralCovarianceOperator<? extends F>>
                                    extends
                                    GaussianProcess<Real, F, RealSquareIntegrableFunctions, R>
{

}
