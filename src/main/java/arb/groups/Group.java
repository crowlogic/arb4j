package arb.groups;

import arb.Set;

/**
 * An interface for a mathematical group. A group is a set equipped with an
 * operation that combines any two of its elements to form a third element in
 * such a way that four conditions called group axioms are satisfied.
 *
 * @param <X> the type of elements in this group
 */
public interface Group<X> extends Set<X>
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
