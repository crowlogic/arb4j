package arb.operators;

import arb.Field;
import arb.space.topological.VectorSpace;

/**
 * A Self Adjoint Operator is a specific type of Normal Operator for which the
 * operator is its own adjoint, i.e., the operator equals its conjugate
 * transpose. These operators are particularly important in quantum mechanics,
 * where they are associated with observable quantities.
 * 
 * This interface extends NormalOperator, taking in three generic types: the
 * field type F, the vector element type VE, and the vector space type V. It can
 * be used to describe self-adjoint operators within a single vector space.
 * 
 * @param <F>  The type of the field over which the vector space is defined.
 *             This should extend the {@link Field} interface.
 * @param <VE> The type of the elements in the vector space.
 * @param <V>  The type of the vector space itself.
 */
public interface SelfAdjointOperator<F extends Field<F>, VE, V extends VectorSpace<F, VE>> extends
                                    NormalOperator<F, VE, V, VE, V>
{
  /**
   * By definition, a Self Adjoint Operator is its own adjoint. Therefore, this
   * method returns 'this' operator.
   *
   * @return this operator
   */
  @Override
  default SelfAdjointOperator<F, VE, V> adjointOperator()
  {
    return this;
  }
}
