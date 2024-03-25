package arb.operators;

import arb.Field;
import arb.stochastic.processes.CovarianceKernel;

/**
 * 
 * @param <F>
 * @param <K>
 */
public interface IntegralCovarianceOperator<F extends Field<? extends F>,
              K extends CovarianceKernel<F>> extends
                                           IntegralOperator<F, K>
{

}
