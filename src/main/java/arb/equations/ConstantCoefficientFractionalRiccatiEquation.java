package arb.equations;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.RiemannLiouvilleFractionalIntegralNode;
import arb.functions.complex.MuntzPadeFunction;
import arb.functions.complex.RiccatiMittagLefflerFunction;

/**
 * Constant-coefficient (in time) fractional Riccati equation
 *
 * <pre>
 *   Đᵅ y(t) = p(v) + q(v)·y(t) + r(v)·y(t)²,    y(0)=0,    α = μ ∈ (0,1)
 * </pre>
 *
 * <p>
 * Equivalent Volterra integral form (apply I^μ to both sides; with y(0)=0 the
 * left-inverse identity I^μ Đ^μ y = y holds):
 *
 * <pre>
 *   y(t) = I^μ[ p(v) + q(v)·y(t) + r(v)·y(t)² ](t)
 * </pre>
 *
 * where I^μ is the Riemann–Liouville fractional integral with lower limit 0,
 * implemented as a first-class symbolic operator by
 * {@link RiemannLiouvilleFractionalIntegralNode} (parser keyword
 * {@code fracint(f, t^μ)}).
 * </p>
 *
 * <h2>Superseded by {@link RiccatiMittagLefflerFunction}</h2>
 *
 * <p>
 * This class is retained as a stable Javadoc anchor for an archived paper that
 * cites it by name. The implementation has been superseded by
 * {@link RiccatiMittagLefflerFunction}, which is the unique analytic solution
 * Y_α(p, q, r; t) of the same equation expressed as a {@link MuntzPadeFunction}.
 * The two-stage construction (Müntz–Tau local stage, diagonal Padé global
 * stage) lives there, with the Hankel solve, order-selection from precision,
 * a-posteriori error bound, and Jacobian-in-v all in the parent
 * {@link MuntzPadeFunction} because none of those steps are specific to
 * Riccati.
 * </p>
 *
 * <p>
 * The Müntz recurrence is the closed-form action of I^μ on the Puiseux ansatz
 * {@code y(t) = Σ a_k(v) t^(kμ)}: each
 * {@code I^μ[t^(kμ)] = Γ(kμ+1)/Γ((k+1)μ+1)·t^((k+1)μ)} is the monomial rule
 * applied by {@code ExponentiationNode.fractionalIntegral}; the convolution
 * sum encodes I^μ acting on {@code r(v)·y(t)²}; the linear term encodes I^μ
 * acting on {@code q(v)·y(t)}; the seed
 * {@code a_1(v) = p(v)/Γ(μ+1)} is exactly
 * {@code I^μ[p(v)] = p(v)·t^μ/Γ(μ+1)} read off at the leading Puiseux index.
 * </p>
 *
 * @see RiccatiMittagLefflerFunction the successor implementation
 * @see RiemannLiouvilleFractionalIntegralNode the I^μ operator
 * @see MuntzPadeFunction the resummation parent
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@Deprecated
public final class ConstantCoefficientFractionalRiccatiEquation
{
  private ConstantCoefficientFractionalRiccatiEquation()
  {
    throw new UnsupportedOperationException("ConstantCoefficientFractionalRiccatiEquation has been superseded by "
                                             + RiccatiMittagLefflerFunction.class.getName()
                                             + ". This stub is retained only as a Javadoc anchor for archived references.");
  }
}
