package arb.space.topological;

import arb.Field;
import arb.OrthogonalBasis;

/**
 * A Hilbert space is a special kind of {@link VectorSpace} equipped with an
 * inner product, which allows the definition of geometrical concepts such as
 * angles and lengths. It is also a complete space, which means that Cauchy
 * sequences of vectors in the space converge to a limit within the space.
 * Hilbert spaces are key objects in functional analysis and quantum mechanics.
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
public interface HilbertSpace<F extends Field<? extends F>,
              O extends OrthogonalBasis<? extends F, ?>> extends
                             BanachSpace<F>,
                             InnerProductSpace<F>
{
  /**
   * Returns an orthonormal basis for this space.
   *
   * @return an OrthonormalBasis instance representing an orthonormal basis for
   *         this Hilbert space
   */
  O basis();

  /**
   * Apply the appropriate similarity transform so that a vector expressed in
   * terms of a given basis is transformed into a vector expressed in terms of
   * this{@link #basis()}
   * 
   * TODO: there should be a default implementation of this, and, should the
   * argument be a {@link HilbertSpace} (which by the class design contains the
   * this{@link #basis()} function to get the {@link OrthogonalBasis} associated
   * to the {@link HilbertSpace} or should {@link HilbertSpace} also implement the
   * {@link OrthogonalBasis} interface rather than having a method returning the
   * associated basis...?
   * 
   * @param vectorInAnotherBasis
   * @param anotherBasis
   * @return a vector transformed such that it is expressed in
   *         this{@link #basis()}
   */
  F project(F vectorInAnotherBasis, O anotherBasis);

}
