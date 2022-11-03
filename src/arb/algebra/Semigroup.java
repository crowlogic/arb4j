package arb.algebra;

import java.util.function.BinaryOperator;

import arb.Associative;

/**
 * A {@link Semigroup} is an {@link Associative} {@link Magma}
 *
 * @param <X>
 */
public interface Semigroup<X> extends
                          Magma<X>
{
  @Associative
  public BinaryOperator<X> operate();

}
