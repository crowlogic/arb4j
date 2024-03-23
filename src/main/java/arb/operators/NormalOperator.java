package arb.operators;

import arb.Field;
import arb.space.topological.VectorSpace;

/**
 * A Normal Operator is a specific type of Bounded Linear Operator for which the
 * operator and its adjoint commute, i.e., the order in which they are applied
 * does not matter. This interface extends BoundedLinearOperator, taking in four
 * generic types: the field type F, the vector element types VE1 and VE2, and
 * the vector space types V1 and V2. It can be used to describe normal operators
 * between two possibly different vector spaces.
 *
 * In functional analysis, normal operators play an important role due to their
 * spectral properties. They are widely used in quantum mechanics where
 * self-adjoint operators (a type of normal operators) are associated with
 * observable physical quantities.
 *
 * @param <F>  The type of the field over which the vector spaces are defined.
 *             This should extend the {@link Field} interface.
 * @param <V1> The type of the domain vector space itself.
 * @param <V2> The type of the codomain vector space itself.
 */
public interface NormalOperator<F extends Field<? extends F>,
              V1 extends VectorSpace<? extends F>,
              V2 extends VectorSpace<? extends F>> extends
                               BoundedLinearOperator<F, V1, V2>
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
  BoundedLinearOperator<F, V2, V1> adjointOperator();
}
