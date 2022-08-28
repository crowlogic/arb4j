package arb.topological.spaces;

import arb.Complex;
import arb.Field;
import arb.Metric;
import arb.Real;

/**
 * a normed vector space or normed space is a {@link VectorSpace} over the
 * {@link Real} or {@link Complex} numbers, on which a norm is defined. A norm
 * is the formalization and the generalization to real vector spaces of the
 * intuitive notion of "length" . A norm is a real-valued function defined on
 * the vector space that is commonly denoted x ↦ ‖ x ‖ , and has the following
 * properties:
 * 
 * It is nonnegative, meaning that ‖ x ‖ ≥ 0 for every vector x . It is positive
 * on nonzero vectors, that is, ‖ x ‖ = 0 implies x = 0. For every vector x , x,
 * and every scalar α , ‖ α x ‖ = | α | ‖ x ‖ . The triangle inequality holds;
 * that is, for every vectors ‖ x + y ‖ ≤ ‖ x ‖ + ‖ y ‖ ∀x,y∈{@link Real} or
 * {@link Complex}.
 * 
 * A norm induces a distance, called its (norm) induced metric, by the formula d
 * ( x , y ) = ‖ y − x ‖ . which makes any normed vector space into a metric
 * space and a topological vector space. If this metric d is complete then the
 * normed space is a Banach space. Every normed vector space can be "uniquely
 * extended" to a Banach space, which makes normed spaces intimately related to
 * Banach spaces. Every Banach space is a normed space but converse is not true.
 * For example, the set of the finite sequences of real numbers can be normed
 * with the Euclidean norm, but it is not complete for this norm.
 * 
 * An inner product space is a normed vector space whose norm is the square root
 * of the inner product of a vector and itself. The Euclidean norm of a
 * Euclidean vector space is a special case that allows defining Euclidean
 * distance by the formula d ( A , B ) = ‖ A B → ‖ .
 * 
 * The study of normed spaces and Banach spaces is a fundamental part of
 * functional analysis, which is a major subfield of mathematics.
 * 
 *
 * @param <X>
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Normed_vector_space">NormedVectorSpace@Wikipedia</a>
 */
public interface NormedVectorSpace<X extends Field> extends
                                  VectorSpace<X>,
                                  MetricSpace<X>
{


}
