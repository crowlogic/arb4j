package arb.space.topological;

import arb.Field;
import arb.OrthogonalBasis;

/**
 * A Hilbert space is a special kind of vector space equipped with an inner
 * product, which allows the definition of geometrical concepts such as angles
 * and lengths. It is also a complete space, which means that Cauchy sequences
 * of vectors in the space converge to a limit within the space. Hilbert spaces
 * are key objects in functional analysis and quantum mechanics.
 *
 * This interface extends {@link BanachSpace}, since every {@link HilbertSpace}
 * is a {@link BanachSpace}, and {@link InnerProductSpace}, which allows us to
 * define an inner product on the vectors in the space. Hilbert spaces introduce
 * the additional capability of changing the basis in which vectors are
 * expressed.
 *
 * @param <F>  The type of the field over which the vector space is defined.
 *             This should extend the {@link Field} interface.
 * @param <VE> The type of the elements in the vector space.
 * @param <S>  The type of the Hilbert space itself.
 */
public interface HilbertSpace<F extends Field<F>, VE, O extends OrthogonalBasis<F, VE>> extends
                             BanachSpace<F, VE>,
                             InnerProductSpace<F, VE>
{
  /**
   * Returns an orthonormal basis for this space.
   *
   * @return an OrthonormalBasis instance representing an orthonormal basis for
   *         this Hilbert space
   */
  OrthogonalBasis<F, VE> basis();

  /**
   * Given a vector described in terms of the basis provided, this method computes
   * and returns the representation of this vector in the default basis of this
   * space (as would be returned by {@link #getBasis()}).
   *
   * @param vectorInBasis the vector, described in terms of the provided basis
   * @param basis         the basis with respect to which the provided vector is
   *                      currently defined
   * @return the representation of the vector in the default basis of this Hilbert
   *         space, returned as an instance of the field F
   */
  F changeTo(F vectorInBasis, O basis);

  /**
   * Given a vector described in terms of the default basis of this space (as
   * would be returned by {@link #getBasis()}), this method computes and returns
   * the representation of this vector in the provided basis.
   *
   * @param vectorInDefaultBasis the vector, described in terms of the default
   *                             basis
   * @param basis                the basis to which the vector representation
   *                             should be changed
   * @return the representation of the vector in the provided basis, returned as
   *         an instance of the field F
   */
  F changeFrom(F vectorInDefaultBasis, O basis);
}
