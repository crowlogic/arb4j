package arb.algebraic.geometry;

import arb.curves.Curve;
import arb.curves.PlaneCurve;

/**
 * An affine algebraic curve is a plane curve which is the zero set of a
 * polynomial in two variables. A projective algebraic plane curve is the zero
 * set in a projective plane of a homogeneous polynomial in three variables. An
 * affine algebraic plane curve can be completed in a projective algebraic plane
 * curve by homogenizing its defining polynomial. Conversely, a projective
 * algebraic plane curve of homogeneous equation h(x, y, t) = 0 can be
 * restricted to the affine algebraic plane curve of equation h(x, y, 1) = 0.
 * These two operations are each inverse to the other; therefore, the phrase
 * algebraic plane curve is often used without specifying explicitly whether it
 * is the affine or the projective case that is considered.
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Algebraic_curve">Wikipedia</a>
 */
public interface AlgebraicCurve extends
                                PlaneCurve
{

}
