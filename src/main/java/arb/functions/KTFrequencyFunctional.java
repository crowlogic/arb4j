package arb.functions;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * The functional
 *
 * K : ℝ → (ℝ → ℂ), K(ν) = ( T ↦ K_T(ν) )
 *
 * where
 *
 * K_T(ν) = ∫_{T_0}^{T} ζ(½ + ⅈt) · √(ϑ'(t)) · exp(-ⅈνϑ(t)) dt.
 *
 * {@link #evaluate(Real, int, int, RealToComplexFunction)} takes a frequency ν
 * and returns a {@link RealToComplexFunction} whose value at an upper limit T
 * is K_T(ν). The returned function is a {@link NumericalComplexFunctionIntegral}
 * specialized to that ν: it extends its internal sample grid rightward from T_0
 * on demand and reuses every previously computed trapezoid bin, so repeated
 * calls at increasing T do only the tail work [T_prev, T_new]. The caller owns
 * the returned integrator and must close it.
 *
 * The res argument of {@link #evaluate} is ignored because
 * {@link RealToComplexFunction} is an interface and the result is a fresh
 * integrator.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class KTFrequencyFunctional implements
                                    Function<Real, RealToComplexFunction>
{
  public static final String INTEGRAND = "ζ(½+ⅈ*t)*√(diff(ϑ(t),t))*exp(-ⅈ*ν*ϑ(t))";

  final Real                 T0;
  final Real                 dt;
  final int                  bits;

  public KTFrequencyFunctional(Real T0, Real dt, int bits)
  {
    this.T0   = T0;
    this.dt   = dt;
    this.bits = bits;
  }

  @Override
  public RealToComplexFunction evaluate(Real nu, int order, int bits, RealToComplexFunction res)
  {
    Context               context   = new Context(Real.named("ν").set(nu));
    RealToComplexFunction integrand = RealToComplexFunction.express(INTEGRAND, context);
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
    return "K";
  }

  @Override
  public void close()
  {
    T0.close();
    dt.close();
  }
}
