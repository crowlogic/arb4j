package arb.groups;

import java.util.function.BiFunction;

import arb.algebra.Magma;

/**
 * A {@link Group} is an associative invertible {@link Magma} that has an identity element.
 * 
 * @param <X> the type of elements in this group
 * 
 * @author ©2023 Stephen Crowley All rights reserved. 
 */
public interface Group<X> extends
                      Magma<X>,
                      BiFunction<X, X, X>
{

  /**
   * Returns the identity element of this group.
   *
   * @return the identity element
   */
  X identity();

  /**
   * Applies the group operation to the two elements.
   *
   * @param x the first element
   * @param y the second element
   * @return the result of the operation
   */
  @Override
  X apply(X x, X y);

  /**
   * Returns the inverse of the given element.
   *
   * @param x the element to find the inverse of
   * @return the inverse of the given element
   */
  X inverse(X x);

  /**
   * Checks if the given element is in the group.
   *
   * @param x the element to check
   * @return true if the element is in the group, false otherwise
   */
  boolean contains(X x);
}
