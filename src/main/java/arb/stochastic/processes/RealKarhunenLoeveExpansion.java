package arb.stochastic.processes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.space.topological.RealVectorSpace;
import arb.stochastic.processes.operators.IntegralCovarianceOperator;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealKarhunenLoeveExpansion<R extends RealFunction,
              V extends RealVectorSpace,
              T extends IntegralCovarianceOperator<Real, ? extends R, ? extends V>> implements
                                       KLExpansion<Real, R, V, T>
{

}
