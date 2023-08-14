package arb.algebra;

import java.util.function.BinaryOperator;

import arb.Set;
import arb.annotations.Associative;
import arb.annotations.Distributive;
import arb.groups.CommutativeGroup;

/**
 * A ring is a set R equipped with two {@link BinaryOperator}s[a] + (addition)
 * and ⋅ (multiplication) satisfying the following three sets of axioms, called
 * the ring axioms[1][2][3]
 * 
 * A ring R is a {@link CommutativeGroup} under addition, meaning that: (a + b)
 * + c = a + (b + c) for all a, b, c in R (that is, + is {@link Associative}). a
 * + b = b + a for all a, b in R (that is, + is commutative).
 * 
 * There is an element 0 in R such that a + 0 = a for all a in R (that is, 0 is
 * the additive identity).
 * 
 * For each a in R there exists −a in R such that a + (−a) = 0 (that is, −a is
 * the additive inverse of a). R is a monoid under multiplication, meaning that:
 * (a ⋅ b) ⋅ c = a ⋅ (b ⋅ c) for all a, b, c in R (that is, ⋅ is associative).
 * 
 * There is an element 1 in R such that a ⋅ 1 = a and 1 ⋅ a = a for all a in R
 * (that is, 1 is the multiplicative identity).
 * 
 * Multiplication is {@link Distributive} with respect to addition, meaning
 * that: a ⋅ (b + c) = (a ⋅ b) + (a ⋅ c) for all a, b, c in R (left
 * distributivity). (b + c) ⋅ a = (b ⋅ a) + (c ⋅ a) for all a, b, c in R (right
 * distributivity).
 * 
 * @param <X> the set over which this {@link Ring} is defined
 * @param <A> the addition operator
 * @param <M> the multiplication operator
 */
public interface Ring<X extends Set, A extends BinaryOperator<X>, M extends BinaryOperator<X>> extends
                     Set<X>
{

}
