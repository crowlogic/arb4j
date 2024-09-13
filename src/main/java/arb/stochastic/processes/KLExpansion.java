package arb.stochastic.processes;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.space.topological.VectorSpace;
import arb.stochastic.processes.operators.IntegralCovarianceOperator;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface KLExpansion<D extends Field<? extends D>,
              F extends Function<? extends D, ? extends D>,
              V extends VectorSpace<? extends D>,
              T extends IntegralCovarianceOperator<? extends D,? extends F,? extends V>>
{

}
