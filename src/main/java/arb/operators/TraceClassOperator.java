package arb.operators;

import arb.Field;
import arb.OrthogonalBasis;
import arb.space.topological.HilbertSpace;

/**
 * Trace class operators, or nuclear operators, are certain bounded linear
 * operators on Hilbert space that generalize matrices of finite rank. These
 * operators can be described in terms of trace and provide a natural
 * generalization of Hilbert-Schmidt operators.
 *
 * @param <F>  The type of the field over which the vector spaces are defined.
 * @param <VE> The type of the elements in the Hilbert space.
 * @param <V>  The type of the Hilbert space itself.
 */
public interface TraceClassOperator<F extends Field<F>,
              VE,
              O extends OrthogonalBasis<? extends F,?>,
              V extends HilbertSpace<? extends F, O>> extends
                                   NuclearOperator<F, V, V>
{
  /**
   * In the finite-dimensional case, the trace of an operator (matrix) is the sum
   * of its diagonal elements. However, in the infinite-dimensional case, things
   * become a bit more complex.
   * 
   * For a bounded linear operator $T: H \rightarrow H$ on a Hilbert Space $H$,
   * the trace of $T$, denoted as $Tr(T)$, is defined as the sum of the
   * eigenvalues of $T$, each counted according to its multiplicity.
   * 
   * However, this sum can be infinite. A trace class operator is a bounded
   * operator on a Hilbert space for which the trace is well-defined and finite.
   * This requires the operator to be compact, which means that it sends bounded
   * sets to relatively compact sets, and the sequence of eigenvalues should
   * decrease sufficiently quickly to make the sum finite.
   * 
   * The trace itself should return .
   * 
   * @return the sum of the eigenvalues of this operator represented an element of
   *         the field $F$ over which the vector spaces are defined
   */
  F trace();
}
