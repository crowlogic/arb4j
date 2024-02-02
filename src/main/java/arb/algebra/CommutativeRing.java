package arb.algebra;

/**
 * A commutative ring is a ring R that satisfies the additional axiom that
 * 
 * <pre>
 * 
 * ab = ba ∀a,b∈ℝ
 * 
 * </pre>
 * 
 * TODO: use this whilst implementing
 * https://github.com/crowlogic/arb4j/issues/287 - expression compiler:
 * implement reorderable operands based on their commutativity(permutability) to
 * facilitate memoization and automatic complexity reduction #287
 * 
 * @param <X>
 */
public interface CommutativeRing<X> extends
                                Ring<X>
{

}
