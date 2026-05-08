package arb.functions.complex;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.ComplexFunctional;
import arb.functions.Jacobian;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.Sequence;

/**
 * <pre>
 * The Riccati–Muntz-Pade function with polynomial coefficients.
 *
 *   𝒴ₐ(P, Q, R; t, v) ≔ unique analytic solution on a neighborhood of t = 0 of the 
 *   fractional Riccati equation
 *       
 *       Đᵅ y(t; v) = p(v) + q(v)·y(t; v) + r(v)·y(t; v)²
 *       
 *   where y(0; v) = 0 and α = μ ∈ (0,1)
 *
 *   ═══ Naming convention ════════════════════════════════════════════════
 *
 *   Capital P, Q, R  = {@link ComplexPolynomialNullaryFunction} instances
 *                      (nullary functions provided by the caller).
 *                      Calling P.evaluate() returns a ComplexPolynomial.
 *
 *   Lowercase p, q, r  = {@link ComplexPolynomial} variables registered in
 *                      {@link #context}. These are what the recurrence
 *                      expressions reference as p(v), q(v), r(v).
 *
 *   Coefficient access: because ComplexPolynomial has get(int) returning Complex,
 *   the expression compiler already supports p[0], p[1], etc., for coefficient
 *   extraction. This is used by downstream Edgeworth expansion code to compute
 *   cumulants directly from polynomial coefficients.
 *
 *   Independent variable name: the nullary functions declare "v" as the 
 *   independent variable via the v➔ arrow syntax. The expression compiler
 *   sets this on the produced ComplexPolynomial via setIndependentVariableName().
 *
 *   When parameters change, the caller invalidates P, Q, R.
 *   Calling invalidateCache() on this functional re-evaluates P, Q, R
 *   to refresh p, q, r, then recalculates the Müntz coefficients.
 *
 *   The curried Müntz coefficient sequence  k ↦ v ↦ aₖ(v)  is built from
 *   the algebraic recurrence
 *
 *       a₁(v) = p(v) / Γ(μ+1)
 *       γₖ    = Γ((k−1)μ+1) / Γ(kμ+1)
 *       aₖ(v) = γₖ · ( q(v)·aₖ₋₁(v)
 *                    + r(v)·∑ⱼ₌₁ᵏ⁻² aⱼ(v)·aₖ₋₁₋ⱼ(v) ),   k ≥ 2
 *
 *   compiled once as a {@link ComplexFunctionSequence} and handed to the parent
 *   {@link MuntzPadeFunctional}.
 * </pre>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RiccatiMuntzPadeFunctional extends
                                        MuntzPadeFunctional
{

  @SuppressWarnings("unused")
  private static final Logger             log                         = LoggerFactory.getLogger(RiccatiMuntzPadeFunctional.class);

  /** Documentation-only string of the equation in standard form. */
  public static final String              FRACTIONAL_RICCATI_EQUATION = "t➔Đ^(μ)y(t;v)=t➔p(v)+q(v)*y(t;v)+r(v)*y(t;v)²";

  /**
   * Nullary polynomial factory functions (caller-provided). evaluate() with no
   * argument returns the current ComplexPolynomial. The caller invalidates these
   * when parameters change.
   */
  public ComplexPolynomialNullaryFunction P;
  public ComplexPolynomialNullaryFunction Q;
  public ComplexPolynomialNullaryFunction R;

  /**
   * Polynomial coefficient variables registered in context. Populated by
   * evaluating P, Q, R. Expressions reference them as p(v), q(v), r(v).
   * Coefficient access via p[0], p[1], etc., is supported by
   * ComplexPolynomial.get(int).
   */
  public ComplexPolynomial                p;
  public ComplexPolynomial                q;
  public ComplexPolynomial                r;

  /** The Context holding the symbolic parameters (μ, p, q, r, S, a). */
  public Context                          context;

  /** Whether this instance owns (and must close) α. */
  private boolean                         ownsAlpha;

  private ComplexFunction                 discriminant;

  /**
   * Construct with nullary polynomial factory functions.
   *
   * @param context the expression context
   * @param α       fractional order μ ∈ (0,1)
   * @param P       nullary function returning p(v) polynomial
   * @param Q       nullary function returning q(v) polynomial
   * @param R       nullary function returning r(v) polynomial
   */
  public RiccatiMuntzPadeFunctional(Context context,
                                    Real α,
                                    ComplexPolynomialNullaryFunction P,
                                    ComplexPolynomialNullaryFunction Q,
                                    ComplexPolynomialNullaryFunction R)
  {
    this.context = context;
    this.P       = P;
    this.Q       = Q;
    this.R       = R;

    // Register fractional order μ
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
    this.α = α;

    // Allocate polynomial variables once, register in context
    p      = new ComplexPolynomial();
    p.setName("p");
    context.registerVariable(p);

    q = new ComplexPolynomial();
    q.setName("q");
    context.registerVariable(q);

    r = new ComplexPolynomial();
    r.setName("r");
    context.registerVariable(r);

    // Populate from nullary functions
    refreshPolynomials();

    // Discriminant: q(v)² − 4·p(v)·r(v)
    discriminant = ComplexFunction.express("q(v)² − 4·p(v)·r(v)", context);

    // Declare the Müntz coefficient sequence
    ComplexFunctionSequence.declare("a", context);

    // Compile the convolution sum S(k)(v) = Σ_{j=1}^{k-2} a(j)(v)·a(k-1-j)(v)
    Sequence.compile(ComplexFunction.class, "S:k➔v➔sum(j➔a(j)(v)*a(k-1-j)(v){j=1..k-2})", ComplexFunctionSequence.class, context);

    // Compile the full recurrence
    a = ComplexFunctionSequence.express("a:k➔v➔when(k=1,p(v)/Γ(μ+1),else,(Γ((k-1)*μ+1)/Γ(k*μ+1))*(q(v)*a(k-1)(v)+r(v)*S(k)(v)))", context);
  }

  /**
   * Convenience constructor with fresh context.
   */
  public RiccatiMuntzPadeFunctional(Real α, ComplexPolynomialNullaryFunction P, ComplexPolynomialNullaryFunction Q, ComplexPolynomialNullaryFunction R)
  {
    this(new Context(),
         α,
         P,
         Q,
         R);
  }

  public RiccatiMuntzPadeFunctional(Context context, Real μ, String pExpr, String qExpr, String rExpr)
  {
    this(context,
         μ,
         ComplexPolynomialNullaryFunction.express("P", pExpr, context),
         ComplexPolynomialNullaryFunction.express("Q", qExpr, context),
         ComplexPolynomialNullaryFunction.express("R", rExpr, context));
    refreshPolynomials();

  }

  public RiccatiMuntzPadeFunctional(Real μ, String string, String string2, String string3)
  {
    this(new Context(),
         μ,
         string,
         string2,
         string3);
  }

  /**
   * Refresh polynomial variables from nullary functions. Passes the existing
   * polynomials as result arguments to avoid allocation. Call this (or
   * invalidateCache()) when underlying parameters have changed.
   */
  public void refreshPolynomials()
  {
    P.evaluate(null, 0, 128, p);
    Q.evaluate(null, 0, 128, q);
    R.evaluate(null, 0, 128, r);
  }

  @Override
  public void invalidateCache()
  {
    refreshPolynomials();
    super.invalidateCache();
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
   * where ṗ, q̇, ṙ are the formal derivatives of the polynomial coefficient
   * variables p, q, r. These are obtained via
   * {@link ComplexPolynomial#derivative()} — pure algebraic coefficient shifting,
   * no numerical approximation.
   *
   * The solution w(t;v) = Σ w_k(v)·t^{kμ} is itself a Müntz–Padé function.
   * </p>
   */
  @Override
  public Jacobian<Complex, ComplexFunction, ComplexFunctional> jacobian(String[] variables)
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
   * Build w(t;v) = ∂y/∂v as a {@link MuntzPadeFunctional}.
   *
   * <p>
   * p, q, r are polynomial variables in {@link #context}. Their formal
   * v-derivatives are obtained via {@link ComplexPolynomial#derivative()}, then
   * registered as variables p_dv, q_dv, r_dv for use in the f, g, w recurrence
   * expressions.
   * </p>
   */
  private ComplexFunctional partialDerivativeWithRespectToV()
  {
    // Formal derivatives of polynomial coefficient variables
    ComplexPolynomial p_dv = p.derivative();
    ComplexPolynomial q_dv = q.derivative();
    ComplexPolynomial r_dv = r.derivative();

    // Register derivatives as variables in context
    p_dv.setName("p_dv");
    context.registerVariable(p_dv);
    q_dv.setName("q_dv");
    context.registerVariable(q_dv);
    r_dv.setName("r_dv");
    context.registerVariable(r_dv);

    // Forward-declare w so its self-reference resolves
    context.registerFunctionMapping("w", arb.Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);

    // f(k)(v) : k=0 → ṗ(v); k≥1 → q̇(v)·a(k)(v) + ṙ(v)·Σ_{j=1..k-1}
    // a(j)(v)·a(k-j)(v)
    String fExpr = "f:k➔v➔when(k=0, p_dv(v)," + " else, q_dv(v)*a(k)(v) + r_dv(v)*sum(j➔a(j)(v)*a(k-j)(v){j=1..k-1}))";
    Sequence.compile("f", ComplexFunction.class, fExpr, ComplexFunctionSequence.class, context);

    // g(k)(v) : k=0 → q(v); k≥1 → 2·r(v)·a(k)(v)
    String gExpr = "g:k➔v➔when(k=0, q(v), else, 2*r(v)*a(k)(v))";
    Sequence.compile("g", ComplexFunction.class, gExpr, ComplexFunctionSequence.class, context);

    // w(k)(v) linear Volterra recurrence
    String                  wExpr = "w:k➔v➔when(k=1, p_dv(v)/Γ(μ+1),"
                                    + " else, (Γ((k-1)*μ+1)/Γ(k*μ+1))"
                                    + "       *(f(k-1)(v) + sum(j➔g(k-2-j)(v)*w(j+1)(v){j=0..k-2})))";
    ComplexFunctionSequence w     = ComplexFunctionSequence.express(wExpr, context);

    return new MuntzPadeFunctional("∂y/∂v",
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
    // Nullary functions P, Q, R are managed by caller
    // Polynomial variables p, q, r are closed via context or caller
  }
}