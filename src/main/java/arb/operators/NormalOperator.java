package arb.operators;

import arb.Field;
import arb.annotations.Commutative;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.VectorSpace;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface NormalOperator<F extends Field<? extends F>,
              V extends VectorSpace<? extends F>,
              U extends VectorSpace<? extends F>> extends
                               BoundedLinearOperator<F, V, U>
{
  /**
   * Computes and returns the adjoint (conjugate transpose) of this operator. The
   * {@link Commutative} annotation denotes that the operation of this operator
   * commutes with the operation of its adjoint operator.
   *
   * The adjoint of a linear operator is a unique operator such that the inner
   * product of a vector 'v' and the result of applying the original operator to a
   * vector 'w' equals the inner product of the result of applying the adjoint
   * operator to 'v' and 'w', for all vectors 'v' and 'w'.
   *
   * @return the adjoint of this operator
   */
  BoundedLinearOperator<F, V, U> adjointOperator();
}
