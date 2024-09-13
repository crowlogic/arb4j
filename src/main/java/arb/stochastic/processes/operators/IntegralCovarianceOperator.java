package arb.stochastic.processes.operators;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.operators.IntegralOperator;
import arb.operators.PositiveDefiniteOperator;
import arb.operators.SelfAdjointOperator;
import arb.space.topological.VectorSpace;

/**
 * 
 * @param <F>
 * @param <K>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface IntegralCovarianceOperator<F extends Field<? extends F>,
              K extends Function<? extends F, ? extends F>,
              V extends VectorSpace<? extends F>> extends
                                           IntegralOperator<F, K, V, V>,
                                           SelfAdjointOperator<F, V>,
                                           PositiveDefiniteOperator<V, V>

{

  @Override
  public K kernel();

}
