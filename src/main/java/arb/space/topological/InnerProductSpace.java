package arb.space.topological;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * An InnerProductSpace is a special type of NormedVectorSpace which is also
 * equipped with an inner product. The inner product is an operation that takes
 * two vectors and returns a scalar value, and it provides a way to introduce
 * geometrical concepts such as lengths and angles in the vector space. It is a
 * key concept in the field of functional analysis.
 *
 * This interface is parameterized over a field F that extends Field (the field
 * of scalars), a type VE representing vector elements, and a type V which is a
 * VectorSpace over the field F and the vector elements VE.
 * 
 * @param <F>  The type of the field over which the vector space is defined.
 *             This should extend the {@link Field} interface.
 * @param <VE> The type of the elements in the vector space.
 * @param <V>  The type of the vector space itself.
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Inner_product_space">Inner
 *      Product Space (Mathematics)@Wikipedia</a>
 * @see NormedVectorSpace
 * @see VectorSpace
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public interface InnerProductSpace<F extends Field<? extends F>> extends
                                  VectorSpace<F>
{
  /**
   * Computes the inner product of 'this' vector with 'that' vector. The
   * calculation will be performed at a specified precision level.
   * 
   * @param that   The second vector involved in the inner product computation.
   * @param prec   The precision level at which the computation is to be
   *               performed.
   * @param result
   * @return A scalar in the field F that represents the result of the inner
   *         product computation.
   */
  public F innerProduct(F that, int prec, F result);
}
