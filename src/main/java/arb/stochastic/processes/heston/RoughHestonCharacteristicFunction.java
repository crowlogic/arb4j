package arb.stochastic.processes.heston;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.RealSequence;
import arb.utensils.Utensils;

/**
 * Rough Heston characteristic function (El Euch–Rosenbaum 2019, eq 1.8) at a
 * fixed maturity {@code T}:
 *
 * <pre>
 *   φ(u, T) = exp( θλ · ∫₀ᵀ h(u, s) ds  +  V₀ · I^{1-μ} h(u, ·)(T) )
 * </pre>
 *
 * where {@code h(u, t)} solves the constant-coefficient fractional Riccati
 *
 * <pre>
 *   D^μ h = ½(-u² - iu) + λ(iuρν - 1)·h + ½(λν)²·h²,    h(0) = 0,
 *   μ = H + ½ ∈ (½, 1)
 * </pre>
 *
 * <h2>Müntz-lattice expansion</h2>
 *
 * Term-by-term integration of the Riccati Müntz series gives the lattice
 * representation (see {@code docs/Muntz lattice expansion of the rough Heston
 * cumulant generating function.txt}):
 *
 * <pre>
 *   Φ(v, T) = Σ_{k≥0} [ u_k · a_k(v) + w_k · a_{k+1}(v) ] · T^{kμ+1}
 *   u_k = θλ / (kμ + 1)
 *   w_k = V₀ · Γ((k+1)μ + 1) / Γ(kμ + 2)
 *   a_0(v) := 0
 *
 *   φ_N(v, T) = exp(Φ_N(v, T))
 * </pre>
 *
 * Implemented by composing {@link MuntzPadeCumulantGenerator} with the
 * rough-Heston-specific weights u and w, then wrapping the resulting CGF in
 * {@code exp}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings({ "unused", "unchecked" })
public class RoughHestonCharacteristicFunction implements
                                               ComplexFunction,
                                               AutoCloseable
{
  // ───── Default parameter values ──────────────────────────────────────
  private static final String                        DEFAULT_λ    = "0.3";
  private static final String                        DEFAULT_θ    = "0.02";
  private static final String                        DEFAULT_ν    = "0.3";
  private static final String                        DEFAULT_V0   = "0.02";
  private static final String                        DEFAULT_ρ    = "-0.7";
  private static final String                        DEFAULT_μ    = "0.6";
  private static final String                        DEFAULT_T    = "1.0";
  private static final int                           DEFAULT_N    = 5;
  private static final int                           DEFAULT_PREC = 128;

  /** Mean-reversion speed of the variance. */
  public final Real                                  λ;
  /** Long-run variance level. */
  public final Real                                  θ;
  /** Vol-of-vol. */
  public final Real                                  ν;
  /** Initial variance V(0). */
  public final Real                                  V0;
  /** Correlation. */
  public final Real                                  ρ;
  /** Fractional order μ = H + ½; same instance as {@code riccati.α}. */
  public final Real                                  μ;
  /** Maturity T > 0. */
  public final Real                                  T;

  /** The Context backing this CF. */
  public final Context                               context;

  /** The fractional Riccati solver supplying a_k(u). */
  public final RoughHestonRiccatiMuntzPadeFunctional riccati;

  /** Compiled Müntz coefficient sequence k ↦ a_k(v). */
  public final ComplexPolynomialSequence             a;

  /**
   * General Müntz-lattice cumulant generator. Built from the rough-Heston lattice
   * weights
   *
   * <pre>
   *   u: k ➔ θ*λ / (k*μ + 1)
   *   w: k ➔ V0 * Γ((k+1)*μ + 1) / Γ(k*μ + 2)
   * </pre>
   *
   * and the Riccati Müntz coefficient sequence {@code a}. Exposes the cumulant
   * {@code Φ(v, T) = Σ_{k=0..N} d_k(v) T^{kμ+1}}.
   */
  public final ComplexFunction                       cumulantGeneratingFunction;

  /**
   * Compiled characteristic function:
   *
   * <pre>
   * φ(v) = exp(Φ(v, T))
   * </pre>
   *
   * with Φ supplied by {@link #cumulantGeneratingFunction}. A single compiled
   * expression — no per-call Java arithmetic. {@code N} is the
   * {@link #cumulantGeneratingFunction}'s truncation order; mutate via
   * {@link #setN}.
   */
  public final ComplexFunction                       φ;

  private final boolean                              ownsParameters;

  // ─────────────────────────────────────────────────────────────────────
  // No-arg / JShell-friendly constructor
  // ─────────────────────────────────────────────────────────────────────

  @SuppressWarnings("resource")
  public RoughHestonCharacteristicFunction(Complex v)
  {
    this.λ  = new Real(DEFAULT_λ,
                       DEFAULT_PREC).setName("λ");
    this.θ  = new Real(DEFAULT_θ,
                       DEFAULT_PREC).setName("θ");
    this.ν  = new Real(DEFAULT_ν,
                       DEFAULT_PREC).setName("ν");
    this.V0 = new Real(DEFAULT_V0,
                       DEFAULT_PREC).setName("V0");
    this.ρ  = new Real(DEFAULT_ρ,
                       DEFAULT_PREC).setName("ρ");
    this.T  = new Real(DEFAULT_T,
                       DEFAULT_PREC).setName("T");
    Real μSeed = new Real(DEFAULT_μ,
                          DEFAULT_PREC).setName("μ");

    this.context                    = new Context(this.λ,
                                                  this.θ,
                                                  this.ν,
                                                  this.V0,
                                                  this.ρ,
                                                  this.T,
                                                  μSeed);

    this.riccati                    = new RoughHestonRiccatiMuntzPadeFunctional(context,
                                                                                μSeed);
    this.μ                          = riccati.α;
    this.a                          = riccati.a;

    this.cumulantGeneratingFunction = buildCumulantGeneratingFunction(context, a);
    this.φ                          = ComplexFunction.express("φ:v➔exp(Φ(v))", context);

    this.ownsParameters             = true;
  }

  public RoughHestonCharacteristicFunction()
  {
    this(ComplexConstants.zero);
  }

  // ─────────────────────────────────────────────────────────────────────
  // Context-based constructor (compose into a larger model)
  // ─────────────────────────────────────────────────────────────────────

  public RoughHestonCharacteristicFunction(Context context, Complex v)
  {
    if (context == null)
      throw new IllegalArgumentException("context must not be null");

    this.context = context;

    this.λ       = required(context, "λ");
    this.θ       = required(context, "θ");
    this.ν       = required(context, "ν");
    this.V0      = required(context, "V0");
    this.ρ       = required(context, "ρ");
    this.T       = required(context, "T");
    Real μFromCtx = required(context, "μ");

    this.riccati                    = new RoughHestonRiccatiMuntzPadeFunctional(context,
                                                                                μFromCtx);
    this.μ                          = riccati.α;
    this.a                          = riccati.a;

    this.cumulantGeneratingFunction = buildCumulantGeneratingFunction(context, a);
    this.φ                          = ComplexFunction.express("φ:v➔exp(Φ(v))", context);

    this.ownsParameters             = false;
  }

  /**
   * Wire the rough-Heston-specific lattice weights and hand them to the general
   * {@link MuntzPadeCumulantGenerator}. The CGF registers itself as {@code Φ} in
   * the context so the exp wrapper above can call it.
   */
  private static ComplexFunction buildCumulantGeneratingFunction(Context context, ComplexPolynomialSequence a)
  {
    RealSequence u = RealSequence.express("u:k➔θ*λ/(k*μ+1)", context);
    RealSequence w = RealSequence.express("w:k➔V0*Γ((k+1)*μ+1)/Γ(k*μ+2)", context);
    return ComplexFunction.express("d:k->theFuckingExpressionGoesHereNotNoFuckingJavaClassYouGodDamnFool(k)", context);
  }

  // ─────────────────────────────────────────────────────────────────────
  // evaluate: φ_N(u, T) = exp( Σ_{k=0..N} d_k(u) · T^(k·μ + 1) ) via cgf.Φ
  // d_k(u) = κθ · a_k(u)/(kμ+1) + V_0 · Γ((k+1)μ+1)/Γ(kμ+2) · a_{k+1}(u), a_0 ≡ 0
  // ─────────────────────────────────────────────────────────────────────

  @Override
  public Complex evaluate(Complex uVal, int order, int bits, Complex res)
  {
    return φ.evaluate(uVal, order, bits, res);
  }

  // ─────────────────────────────────────────────────────────────────────
  // Helpers
  // ─────────────────────────────────────────────────────────────────────

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
    if (φ != null)
      φ.close();
    if (cumulantGeneratingFunction != null)
      cumulantGeneratingFunction.close();
    if (riccati != null)
      riccati.close();
    if (ownsParameters)
      Utensils.close(λ, θ, ν, V0, ρ, T, μ);
  }
}
