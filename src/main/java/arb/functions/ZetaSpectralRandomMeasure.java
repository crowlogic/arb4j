package arb.functions;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * The cumulative spectral random measure of the warped Hamburger process,
 *
 *   Φ(ν) := (1 / 2π) · ∫_{T_0}^{T_max} ζ(½ + ⅈt) · √(ϑ'(t)) · exp(-ⅈ ν ϑ(t)) dt,
 *
 * evaluated as a {@code Function<Real, Complex>}.
 *
 * <p>This is the same density that {@code zeta_spectral_gemini.py} computes
 * with {@code numpy.trapezoid}. Inside arb4j we delegate the trapezoid
 * sum to {@link KTFrequencyFunctional}, which compiles the ν-parameterized
 * integrand once per ν via the expression compiler and runs a
 * {@link NumericalComplexFunctionIntegral} cumulative-trapezoid sweep on
 * {@code [T0, Tmax]}.
 *
 * <h2>Why this is not built through {@code nint(...)}</h2>
 *
 * The expression-compiler {@code nint} keyword
 * (see {@link arb.expressions.nodes.NumericalIntegralNode}) compiles
 * cleanly when the integrand is self-contained \u2014 e.g.
 * {@code nint(t\u279Asin(t), t=0\u20261)}. When the integrand also references
 * an <em>outer</em> Context-bound variable like {@code \u03BD}, the
 * static-subexpression optimizer in the integrand sub-expression interacts
 * with the outer expression's static-subexpression optimizer and produces
 * a verifier failure (a {@code GETFIELD} whose owner is the integrand
 * sub-class rather than the outer class). Resolving that interaction is
 * a follow-up architectural change. The {@code nint} operator itself is
 * functionally correct for the common case and ships in this same
 * commit.
 *
 * <p>The path used here is the established
 * {@link KTFrequencyFunctional} \u2192 {@link NumericalComplexFunctionIntegral}
 * pipeline, identical to what {@link WarpedFourierGFunctional} uses.
 * Per-ν cost is one trapezoid pass over the t-grid, identical to the
 * Python script's per-ν cost.
 *
 * <p>The trapezoid quadrature error is
 * {@code O((T_max-T_0)^3·||f''||/N_t^2)} and is independent of the
 * per-sample {@code bits} precision, which controls only the arithmetic
 * precision at each grid sample. To match the Python defaults
 * ({@code N_t = 80,000} on {@code [6.289835988, 1000]}) the panel width
 * is {@code dt \u2248 0.0124}.
 *
 * @see KTFrequencyFunctional
 * @see NumericalComplexFunctionIntegral
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaSpectralRandomMeasure implements
                                        Function<Real, Complex>
{
  final Real    T0;
  final Real    Tmax;
  final Real    dt;
  final int     bits;

  /**
   * @param T0    left endpoint of integration. Must be &gt; 0. Standard
   *              choice is the first Riemann\u2013Siegel-theta zero
   *              {@code 6.289835988}, which the Python reference uses.
   * @param Tmax  right endpoint of integration.
   * @param Nt    trapezoid panel count on {@code [T0, Tmax]}. The panel
   *              width is computed as {@code (Tmax - T0)/Nt}.
   * @param bits  per-sample arithmetic precision used by ζ, ϑ, ϑ' and
   *              the trapezoid sum.
   */
  public ZetaSpectralRandomMeasure(Real T0, Real Tmax, int Nt, int bits)
  {
    this.T0   = T0;
    this.Tmax = Tmax;
    this.bits = bits;
    Real width = Tmax.sub(T0, bits, new Real());
    this.dt   = width.div(Nt, bits, new Real());
    width.close();
  }

  /**
   * Evaluate Φ(ν) = K_{T_max}(ν) / (2π).
   *
   * @param nu     spectral frequency.
   * @param order  ignored; the spectral measure is treated as a primitive.
   * @param bits   arithmetic precision for the per-ν reduction
   *               {@code K_{T_max} / (2π)}. The integrand grid itself
   *               uses the {@code bits} captured at construction time.
   * @param result output Complex; written and returned.
   */
  @Override
  public Complex evaluate(Real nu, int order, int bits, Complex result)
  {
    KTFrequencyFunctional K       = new KTFrequencyFunctional(T0, dt, this.bits);
    RealToComplexFunction K_T_nu  = K.evaluate(nu, order, this.bits, null);
    try (Complex KT = new Complex())
    {
      // K_T(ν) at T = Tmax \u2014 the cumulative trapezoid evaluated at the
      // upper limit of integration.
      K_T_nu.evaluate(Tmax, order, bits, KT);

      // Result := K_T(ν) / (2π)
      try (Real twoPi = RealConstants.\u03C0.mul(2, bits, new Real()))
      {
        return KT.div(twoPi, bits, result);
      }
    }
    finally
    {
      K_T_nu.close();
      K.close();
    }
  }

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public String getName()
  {
    return "\u03A6";
  }

  @Override
  public void close()
  {
    if (dt != null)
    {
      dt.close();
    }
  }
}
