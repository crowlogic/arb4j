package arb.functions.complex;

import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Complex;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.Jacobian;
import arb.functions.integer.ComplexSequence;
import arb.functions.integer.Sequence;

/**
 * The Riccati–Mittag-Leffler function
 *
 * <pre>
 *   Y_α(p, q, r; t) := unique analytic solution on a neighborhood of t = 0 of
 *
 *       Đᵅ y(t) = p(v) + q(v)·y(t) + r(v)·y(t)²,    y(0) = 0,    α = μ ∈ (0,1)
 * </pre>
 *
 * <p>
 * A three-parameter family of transcendental functions of t parametrized by a
 * fractional order α ∈ (0,1) and three analytic functions p(v), q(v), r(v) of
 * an external Fourier parameter v. The family generalizes the Mittag-Leffler
 * function E_α (recovered when r ≡ 0, q ≢ 0: Y_α(p, q, 0; t) = (p/q)·(E_α(q·tᵅ)
 * − 1)) and the pure power tᵅ (recovered when q ≡ 0, r ≡ 0: Y_α(p, 0, 0; t) =
 * p·tᵅ/Γ(α+1)). It is strictly larger than ₂F₁ — Gauss hypergeometric is a
 * linear ODE; this is genuinely nonlinear in y. At α = 1 the equation reduces
 * to the classical autonomous Riccati ODE whose solution is rational in tan or
 * tanh of √(q² − 4pr)·t/2 depending on the sign of the discriminant.
 * </p>
 *
 * <h2>Construction</h2>
 *
 * The Müntz coefficient sequence k ↦ a_k(v) is built from the algebraic
 * recurrence
 *
 * <pre>
 *   a_1(v) = p(v) / Γ(μ+1)
 *   γ_k    = Γ((k-1)μ+1) / Γ(kμ+1)
 *   a_k(v) = γ_k · ( q(v)·a_{k-1}(v) + r(v)·Σ_{j=1}^{k-2} a_j(v)·a_{k-1-j}(v) ),  k≥2
 * </pre>
 *
 * compiled once as an expression and handed to the parent
 * {@link MuntzPadeFunction}. Everything else — the Hankel solve, the
 * order-selection loop from precision, the diagonal Padé evaluation, the
 * a-posteriori error bound — lives in the parent because none of it is
 * specific to Riccati: it belongs to the (μ, k ↦ a_k) Müntz–Padé re-summation.
 *
 * <h2>Derivative with respect to v</h2>
 *
 * Differentiating the Riccati equation in v gives the linear fractional
 * Volterra equation
 *
 * <pre>
 *   Đᵅ w(t) = f(t) + g(t)·w(t),    w := ∂y/∂v
 *   f(t)    = c₀'(v) + c₁'(v)·y(t) + c₂'(v)·y(t)²
 *   g(t)    = c₁(v) + 2·c₂(v)·y(t)
 * </pre>
 *
 * whose Müntz coefficients w_k satisfy a linear recurrence in (a_j, w_j). The
 * solution w is itself a Müntz–Padé function in (μ, k ↦ w_k). See
 * {@link #jacobian(String[])}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RiccatiMittagLefflerFunction extends
                                          MuntzPadeFunction
{

  @SuppressWarnings("unused")
  private static final Logger log = LoggerFactory.getLogger(RiccatiMittagLefflerFunction.class);

  /** Documentation-only string of the equation in standard form. */
  public static final String FRACTIONAL_RICCATI_EQUATION = "t➔Đ^(μ)y(t)=t➔p(v)+q(v)*y(t)+r(v)*y(t)²";

  /** Source expressions for p(v), q(v), r(v) — kept for inspection. */
  public final String        constantTerm;
  public final String        linearTerm;
  public final String        quadraticTerm;

  /** Compiled p(v), q(v), r(v). */
  public final ComplexFunction p;
  public final ComplexFunction q;
  public final ComplexFunction r;

  /** The Fourier parameter v as a Complex Context variable. */
  public final Complex       v;

  /** The Context holding all symbolic state (μ, v, p, q, r, S, a). */
  public final Context       context;

  /** Whether this instance owns (and must close) α. */
  private final boolean      ownsAlpha;

  /** Snapshot of v's value at the time the Padé cache was last built. */
  private final Complex      cachedV      = new Complex();
  private boolean            cachedVValid = false;

  // ────────────────────────────────────────────────────────────────────────
  // Construction
  // ────────────────────────────────────────────────────────────────────────

  /**
   * Holder returned by {@link #buildContext(Context, Real, String, String, String)}
   * carrying everything the constructor needs to call super(α, a) and then
   * populate its own fields.
   */
  private static final class Built
  {
    final Real             α;
    final boolean          ownsAlpha;
    final Complex          v;
    final ComplexFunction  p;
    final ComplexFunction  q;
    final ComplexFunction  r;
    final ComplexSequence  a;
    final Context          context;

    Built(Real α, boolean ownsAlpha, Complex v,
          ComplexFunction p, ComplexFunction q, ComplexFunction r,
          ComplexSequence a, Context context)
    {
      this.α         = α;
      this.ownsAlpha = ownsAlpha;
      this.v         = v;
      this.p         = p;
      this.q         = q;
      this.r         = r;
      this.a         = a;
      this.context   = context;
    }
  }

  public RiccatiMittagLefflerFunction(Context context, Real α, String p, String q, String r)
  {
    this(buildContext(context, α, p, q, r), p, q, r);
  }

  public RiccatiMittagLefflerFunction(Real α, String p, String q, String r)
  {
    this(new Context(), α, p, q, r);
  }

  private RiccatiMittagLefflerFunction(Built b, String pSrc, String qSrc, String rSrc)
  {
    super(b.α, b.a);
    this.context       = b.context;
    this.v             = b.v;
    this.p             = b.p;
    this.q             = b.q;
    this.r             = b.r;
    this.ownsAlpha     = b.ownsAlpha;
    this.constantTerm  = pSrc;
    this.linearTerm    = qSrc;
    this.quadraticTerm = rSrc;
  }

  /**
   * Bind μ and v in the supplied Context, compile p(v), q(v), r(v), then
   * compile the Müntz coefficient sequence a_k.
   */
  private static Built buildContext(Context context, Real αSeed, String pSrc, String qSrc, String rSrc)
  {
    Real    α;
    boolean ownsAlpha;
    Real    existingMu = context.getVariable("μ");
    if (existingMu == null)
    {
      Real fresh = new Real();
      fresh.set(αSeed);
      fresh.setName("μ");
      context.registerVariable(fresh);
      α         = fresh;
      ownsAlpha = true;
    }
    else
    {
      existingMu.set(αSeed);
      α         = existingMu;
      ownsAlpha = false;
    }

    Complex v;
    Complex existingV = context.getVariable("v");
    if (existingV == null)
    {
      v = context.registerVariable("v", new Complex().setName("v"));
    }
    else
    {
      v = existingV;
    }

    ComplexFunction p = ComplexFunction.express("p", pSrc, context);
    ComplexFunction q = ComplexFunction.express("q", qSrc, context);
    ComplexFunction r = ComplexFunction.express("r", rSrc, context);

    // Mutually-recursive Müntz cluster: S(k) = Σ a(j)·a(k-1-j); the
    // forward declaration of a's mapping makes the S compiler resolve a by
    // Context lookup instead of recursing into its own definition.
    context.registerFunctionMapping("a", Integer.class, Complex.class, ComplexSequence.class);

    String sExpr = "S:k➔sum(j➔a(j)*a(k-1-j){j=1..k-2})";
    Sequence.parseCompileAndRegister("S", Complex.class, sExpr, ComplexSequence.class, context);

    String aExpr = "a:k➔when(k=1, p(v)/Γ(μ+1),"
                 + " else, (Γ((k-1)*μ+1)/Γ(k*μ+1))"
                 + "       *(q(v)*a(k-1)+r(v)*S(k)))";
    ComplexSequence a = ComplexSequence.express(aExpr, context);

    return new Built(α, ownsAlpha, v, p, q, r, a, context);
  }

  // ────────────────────────────────────────────────────────────────────────
  // Upstream-staleness hooks (parent calls these on every refresh)
  // ────────────────────────────────────────────────────────────────────────

  /**
   * The Müntz coefficient sequence depends on v through p(v), q(v), r(v); the
   * cached re-summation is stale whenever v has moved since the last build.
   */
  @Override
  protected boolean isUpstreamStale()
  {
    return !cachedVValid || !cachedV.equals(v);
  }

  /**
   * The compiled p, q, r, S, a hoist v-dependent sub-expressions in static
   * caches; those caches must be invalidated whenever v changes so the next
   * a_k evaluation rebuilds at the new v.
   */
  @Override
  protected void invalidateUpstream()
  {
    Set<Function<?, ?>> alreadyInvalidated = Collections.newSetFromMap(new IdentityHashMap<>());
    if (p != null) p.invalidateCache(alreadyInvalidated);
    if (q != null) q.invalidateCache(alreadyInvalidated);
    if (r != null) r.invalidateCache(alreadyInvalidated);
    var sMapping = context.<Integer, Complex, ComplexSequence>getFunctionMapping("S");
    if (sMapping != null && sMapping.instance != null)
    {
      sMapping.instance.invalidateCache(alreadyInvalidated);
    }
    if (a != null) a.invalidateCache(alreadyInvalidated);
  }

  @Override
  protected void snapshotUpstream()
  {
    cachedV.set(v);
    cachedVValid = true;
  }

  @Override
  public void invalidateCache()
  {
    super.invalidateCache();
    cachedVValid = false;
  }

  // ────────────────────────────────────────────────────────────────────────
  // Padé sub-context override — must inherit the parent Context's variables
  // so an externally-owned p, q, r, μ, v continue to resolve when the user
  // evaluates the assembled rational function.
  // ────────────────────────────────────────────────────────────────────────

  @Override
  protected ComplexFunction assemblePadeFunction(arb.ComplexPolynomial P_M, arb.ComplexPolynomial Q_M)
  {
    Context subCtx = new Context();
    if (context.variables != null)
    {
      context.variables.forEach((name, var) -> subCtx.variables.put(name, var));
    }
    subCtx.registerFunction("P", P_M.setName("P"));
    subCtx.registerFunction("Q", Q_M.setName("Q"));
    return ComplexFunction.express("ℛ", "z➔P(z)/Q(z)", subCtx);
  }

  // ────────────────────────────────────────────────────────────────────────
  // Inspection methods preserved under the names the existing tests use
  // ────────────────────────────────────────────────────────────────────────

  /**
   * Alias for {@link #coefficients()} — the compiled Müntz coefficient
   * sequence k ↦ a_k(v).
   */
  public ComplexSequence muntzCoefficients()
  {
    return a;
  }

  /**
   * Alias for {@link #coefficientsAt(int, int, Complex)} — evaluate the first
   * n Müntz coefficients α_k = a_k(v) at the current v into the
   * caller-allocated vector.
   */
  public Complex muntzCoefficientsAtV(int n, int bits, Complex result)
  {
    return coefficientsAt(n, bits, result);
  }

  /**
   * Discriminant q(v)² − 4·p(v)·r(v) as a callable ComplexFunction of v.
   */
  public ComplexFunction discriminant()
  {
    return ComplexFunction.express("discriminant", "v➔q(v)²-4*p(v)*r(v)", context);
  }

  // ────────────────────────────────────────────────────────────────────────
  // Jacobian: ∂y/∂v as a MuntzPadeFunction in its own right
  // ────────────────────────────────────────────────────────────────────────

  /**
   * Jacobian of y with respect to v.
   *
   * <p>
   * Differentiating the Riccati ODE in v gives the linear fractional Volterra
   * equation
   *
   * <pre>
   *   Đᵅ w(t) = f(t) + g(t)·w(t),    w(t) := ∂y/∂v(t)
   *   f(t)    = c₀'(v) + c₁'(v)·y(t) + c₂'(v)·y(t)²
   *   g(t)    = c₁(v)  + 2·c₂(v)·y(t)
   * </pre>
   *
   * Substituting y(t) = Σ a_k·t^{kμ} and matching powers gives Müntz
   * coefficients
   *
   * <pre>
   *   f_0 = c₀'(v),                    f_k = c₁'(v)·a_k + c₂'(v)·Σ_{j=1}^{k-1} a_j·a_{k-j}   for k≥1
   *   g_0 = c₁(v),                     g_k = 2·c₂(v)·a_k                                     for k≥1
   * </pre>
   *
   * Then w_n is determined by a linear recurrence
   *
   * <pre>
   *   w_1     = f_0 / Γ(μ+1)
   *   w_{n+1} = ( Γ(nμ+1) / Γ((n+1)μ+1) ) · ( f_n + Σ_{j=0}^{n-1} g_{n-1-j}·w_{j+1} ),  n≥1
   * </pre>
   *
   * The solution w(t) = Σ w_k·t^{kμ} is itself a Müntz–Padé function, so the
   * partial is returned as a fresh {@link MuntzPadeFunction} sharing the same
   * α and the new w-sequence.
   * </p>
   */
  @Override
  public Jacobian<Complex, Complex, ? extends Function<Complex, Complex>> jacobian(String[] variables)
  {
    if (variables == null || variables.length == 0)
    {
      throw new IllegalArgumentException("variables must be a non-empty array");
    }
    ComplexFunction[] partials = new ComplexFunction[variables.length];
    for (int i = 0; i < variables.length; i++)
    {
      String name = variables[i];
      if (!"v".equals(name))
      {
        throw new IllegalArgumentException("only ∂/∂v is currently supported, got ∂/∂" + name);
      }
      partials[i] = partialDerivativeWithRespectToV();
    }
    return new Jacobian<Complex, Complex, ComplexFunction>(this, variables, partials);
  }

  /**
   * Build w(t) = ∂y/∂v as a {@link MuntzPadeFunction} with the linear-Volterra
   * Müntz coefficients w_k.
   *
   * <p>p, q, r already live in {@link #context} as compiled
   * {@link ComplexFunction}s. Their v-partials are obtained via the universal
   * lazy on-demand {@link Function#derivative(String)} entry point — pure-Java
   * AST surgery on the source Expressions, no sub-context, no symbol
   * renaming. The differentiated functions are then plugged into the same
   * {@link #context} under the names ṗ, q̇, ṙ so the f, g, w expressions can
   * resolve them by name like any other Context-scoped function.
   */
  private ComplexFunction partialDerivativeWithRespectToV()
  {
    // p_dv, q_dv, r_dv : ∂p/∂v, ∂q/∂v, ∂r/∂v — fresh ComplexFunctions sharing
    // this.context. The cloned Expression compiles under className equal to
    // <orig>_d<var>, so the registered function name must match that exact
    // string for the JVM to resolve the field descriptor `L<name>;` to the
    // actual loaded class on the shared ExpressionClassLoader.
    ComplexFunction p_dv = (ComplexFunction) p.derivative("v");
    ComplexFunction q_dv = (ComplexFunction) q.derivative("v");
    ComplexFunction r_dv = (ComplexFunction) r.derivative("v");

    // Register them by name in the same Context. Both `instance` and
    // `expression` are set so generateFunctionInitializer finds the source
    // Expression for v/μ-propagation field-injection.
    var pMap = context.registerFunctionMapping("p_dv", Complex.class, Complex.class, ComplexFunction.class);
    pMap.instance   = p_dv;
    pMap.expression = (Expression) p_dv.getExpression();
    var qMap = context.registerFunctionMapping("q_dv", Complex.class, Complex.class, ComplexFunction.class);
    qMap.instance   = q_dv;
    qMap.expression = (Expression) q_dv.getExpression();
    var rMap = context.registerFunctionMapping("r_dv", Complex.class, Complex.class, ComplexFunction.class);
    rMap.instance   = r_dv;
    rMap.expression = (Expression) r_dv.getExpression();

    // Forward-declare w so its self-reference resolves; a is already in context.
    context.registerFunctionMapping("w", Integer.class, Complex.class, ComplexSequence.class);

    // f_k:  k=0 → ṗ(v);    k≥1 → q̇(v)·a(k) + ṙ(v)·Σ_{j=1}^{k-1} a(j)·a(k-j)
    String fExpr = "f:k➔when(k=0, p_dv(v),"
                 + " else, q_dv(v)*a(k) + r_dv(v)*sum(j➔a(j)*a(k-j){j=1..k-1}))";
    Sequence.parseCompileAndRegister("f", Complex.class, fExpr, ComplexSequence.class, context);

    // g_k:  k=0 → q(v);     k≥1 → 2·r(v)·a(k)
    String gExpr = "g:k➔when(k=0, q(v), else, 2*r(v)*a(k))";
    Sequence.parseCompileAndRegister("g", Complex.class, gExpr, ComplexSequence.class, context);

    // w_k linear Volterra recurrence (qrh_muntz §7.8):
    //   w(1) = ṗ(v)/Γ(μ+1)
    //   w(k) = Γ((k-1)μ+1)/Γ(kμ+1) · (f(k-1) + Σ_{j=0..k-2} g(k-2-j)·w(j+1))   [k≥2]
    String wExpr = "w:k➔when(k=1, p_dv(v)/Γ(μ+1),"
                 + " else, (Γ((k-1)*μ+1)/Γ(k*μ+1))"
                 + "       *(f(k-1) + sum(j➔g(k-2-j)*w(j+1){j=0..k-2})))";
    ComplexSequence w = ComplexSequence.express(wExpr, context);

    return new MuntzPadeFunction("∂y/∂v", α, w);
  }

  // ────────────────────────────────────────────────────────────────────────
  // Resource lifecycle
  // ────────────────────────────────────────────────────────────────────────

  @Override
  public void close()
  {
    super.close();
    if (ownsAlpha && α != null)
    {
      α.close();
    }
  }
}
