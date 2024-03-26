package arb.operators;

import arb.Field;
import arb.stochastic.processes.CovarianceKernel;

/**
 * 
 * @param <F>
 * @param <K>
 */
public interface IntegralCovarianceOperator<F extends Field<? extends F>,
              K extends CovarianceKernel<? extends F>> extends
                                           IntegralOperator<F, K>
{

  @Override
  public K kernel();

}
