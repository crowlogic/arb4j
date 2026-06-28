package arb.stochastic.processes.heston;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.RiccatiMuntzPadeFunctional;

/**
 * Rough Heston fractional Riccati equation
 *
 * <pre>
 *   Đ^μ y(t) = p(v) + q(v)·y(t) + r(v)·y(t)²,    y(0) = 0
 * </pre>
 *
 * with constant-in-t coefficients
 *
 * <pre>
 *   p(v) = ½(−v² − ⅈv)
 *   q(v) = λ(ⅈ·v·ρ·ν − 1)
 *   r(v) = ½(λν)²
 * </pre>
 *
 * <p>
 * The Fourier parameter is named <code>v</code> in the parent class
 * {@link ConstantCoefficientFractionalRiccatiEquation} (the new constant-
 * coefficient base type, which replaced the prior abstract
 * <code>FractionalRiccatiEquation</code>). The Müntz coefficient symbol
 * <code>a</code> is reserved by the parent for the Müntz sequence
 * <code>a_k(v)</code>, so the Fourier argument cannot also be called
 * <code>a</code>.
 *
 * <p>
 * Note: a single-argument convenience constructor <code>(Real α)</code> cannot
 * be offered, because the coefficient expressions reference the model
 * parameters λ, ρ, ν which must be present in the Context. The caller is
 * therefore required to assemble a Context that registers those three variables
 * and pass it explicitly.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonRiccatiMuntzPadeFunctional extends
                                                  RiccatiMuntzPadeFunctional
{
  /**
   * @param context Context with the rough-Heston model parameters λ, ρ, ν already
   *                registered as variables, so the expression compiler can
   *                resolve them inside p, q, r. The Fourier parameter v and the
   *                fractional order μ are registered by the parent class
   *                {@link ConstantCoefficientFractionalRiccatiEquation} during
   *                construction.
   * @param α       fractional order μ ∈ (0, 1) — registered into the parent's
   *                Context as the variable named μ
   */
  public RoughHestonRiccatiMuntzPadeFunctional(Context context, Real α)
  {
    super(context,
          α,
          "v->½⋅(-v²-ⅈ⋅v)",
          "v->λ⋅(ⅈ⋅v⋅ρ⋅ν-1)",
          "v->½⋅(λ⋅ν)²");
  }
}
