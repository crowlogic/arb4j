package arb.algebra;

import java.util.function.BinaryOperator;

import arb.annotations.Associative;

/**
 * A {@link Semigroup} is an {@link Associative} {@link Magma}
 *
 * @param <X>
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
  @Associative
  public BinaryOperator<X> operator();

}
