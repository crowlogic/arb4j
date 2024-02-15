package arb.algebra;

import java.util.function.BiFunction;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A {@link LieBracket} represents the Lie bracket operation associated with a
 * {@link LieAlgebra}. It is a binary operation that assigns to any two elements
 * in the Lie algebra a third element.
 * <p>
 * The Lie bracket operation has specific properties that must be satisfied:
 * <ul>
 * <li><b>Bilinearity</b></li>
 * <li><b>Alternativity</b></li>
 * <li><b>Jacobi identity</b></li>
 * </ul>
 * <p>
 * Implementations of this interface should ensure these properties hold for the
 * Lie bracket operation.
 *
 * @param <F> the type of the elements in the associated Lie algebra
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface LieBracket<F extends Field<F>> extends
                           BiFunction<F, F, F>
{
}
