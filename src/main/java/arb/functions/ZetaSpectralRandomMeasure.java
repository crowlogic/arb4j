package arb.functions;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * The cumulative spectral random measure of the warped Hamburger process,
 *
 * Φ(ν) := (1 / 2π) · ∫_{T_0}^{T_max} ζ(½ + ⅈt) · √(ϑ'(t)) · exp(-ⅈ ν ϑ(t)) dt,
 *
 * evaluated as a {@code Function<Real, Complex>} and computed by the expression
 * compiler's {@code nint} operator. This is the same density that
 * {@code zeta_spectral_gemini.py} computes with {@code numpy.trapezoid}.
 *
 * <p>
 * The compiled expression is, verbatim,
 * 
 * <pre>
 *   ν ➔ nint(t ➔ ζ(½+ⅈ*t) * √(diff(ϑ(t),t)) * exp(-ⅈ*ν*ϑ(t)),
 *            t = T0 … Tmax,
 *            dt = (Tmax-T0)/Nt) / (2π)
 * </pre>
 * 
 * The outer free variable {@code ν} is the input parameter to {@code evaluate};
 * the integrand closes over it. At every {@code evaluate(ν, …)} the
 * cumulative-trapezoid grid is rebuilt for the current ν via
 * {@link NumericalComplexFunctionIntegral#init} \u2014 see
 * {@link arb.expressions.nodes.NumericalIntegralNode} for the bytecode that
 * wires the outer-scope {@code ν} into the integrand instance before the grid
 * is sampled.
 *
 * <p>
 * The trapezoid quadrature error is {@code O((T_max-T_0)^3·||f''||/N_t^2)} and
 * is independent of the per-sample {@code bits} precision, which controls only
 * the arithmetic precision at each grid sample. To match the Python defaults
 * ({@code N_t = 80,000} on {@code [6.289835988, 1000]}) the panel width is
 * {@code dt ≈ 0.0124}.
 *
 * @see arb.expressions.nodes.NumericalIntegralNode
 * @see NumericalComplexFunctionIntegral
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaSpectralRandomMeasure implements
                                       RealToComplexFunction
{
  /**
   * The integrand and full enclosing nint(...) expression. {@code N_t} and the
   * integration limits are baked into the source string at construction time
   * \u2014 they are constants of the model run, and folding them into the
   * expression lets the expression compiler emit a single self-contained
   * {@code Function<Real, Complex>} class.
   */
  static final String         EXPRESSION = "ν➔nint(t➔ζ(½+ⅈ*t)*√(diff(ϑ(t),t))*exp(-ⅈ*ν*ϑ(t)), t=%s…%s, dt=%s)/(2*π)";

  final RealToComplexFunction phi;
  final int                   bits;

  /**
   * @param T0   left endpoint of integration. Must be &gt; 0. Standard choice is
   *             the first Riemann\u2013Siegel-theta zero {@code 6.289835988},
   *             which the Python reference uses.
   * @param Tmax right endpoint of integration.
   * @param Nt   trapezoid panel count on {@code [T0, Tmax]}. The panel width is
   *             computed as {@code (Tmax - T0)/Nt}.
   * @param bits per-sample arithmetic precision used by ζ, ϑ, ϑ' and the
   *             trapezoid sum.
   */
  public ZetaSpectralRandomMeasure(Real T0, Real Tmax, int Nt, int bits)
  {
    this.bits = bits;
    double t0d  = T0.getMid().doubleValue();
    double tmd  = Tmax.getMid().doubleValue();
    double dtd  = (tmd - t0d) / Nt;
    String expr = String.format(java.util.Locale.ROOT, EXPRESSION, Double.toString(t0d), Double.toString(tmd), Double.toString(dtd));
    this.phi = RealToComplexFunction.express(expr);
  }

  /**
   * Evaluate Φ(ν).
   *
   * @param nu     spectral frequency.
   * @param order  ignored; the spectral measure is treated as a primitive.
   * @param bits   arithmetic precision for the per-ν reduction.
   * @param result output Complex; written and returned.
   */
  @Override
  public Complex evaluate(Real nu, int order, int bits, Complex result)
  {
    return phi.evaluate(nu, order, bits, result);
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
    return "Φ";
  }

  @Override
  public void close()
  {
    if (phi instanceof AutoCloseable closeable)
    {
      try
      {
        closeable.close();
      }
      catch (Exception e)
      {
        throw new RuntimeException(e);
      }
    }
  }
}
