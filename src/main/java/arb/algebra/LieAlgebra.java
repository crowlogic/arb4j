package arb.algebra;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.groups.LieGroup;
import arb.space.topological.VectorSpace;

/**
 * A Lie algebra is a {@link VectorSpace} 𝔤 over some {@link Field} F together
 * with a Lie bracket operation:
 *
 * <pre>
 *          [ ⋅ , ⋅ ] : 𝔤 × 𝔤 → 𝔤
 * </pre>
 *
 * The Lie bracket must satisfy bilinearity, alternativity, and the Jacobi
 * identity. Bilinearity and alternativity together imply anticommutativity,
 * provided that the field's characteristic is not 2.
 *
 * Lie algebras are typically denoted by a lower-case fraktur letter. If
 * associated with a {@link LieGroup}, the algebra is denoted by the fraktur
 * version of the group.
 *
 * @param <F> the type of the field elements in the Lie algebra
 * @param <B> the type of the {@link LieBracket} operation
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface LieAlgebra<F extends Field<F>, B extends LieBracket<F>> extends
                           VectorSpace<F>
{

  /**
   * Returns the Lie bracket of this Lie algebra.
   *
   * @return The {@link LieBracket} representing the Lie bracket operation of this
   *         Lie algebra.
   */
  B getLieBracket();
}
