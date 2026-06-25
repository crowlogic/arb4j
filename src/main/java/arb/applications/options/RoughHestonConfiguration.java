package arb.applications.options;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.utensils.Utensils;

/**
 * An element of the configuration space of the rough-Heston model. Holds the
 * seven scalar parameters of the model as the parameter vector that a
 * maximum-likelihood estimator (or any larger model API) inspects and
 * mutates programmatically:
 *
 * <pre>
 *   λ   mean-reversion speed of the variance
 *   θ   long-run variance level
 *   ν   vol-of-vol
 *   V0  initial variance V(0)
 *   ρ   correlation
 *   μ   fractional order μ = H + ½ ∈ (½, 1)
 *   T   maturity T &gt; 0
 * </pre>
 *
 * The Context that backs every compiled expression in the model lives here
 * too: the configuration <em>is</em> the parameter vector and the Context
 * <em>is</em> the named-variable view of that same parameter vector. The
 * single instance is the direct surface.
 *
 * <p>The fields are live {@link Real} references; mutating them in place
 * propagates through every consumer that holds the same reference — the
 * compiled φ expression, the Riccati Müntz–Padé functional, the
 * orthogonal-polynomial sequence. No copies, no setters — the references
 * are the API.</p>
 *
 * <p>The series order is <em>not</em> a configuration attribute: every
 * evaluation chooses its own order by an inner convergence loop, and that
 * integer has no lifetime outside one {@code evaluate} call. It lives on
 * the function environment, not on this configuration.</p>
 *
 * @author ©2026 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RoughHestonConfiguration implements
                                            AutoCloseable
{
  private static final String DEFAULT_λ    = "0.3";
  private static final String DEFAULT_θ    = "0.02";
  private static final String DEFAULT_ν    = "0.3";
  private static final String DEFAULT_V0   = "0.02";
  private static final String DEFAULT_ρ    = "-0.7";
  private static final String DEFAULT_μ    = "0.6";
  private static final String DEFAULT_T    = "1.0";
  private static final int    DEFAULT_PREC = 128;

  /** Mean-reversion speed of the variance. */
  public final Real    λ;
  /** Long-run variance level. */
  public final Real    θ;
  /** Vol-of-vol. */
  public final Real    ν;
  /** Initial variance V(0). */
  public final Real    V0;
  /** Correlation. */
  public final Real    ρ;
  /** Fractional order μ = H + ½. */
  public final Real    μ;
  /** Maturity T &gt; 0. */
  public final Real    T;

  /**
   * The {@link Context} backing every compiled expression in this model
   * instance. Registers λ, θ, ν, V0, ρ, μ, T.
   */
  public final Context context;

  private final boolean owns;

  /**
   * Construct a fresh configuration at default rough-Heston values. This
   * instance owns its Reals and its Context.
   */
  public RoughHestonConfiguration()
  {
    this.λ  = new Real(DEFAULT_λ,  DEFAULT_PREC).setName("λ");
    this.θ  = new Real(DEFAULT_θ,  DEFAULT_PREC).setName("θ");
    this.ν  = new Real(DEFAULT_ν,  DEFAULT_PREC).setName("ν");
    this.V0 = new Real(DEFAULT_V0, DEFAULT_PREC).setName("V0");
    this.ρ  = new Real(DEFAULT_ρ,  DEFAULT_PREC).setName("ρ");
    this.μ  = new Real(DEFAULT_μ,  DEFAULT_PREC).setName("μ");
    this.T  = new Real(DEFAULT_T,  DEFAULT_PREC).setName("T");

    this.context = new Context(λ, θ, ν, V0, ρ, T, μ);

    this.owns = true;
  }

  /**
   * Adopt an existing Context that already contains the seven rough-Heston
   * parameter Reals. The Context retains ownership; closing this instance
   * closes nothing.
   */
  public RoughHestonConfiguration(Context context)
  {
    if (context == null) throw new IllegalArgumentException("context must not be null");
    this.context = context;
    this.λ  = required(context, "λ");
    this.θ  = required(context, "θ");
    this.ν  = required(context, "ν");
    this.V0 = required(context, "V0");
    this.ρ  = required(context, "ρ");
    this.μ  = required(context, "μ");
    this.T  = required(context, "T");
    this.owns = false;
  }

  private static Real required(Context context, String name)
  {
    Real var = context.getVariable(name);
    if (var == null)
      throw new IllegalArgumentException("Context is missing required variable '" + name + "'");
    return var;
  }

  @Override
  public void close()
  {
    if (owns)
      Utensils.close(λ, θ, ν, V0, ρ, μ, T);
  }
}
