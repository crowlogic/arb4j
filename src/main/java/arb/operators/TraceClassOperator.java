package arb.operators;

import arb.Field;
import arb.OrthogonalBasis;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.HilbertSpace;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface TraceClassOperator<F extends Field<? extends F>, VE, O extends OrthogonalBasis<? extends F, ?>, V extends HilbertSpace<? extends F, O>>
                                   extends
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
   * @return the sum of the eigenvalues of this operator represented an element of
   *         the field $F$ over which the vector spaces are defined
   */
  F trace();
}
