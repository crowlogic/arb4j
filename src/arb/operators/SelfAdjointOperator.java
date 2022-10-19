package arb.operators;

import arb.Complex;
import arb.Real;
import arb.topological.spaces.VectorSpace;

/**
 * a self-adjoint {@link Operator} on an infinite-dimensional {@link Complex}
 * {@link VectorSpace} with inner product ⟨ ⋅ , ⋅ ⟩ (equivalently, a Hermitian
 * operator in the finite-dimensional case) is a linear map A (from V to itself)
 * that is its own adjoint. If V is finite-dimensional with a given orthonormal
 * basis, this is equivalent to the condition that the matrix of A is a
 * Hermitian matrix, i.e., equal to its conjugate transpose A∗. By the
 * finite-dimensional spectral theorem, V has an orthonormal basis such that the
 * matrix of A relative to this basis is a diagonal matrix with entries in the
 * {@link Real} numbers.
 * 
 * @author crow
 *
 */
public interface SelfAdjointOperator extends
                                     VectorSpace<Complex>,
                                     LinearOperator
{

}
