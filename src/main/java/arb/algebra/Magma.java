package arb.algebra;

import java.util.function.BinaryOperator;

import arb.Set;

/**
 * A {@link Magma} is a mathematical structure consisting of a set M and a
 * binary operation (•) that maps any two elements a, b ∈ M to another element a
 * • b ∈ M.
 * <p>
 * To qualify as a magma, the set and operation (M, •) must satisfy the closure
 * property (also known as the magma axiom):
 * </p>
 * <p>
 * For all a, b in M, the result of the operation a • b is also in M.
 * </p>
 * <p>
 * In mathematical notation:
 * </p>
 * <p>
 * a, b ∈ M ⟹ a • b ∈ M
 * </p>
 * <p>
 * The {@code Magma} interface extends the {@link Set} interface and provides a
 * method to obtain the binary operator representing the magma operation.
 *
 * @param <X> the type of elements in the magma set
 */
public interface Magma<X> extends
                      Set<X>
{
  /**
   * Returns the binary operator of this Magma.
   * <p>
   * The returned {@link BinaryOperator} must satisfy the closure property: for
   * all elements a, b in M, the result of the operation a • b is also in M.
   * </p>
   * <p>
   * Implementations of this method should ensure the closure property holds for
   * the returned binary operator.
   *
   * @return The {@link BinaryOperator} representing the binary operation of this
   *         Magma.
   */
  public BinaryOperator<X> operator();
}
