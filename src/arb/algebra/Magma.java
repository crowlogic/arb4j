package arb.algebra;

import java.util.function.BinaryOperator;

import arb.Set;

/**
 * A magma is a set M matched with an operation • that sends any two elements a,
 * b ∈ M to another element, a • b ∈ M. The symbol • is a general placeholder
 * for a properly defined operation.
 * 
 * To qualify as a magma, the set and operation (M, •) must satisfy the
 * following requirement (known as the magma or closure axiom):
 * 
 * For all a, b in M, the result of the operation a • b is also in M.
 * 
 * And in mathematical notation:
 * 
 * a,b∈M⟹a⋅b∈M
 * 
 *
 */
public interface Magma<X> extends
                      Set<X>
{
  public BinaryOperator<X> operate();
}
