package arb.functions.polynomials;

import arb.Fraction;
import arb.Initializable;
import arb.Real;
import arb.RealConstants;
import arb.applications.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.domains.ExtendedRealLine;
import arb.functions.polynomials.orthogonal.real.RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence;
import arb.functions.real.RealBesselFunctionOfTheFirstKind;
import arb.functions.real.RealFunction;

/**
 * The modified Lommel polynomials R_{v,n}(z) of order v are the expansion of
 * the reciprocal 1/z. The "Lommel Polynomials" are technically not polynomials
 * but actually {@link Fraction} functions
 * 
 * <pre>
 * R_{v,n}(z) = pochhammer(v,m)*2^m*(1/z)^(-m)*hypergeom([-1/2*m, 1/2-1/2*m],[v, -m, 1-v-m],-1/z^2)
 * </pre>
 * 
 * @see Bibliography#besselFunctionTreatise A Treatise on the Theory of Bessel
 *      Functions p.294
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ModifiedLommelPolynomials extends
                                       RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence implements
                                       Initializable
{

  @Override
  public void initialize()
  {
    super.initialize();
    p1.set("2*v*x", context);
  }

  public Real v = Real.named("v").set(RealConstants.half);

  public ModifiedLommelPolynomials(int bits)
  {
    super(bits,
          "n➔2*(n+v)",
          "0",
          "1");
    context.registerVariable(v);
  }

  public ModifiedLommelPolynomials()
  {
    this(128);
  }

  @Override
  public Domain<Real> domainOfOrthogonality()
  {
    return ExtendedRealLine.instance;
  }

  /**
   * <pre>
   * The discrete orthogonality measure for the Lommel polynomials Rₙ,ᵥ(z) is
   * related to the zeros of the Bessel function Jᵥ(z). Let zᵥ,ₖ denote the
   * kᵗʰ positive zero of the {@link RealBesselFunctionOfTheFirstKind} Jᵥ(z), arranged in ascending order.
   * 
   * The Lommel polynomials satisfy the following discrete orthogonality relation:
   * 
   * ∑ₖ=₁^∞ (Rₘ,ᵥ(1/zᵥ,ₖ) Rₙ,ᵥ(1/zᵥ,ₖ) / (zᵥ,ₖ² [Jᵥ₊₁(zᵥ,ₖ)]²)) = δₘ,ₙ / (2(n+ᵥ))
   * 
   * where δₘ,ₙ is the Kronecker delta, defined as:
   * 
   * δₘ,ₙ = 1 if m = n
   * δₘ,ₙ = 0 if m ≠ n
   * 
   * In other words, the Lommel polynomials are orthogonal with respect to the
   * discrete measure defined by the reciprocals of the squares of the zeros of
   * the Bessel function Jᵥ(z), weighted by the square of the Bessel function
   * Jᵥ₊₁(z) evaluated at those zeros.
   * 
   * This discrete orthogonality relation is a consequence of the fact that the
   * Lommel polynomials appear in the series expansion of the ratio of two Bessel
   * functions, as mentioned earlier:
   * 
   * Jᵥ₋₁(z) / Jᵥ(z) = (1/z) ∑ₙ=₀^∞ (-1)ⁿ Rₙ,ᵥ(1/z)
   * 
   * The modified Lommel polynomials hₙ⁽ᵥ⁾(z), on the other hand, are
   * orthogonal with respect to a continuous measure on the real line, but the
   * specific form of this measure is more complex and less well-known compared to
   * the discrete orthogonality measure for the Lommel polynomials.
   * 
   * ∑ₖ=₁^∞ (Rₘ,ᵥ(1/zᵥ,ₖ) Rₙ,ᵥ(1/zᵥ,ₖ) / (zᵥ,ₖ² [Jᵥ₊₁(zᵥ,ₖ)]²)) = δₘ,ₙ / (2(n+ᵥ))
   * </pre>
   */
  @Override
  public RealFunction orthogonalityMeasure()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
