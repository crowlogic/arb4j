package arb.space.topological;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A normed vector space or normed space is a {@link VectorSpace} over the {@link Real} or
 * {@link Complex} numbers, on which a norm is defined. A norm is the generalization to
 * real vector spaces of the intuitive notion of "length" in Euclidean space.
 * 
 * An inner product space is a normed vector space whose norm is the square root of the
 * inner product of a vector and itself.
 * 
 * @param <X> Type of field that the space is over. Common examples are real or complex
 *            numbers.
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public interface NormedVectorSpace<F extends Field<? extends F>, V extends VectorSpace<? extends F>>
                                  extends
                                  VectorSpace<F>
{
  /**
   * Returns the norm of a vector in this space.
   *
   * @param vector The vector whose norm is to be computed.
   * @return The norm of the vector.
   */
  Real norm(int bits, Real result);
}
