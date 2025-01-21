package arb.stochastic.processes.operators;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.RealSquareIntegrableFunctions;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealIntegralCovarianceOperator<F extends RealFunction> extends
                                                 IntegralCovarianceOperator<Real, F, RealSquareIntegrableFunctions>
{

}
