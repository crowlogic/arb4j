package arb.operators;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.VectorSpace;

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
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface BoundedLinearOperator<F extends Field<? extends F>,
              V extends VectorSpace<? extends F>,
              U extends VectorSpace<? extends F>> extends
                                      LinearOperator<F, V, U>
{

  /**
   * Computes the norm of 'this' operator. The norm of a bounded linear operator
   * 'T' is a measure of how much 'T' can "stretch" the space.
   * 
   * @param result TODO
   *
   * @return The norm of 'this' operator.
   */
  F norm(F result);

  /**
   * Computes the adjoint of 'this' operator. The adjoint of a linear operator is
   * a unique operator such that the inner product of a vector 'v' and the result
   * of applying the original operator to a vector 'w' equals the inner product of
   * the result of applying the adjoint operator to 'v' and 'w', for all vectors
   * 'v' and 'w'.
   *
   * @return The adjoint of 'this' operator.
   */
  BoundedLinearOperator<F, V, U> adjointOperator();

  // other properties and methods specific to bounded linear operators...
}
