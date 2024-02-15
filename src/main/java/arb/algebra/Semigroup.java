package arb.algebra;

import java.util.function.BinaryOperator;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A {@link Semigroup} is an {@link Associative} {@link Magma}
 *
 * @param <X>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Semigroup<X> extends
                          Magma<X>
{

  /**
   * Returns the associative binary operator of this {@link Semigroup}.
   * <p>
   * The returned {@link BinaryOperator} must satisfy the associativity property:
   * for all elements a, b, c in the set, (a * b) * c = a * (b * c).
   * <p>
   * 
   * <b>Implementations of this method should ensure the associativity property
   * holds for the returned binary operator.</b>
   *
   * @return The associative {@link BinaryOperator} representing the binary
   *         operation of this {@link Semigroup}.
   */
  public BinaryOperator<X> operator();

}
