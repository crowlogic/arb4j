package arb.documentation.concepts.stochastic;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.RealGaussianProcess;
import arb.stochastic.processes.operators.RealIntegralCovarianceOperator;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface StationaryGaussianProcesses<F extends RealFunction, R extends RealIntegralCovarianceOperator<F>>
                                            extends
                                            RealGaussianProcess<F,R>
{

}
