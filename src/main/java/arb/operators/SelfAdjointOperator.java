package arb.operators;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.VectorSpace;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface SelfAdjointOperator<F extends Field<? extends F>,
              V extends VectorSpace<? extends F>> extends
                                    NormalOperator<F, V, V>
{
  /**
   * By definition, a Self Adjoint Operator is its own adjoint. Therefore, this
   * method returns 'this' operator.
   *
   * @return this operator
   */
  @Override
  default SelfAdjointOperator<F, V> adjointOperator()
  {
    return this;
  }
}
