package arb.functions;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * The tapered warped Fourier integral
 *
 * G(ν) = ∫_{-∞}^{∞} ζ(½ + ⅈt) · √(Θ'(t)) · (1 + Θ(t)²)^(-α)
 *                    · exp(-ⅈ(ν-1)Θ(t)) dt
 *
 * where Θ(t) := ϑ(t) + C·t is the additively-tilted Riemann–Siegel theta
 * function (strictly increasing for C > -inf_t ϑ'(t)), α := 1/12 + ε/2 is the
 * taper exponent (with ε > 0 a fixed positive slack), and ϑ is the standard
 * Riemann–Siegel theta function.
 *
 * The integrand satisfies h(-t) = conj h(t) (because ϑ is odd, so Θ is odd and
 * Θ' is even, and ζ(½-ⅈt) = conj ζ(½+ⅈt)), hence
 *
 *   G(ν) = 2·Re ∫_{0}^{∞} h(t) dt.
 *
 * So G(ν) at a fixed truncation T is assembled from a one-sided integral
 *
 *   K_T(ν) = ∫_{0}^{T} ζ(½+ⅈt)·√(Θ'(t))·(1+Θ(t)²)^(-α)·exp(-ⅈ(ν-1)Θ(t)) dt
 *
 * via G_T(ν) = 2·Re K_T(ν). Convergence of G as T → ∞ is Theorem 1 of the
 * manuscript: the envelope ⪅ |t|^{-ε}(log|t|)^β supplies absolute convergence
 * for the amplitude and van-der-Corput first-derivative estimates supply
 * (conditional) convergence in the oscillatory factor for every ν ≠ 1.
 *
 * {@link #evaluate(Real, int, int, RealToComplexFunction)} takes a frequency ν
 * and returns a {@link RealToComplexFunction} whose value at an upper limit T
 * is K_T(ν). Construct G_T(ν) by doubling the real part. The returned
 * integrator extends its internal trapezoid grid rightward from T_0=0 on
 * demand; repeated calls at increasing T only pay the tail cost
 * [T_prev, T_new]. The caller owns the returned integrator and must close it.
 *
 * The constants C (theta-tilt) and α (taper exponent) are baked into the
 * integrand expression at construction time; ν is bound by {@link Context}
 * and evaluated symbolically.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class WarpedFourierGFunctional implements
                                       Function<Real, RealToComplexFunction>
{
  /**
   * Half-line integrand h(t) of Theorem 1, with ν in the Context and with C, α
   * interpolated as literals:
   *
   * ζ(½ + ⅈt) · √(ϑ'(t) + C) · (1 + (ϑ(t) + C·t)²)^(-α) · exp(-ⅈ(ν-1)(ϑ(t) + C·t))
   */
  public static final String INTEGRAND_TEMPLATE =
      "ζ(½+ⅈ*t)"
          + "*√(diff(ϑ(t),t)+(%s))"
          + "*(1+(ϑ(t)+(%s)*t)^2)^(-(%s))"
          + "*exp(-ⅈ*(ν-1)*(ϑ(t)+(%s)*t))";

  final double tiltC;
  final double alpha;
  final Real   T0;
  final Real   dt;
  final int    bits;

  /**
   * Build a functional for G(ν) at fixed theta-tilt C and taper α.
   *
   * @param tiltC C > -inf_t ϑ'(t); e.g. C = 1 is ample since ϑ'(t) ≥ 0 for
   *              t ≥ some threshold and ϑ'(0) is bounded.
   * @param alpha α = 1/12 + ε/2 with ε > 0. For ε = 0.1 take α = 7/60.
   * @param T0    left endpoint of the one-sided integral. Standard convention
   *              in this codebase is a small positive value (e.g. 10) to avoid
   *              the small-t branch of the standard ϑ expansion.
   * @param dt    trapezoid step size. Smaller = more accurate, more work.
   * @param bits  Arb precision.
   */
  public WarpedFourierGFunctional(double tiltC, double alpha, Real T0, Real dt, int bits)
  {
    this.tiltC = tiltC;
    this.alpha = alpha;
    this.T0    = T0;
    this.dt    = dt;
    this.bits  = bits;
  }

  /**
   * The integrand expression with the instance's C and α interpolated in.
   */
  public String integrand()
  {
    String c = Double.toString(tiltC);
    String a = Double.toString(alpha);
    return String.format(INTEGRAND_TEMPLATE, c, c, a, c);
  }

  @Override
  public RealToComplexFunction evaluate(Real nu, int order, int bits, RealToComplexFunction res)
  {
    Context               context   = new Context(Real.named("ν").set(nu));
    RealToComplexFunction integrand = RealToComplexFunction.express(integrand(), context);
    return new NumericalComplexFunctionIntegral(integrand,
                                                T0.getMid().doubleValue(),
                                                dt.getMid().doubleValue(),
                                                bits);
  }

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<RealToComplexFunction> coDomainType()
  {
    return RealToComplexFunction.class;
  }

  @Override
  public String getName()
  {
    return "G";
  }

  @Override
  public void close()
  {
    // T0 and dt are borrowed from the caller; they are not disposed here.
  }
}
