package arb.functions.complex;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.*;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.Sequence;
import arb.solvers.HankelSolver;

/**
 * <pre>
 * The Riccati–Mittag-Leffler function
 *
 *   𝒴ₐ(p, q, r; t, v) ≔ unique analytic solution on a neighborhood of t = 0 of the 
 *   fractional Riccati equation
 *       
 *       Đᵅ y(t; v) = p(v) + q(v)·y(t; v) + r(v)·y(t; v)²
 *       
 *   where y(0; v) = 0 and α = μ ∈ (0,1)
 *
 *   ──────────────────────────────────────────────────────────────────────
 *
 *   A three-parameter family of transcendental functions of t parametrized
 *   by a fractional order α ∈ (0,1) and three analytic functions p(v),
 *   q(v), r(v) of an external Fourier parameter v. As a ComplexFunctional,
 *   this is the curry  v ↦ (t ↦ 𝒴ₐ(t; v))  — every call to
 *   evaluate(Complex, int, int, ComplexFunction) at a v produces a fresh
 *   MuntzPadeApproximantAtV bound to the Padé pair built at that specific
 *   v. There is no mutable v field, no v-context, no cache that depends
 *   on v.
 *
 *   ═══ Construction ═════════════════════════════════════════════════════
 *
 *   The curried Müntz coefficient sequence  k ↦ v ↦ aₖ(v)  is built from
 *   the algebraic recurrence
 *
 *       a₁(v) = p(v) ∕ Γ(μ+1)
 *       γₖ    = Γ((k−1)μ+1) ∕ Γ(kμ+1)
 *       aₖ(v) = γₖ · ( q(v)·aₖ₋₁(v)
 *                    + r(v)·∑ⱼ₌₁ᵏ⁻² aⱼ(v)·aₖ₋₁₋ⱼ(v) ),   k ≥ 2
 *
 *   compiled once as a {@link ComplexFunctionSequence} and handed to the parent
 *   {@link MuntzPadeFunction}. Everything else — the {@link HankelSolver}, the
 *   order-selection loop from precision, the {@link PadeDiagonal} evaluation,
 *   the a-posteriori error bound — exists in the parent because none of
 *   it is specific to Riccati: it belongs to the (μ, k ↦ v ↦ aₖ(v))
 *   Müntz–Padé re-summation.
 * </pre>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the TheArb4jLibrary
 */
public class RiccatiMittagLefflerFunction extends
                                          MuntzPadeFunction
{

  @SuppressWarnings("unused")
  private static final Logger  log                         = LoggerFactory.getLogger(RiccatiMittagLefflerFunction.class);

  /** Documentation-only string of the equation in standard form. */
  public static final String   FRACTIONAL_RICCATI_EQUATION = "t➔Đ^(μ)y(t;v)=t➔p(v)+q(v)*y(t;v)+r(v)*y(t;v)²";

  /** Compiled p(v), q(v), r(v). */
  public final ComplexFunction p;
  public final ComplexFunction q;
  public final ComplexFunction r;

  /** The Context holding the symbolic parameters (μ, p, q, r, S, a). */
  public final Context         context;

  /** Whether this instance owns (and must close) α. */
  private final boolean        ownsAlpha;

  private ComplexFunction      discriminant;

  public RiccatiMittagLefflerFunction(Context context, Real α, String pSrc, String qSrc, String rSrc)
  {
    this.context = context;
    Real μ = context.getVariable("μ");
    if (μ == null)
    {
      Real fresh = new Real();
      fresh.set(α);
      fresh.setName("μ");
      context.registerVariable(fresh);
      α         = fresh;
      ownsAlpha = true;
    }
    else
    {
      μ.set(α);
      α         = μ;
      ownsAlpha = false;
    }
    this.α       = α;

    p            = ComplexFunction.express("p", pSrc, context);
    q            = ComplexFunction.express("q", qSrc, context);
    r            = ComplexFunction.express("r", rSrc, context);
    discriminant = ComplexFunction.express("q(v)² − 4·p(v)·r(v)", context);

    ComplexFunctionSequence.declare("a", context);

    Sequence.compile(ComplexFunction.class, "S:k➔v➔sum(j➔a(j)(v)*a(k-1-j)(v){j=1..k-2})", ComplexFunctionSequence.class, context);

    a = ComplexFunctionSequence.express("a:k➔v➔when(k=1,p(v)/Γ(μ+1),else,(Γ((k-1)*μ+1)/Γ(k*μ+1))*(q(v)*a(k-1)(v)+r(v)*S(k)(v)))", context);
  }

  public RiccatiMittagLefflerFunction(Real α, String p, String q, String r)
  {
    this(new Context(),
         α,
         p,
         q,
         r);
  }

  public ComplexFunctionSequence muntzBasis()
  {
    return a;
  }

  public ComplexFunction discriminant()
  {
    return discriminant;
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
   *   Đᵅ w(t; v) = f(t; v) + g(t; v)·w(t; v),    w(t;v) := ∂y(t;v)/∂v
   *   f(t; v)    = ṗ(v) + q̇(v)·y(t;v) + ṙ(v)·y(t;v)²
   *   g(t; v)    = q(v) + 2·r(v)·y(t;v)
   * </pre>
   *
   * Substituting y(t;v) = Σ a_k(v)·t^{kμ} and matching powers gives Müntz
   * coefficients
   *
   * <pre>
   *   f_0(v) = ṗ(v),                      f_k(v) = q̇(v)·a_k(v) + ṙ(v)·Σ_{j=1..k-1} a_j(v)·a_{k-j}(v)
   *   g_0(v) = q(v),                      g_k(v) = 2·r(v)·a_k(v)                     for k≥1
   * </pre>
   *
   * Then w_n(v) is determined by a linear recurrence
   *
   * <pre>
   *   w_1(v)     = ṗ(v) / Γ(μ+1)
   *   w_{n+1}(v) = ( Γ(nμ+1) / Γ((n+1)μ+1) ) · ( f_n(v) + Σ_{j=0..n-1} g_{n-1-j}(v)·w_{j+1}(v) ),  n≥1
   * </pre>
   *
   * The solution w(t;v) = Σ w_k(v)·t^{kμ} is itself a Müntz–Padé function, so the
   * partial is returned as a fresh {@link MuntzPadeFunction} sharing the same α
   * and the new curried w-sequence.
   * </p>
   */
  @Override
  public Jacobian<Complex, ComplexFunction, ? extends Function<Complex, ComplexFunction>> jacobian(String[] variables)
  {
    if (variables == null || variables.length == 0)
    {
      throw new IllegalArgumentException("variables must be a non-empty array");
    }
    ComplexFunctional[] partials = new ComplexFunctional[variables.length];
    for (int i = 0; i < variables.length; i++)
    {
      String name = variables[i];
      if (!"v".equals(name))
      {
        throw new IllegalArgumentException("only ∂/∂v is currently supported, got ∂/∂" + name);
      }
      partials[i] = partialDerivativeWithRespectToV();
    }
    return new Jacobian<Complex, ComplexFunction, ComplexFunctional>(this,
                                                                     variables,
                                                                     partials);
  }

  /**
   * Build w(t;v) = ∂y/∂v as a {@link MuntzPadeFunction} with the linear-Volterra
   * curried Müntz coefficients k ↦ v ↦ w_k(v).
   *
   * <p>
   * p, q, r already live in {@link #context} as compiled
   * {@link ComplexFunction}s. Their v-partials are obtained via the universal
   * lazy on-demand {@link Function#derivative(String)} entry point — pure-Java
   * AST surgery on the source Expressions, no sub-context, no symbol renaming.
   * The differentiated functions are then plugged into the same {@link #context}
   * under the names ṗ, q̇, ṙ so the f, g, w expressions can resolve them by name
   * like any other Context-scoped function.
   */
  private ComplexFunctional partialDerivativeWithRespectToV()
  {
    ComplexFunction p_dv = (ComplexFunction) p.derivative("v");
    ComplexFunction q_dv = (ComplexFunction) q.derivative("v");
    ComplexFunction r_dv = (ComplexFunction) r.derivative("v");

    var             pMap = context.registerFunctionMapping("p_dv", Complex.class, Complex.class, ComplexFunction.class);
    pMap.instance   = p_dv;
    pMap.expression = (Expression) p_dv.getExpression();
    var qMap = context.registerFunctionMapping("q_dv", Complex.class, Complex.class, ComplexFunction.class);
    qMap.instance   = q_dv;
    qMap.expression = (Expression) q_dv.getExpression();
    var rMap = context.registerFunctionMapping("r_dv", Complex.class, Complex.class, ComplexFunction.class);
    rMap.instance   = r_dv;
    rMap.expression = (Expression) r_dv.getExpression();

    // Forward-declare w so its self-reference resolves; a is already in context.
    context.registerFunctionMapping("w", arb.Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);

    // f(k)(v) : k=0 → ṗ(v); k≥1 → q̇(v)·a(k)(v) + ṙ(v)·Σ_{j=1..k-1}
    // a(j)(v)·a(k-j)(v)
    String fExpr = "f:k➔v➔when(k=0, p_dv(v)," + " else, q_dv(v)*a(k)(v) + r_dv(v)*sum(j➔a(j)(v)*a(k-j)(v){j=1..k-1}))";
    Sequence.compile("f", ComplexFunction.class, fExpr, ComplexFunctionSequence.class, context);

    // g(k)(v) : k=0 → q(v); k≥1 → 2·r(v)·a(k)(v)
    String gExpr = "g:k➔v➔when(k=0, q(v), else, 2*r(v)*a(k)(v))";
    Sequence.compile("g", ComplexFunction.class, gExpr, ComplexFunctionSequence.class, context);

    // w(k)(v) linear Volterra recurrence:
    // w(1)(v) = ṗ(v)/Γ(μ+1)
    // w(k)(v) = Γ((k-1)μ+1)/Γ(kμ+1) · (f(k-1)(v) + Σ_{j=0..k-2}
    // g(k-2-j)(v)·w(j+1)(v)) [k≥2]
    String                  wExpr = "w:k➔v➔when(k=1, p_dv(v)/Γ(μ+1),"
                                    + " else, (Γ((k-1)*μ+1)/Γ(k*μ+1))"
                                    + "       *(f(k-1)(v) + sum(j➔g(k-2-j)(v)*w(j+1)(v){j=0..k-2})))";
    ComplexFunctionSequence w     = ComplexFunctionSequence.express(wExpr, context);

    return new MuntzPadeFunction("∂y/∂v",
                                 α,
                                 w);
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
