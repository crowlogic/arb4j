package arb.algebra;

import arb.groups.CommutativeGroup;

/**
 * <pre>
 * A ring is a set R equipped with two operations: addition (+) and 
 * multiplication (⋅) satisfying the ring axioms. Essentially, a ring is a union
 * of two magmas for these operations. In this Java class structure, the {@link Ring}
 * extends {@link Magma}, inheriting the multiplication methods from the {@link Magma} class, and
 * then declaring methods for addition and subtraction in this {@link Ring} class
 *
 * A ring R is a commutative group under addition, meaning that:
 * - (a + b) + c = a + (b + c) for all a, b, c in R (associativity of addition).
 * - a + b = b + a for all a, b in R (commutativity of addition).
 * - There exists an element 0 in R such that a + 0 = a for all a in R (0 is the additive identity).
 * - For each element a in R, there exists an element −a in R such that a + (−a) = 0 (existence of additive inverses).
 *
 * Under multiplication, R is a monoid, meaning that:
 * - (a ⋅ b) ⋅ c = a ⋅ (b ⋅ c) for all a, b, c in R (associativity of multiplication).
 * - There exists an element 1 in R such that a ⋅ 1 = a and 1 ⋅ a = a for all a in R (1 is the multiplicative identity).
 *
 * Multiplication is distributive with respect to addition:
 * - a ⋅ (b + c) = (a ⋅ b) + (a ⋅ c) for all a, b, c in R (left distributivity).
 * - (b + c) ⋅ a = (b ⋅ a) + (c ⋅ a) for all a, b, c in R (right distributivity).
 * </pre>
 *
 * @param <X> the set over which this {@link Ring} is defined.
 */
public interface Ring<X> extends
                     Magma<X>
{

  X add(X addend, int bits, X result);

  X sub(X subtrahend, int bits, X result );
}
