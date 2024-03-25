package arb.operators;

import arb.Field;
import arb.OrthogonalBasis;
import arb.space.topological.HilbertSpace;

/**
 * The Hilbert-Schmidt Operator interface models a specific type of bounded
 * linear operator between two Hilbert spaces, which also are topological vector
 * spaces with an inner product.
 * 
 * A Hilbert-Schmidt operator 'T' is an operator that is 'square integrable',
 * meaning that the integral of the square of the absolute value of the operator
 * applied to a function is finite. In other words, the operator 'T' satisfies:
 * 
 * \[ \int ||Tf(x)||^2 dx < \infty \]
 * 
 * for all functions 'f' in the space. This property makes Hilbert-Schmidt
 * operators a type of compact operator, which is a class of operators that map
 * bounded sets into relatively compact sets.
 *
 * The Hilbert-Schmidt norm of a Hilbert-Schmidt operator 'T' is defined as the
 * square root of the sum of the squares of the singular values of 'T'.
 *
 * This interface extends CompactOperator, meaning it inherits all the methods
 * and properties of compact operators in addition to defining its own
 * properties and methods specific to Hilbert-Schmidt operators.
 * 
 * @param <F>  The type of the field over which the vector spaces are defined.
 * @param <VE> The type of the elements in the Hilbert space.
 * @param <O>  the type of {@link OrthogonalBasis}
 * @param <V>  The type of the Hilbert space itself.
 */
public interface HilbertSchmidtOperator<F extends Field<F>,
              O extends OrthogonalBasis<? extends F, ?>,
              V extends HilbertSpace<? extends F, O>> extends
                                       CompactOperator<F>
{
  /**
   * Computes the Hilbert-Schmidt norm of 'this' operator. The Hilbert-Schmidt
   * norm of a Hilbert-Schmidt operator 'T' is defined as the square root of the
   * sum of the squares of the singular values of 'T'.
   *
   * This method overrides the norm method of the BoundedLinearOperator interface.
   *
   * @return The Hilbert-Schmidt norm of 'this' operator.
   */
  @Override
  F norm();
}
