package arb.operators;

import arb.Field;

/**
 * A Bounded Linear Operator is a Linear Operator between two possibly different
 * Banach spaces (complete normed vector spaces) such that the operator norm is
 * finite. This means the operator does not "stretch" the space infinitely.
 * Bounded Linear Operators have various important properties and are
 * extensively used in functional analysis.
 *
 * The adjoint of a Bounded Linear Operator is a key concept in the context of
 * Hilbert spaces.
 *
 * @param <F>   The type of the field over which the vector spaces are defined.
 *              This should extend the {@link Field} interface.
 * @param <VE1> The type of the elements in the domain vector space.
 * @param <V1>  The type of the domain vector space itself.
 * @param <VE2> The type of the elements in the codomain vector space.
 * @param <V2>  The type of the codomain vector space itself.
 */
public interface BoundedLinearOperator<F extends Field<? extends F>> extends
                                      LinearOperator<F>
{

  /**
   * Computes the norm of 'this' operator. The norm of a bounded linear operator
   * 'T' is a measure of how much 'T' can "stretch" the space.
   *
   * @return The norm of 'this' operator.
   */
  F norm();

  /**
   * Computes the adjoint of 'this' operator. The adjoint of a linear operator is
   * a unique operator such that the inner product of a vector 'v' and the result
   * of applying the original operator to a vector 'w' equals the inner product of
   * the result of applying the adjoint operator to 'v' and 'w', for all vectors
   * 'v' and 'w'.
   *
   * @return The adjoint of 'this' operator.
   */
  BoundedLinearOperator<F> adjointOperator();

  // other properties and methods specific to bounded linear operators...
}
