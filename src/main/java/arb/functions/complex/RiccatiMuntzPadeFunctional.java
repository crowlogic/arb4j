package arb.functions.complex;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.ComplexFunctional;
import arb.functions.Jacobian;
import arb.functions.integer.*;

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
  private static final Logger              log                         = LoggerFactory.getLogger(RiccatiMuntzPadeFunctional.class);

  /** Documentation-only string of the equation in standard form. */
  public static final String               FRACTIONAL_RICCATI_EQUATION = "t➔Đ^(μ)y(t;v)=t➔p(v)+q(v)*y(t;v)+r(v)*y(t;v)²";

  /**
   * Nullary polynomial factory functions (caller-provided). evaluate() with no
   * argument returns the current ComplexPolynomial. The caller invalidates these
   * when parameters change.
   */
  public ComplexPolynomialNullaryFunction  P;
  public ComplexPolynomialNullaryFunction  Q;
  public ComplexPolynomialNullaryFunction  R;

  /**
   * Polynomial coefficient variables registered in context. Populated by
   * evaluating P, Q, R. Expressions reference them as p(v), q(v), r(v).
   * Coefficient access via p[0], p[1], etc., is supported by
   * ComplexPolynomial.get(int).
   */
  public ComplexPolynomial                 p;
  public ComplexPolynomial                 q;
  public ComplexPolynomial                 r;

  /** The Context holding the symbolic parameters (μ, p, q, r, S, a). */
  public Context                           context;

  /** Whether this instance owns (and must close) α. */
  private boolean                          ownsAlpha;

  private ComplexPolynomialNullaryFunction discriminant;

  private ComplexPolynomial                d;

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

    this.context = context.disableLommelPolynomials();
    this.P       = P;
    this.Q       = Q;
    this.R       = R;

    initializeFractionalExponent(context, α);

    // Allocate polynomial variables once, register in context
    context.registerVariable(p = ComplexPolynomial.named("p"));
    context.registerVariable(q = ComplexPolynomial.named("q"));
    context.registerVariable(r = ComplexPolynomial.named("r"));

    // Discriminant: q(v)² − 4·p(v)·r(v)
    discriminant = ComplexPolynomialNullaryFunction.express("D:Q()² − 4·P()·R()", context);

    // Declare the Müntz coefficient sequence
    ComplexFunctionSequence.declare("a", context);

    // Compile the full recurrence
    a = ComplexPolynomialSequence.express("a:k➔v➔when(k=1,p/Γ(μ+1),else,(Γ((k-1)*μ+1)/Γ(k*μ+1))*(q*a(k-1)(v)+r*∑j➔a(j)(v)*a(k-1-j)(v){j=1..k-2}))",
                                          context);
  }

  /**
   * Build w(t;v) = ∂y/∂v as a {@link MuntzPadeFunctional}.
   *
   * FIXME: theres prolly a better way to do this
   * <p>
   * p, q, r are polynomial variables in {@link #context}. Their v-derivatives are
   * obtained via {@link ComplexPolynomial#derivative()}, then registered as
   * variables p_dv, q_dv, r_dv for use in the f, g, w recurrence expressions.
   * </p>
   */
  private ComplexFunctional partialDerivativeWithRespectToV()
  {
    // Register derivatives as variables in context
    context.registerVariable(p.derivative().setName("pdv"));
    context.registerVariable(q.derivative().setName("qdv"));
    context.registerVariable(r.derivative().setName("rdv"));

    // Forward-declare w so its self-reference resolves
    ComplexFunctionSequence.declare("w", context);

    // f(k)(v) : k=0 → ṗ(v); k≥1 → q̇(v)·a(k)(v) + ṙ(v)·Σ_{j=1..k-1}
    // a(j)(v)·a(k-j)(v)
    ComplexFunctionSequence.compile("f:k➔v➔when(k=0,pdv(v),else,qdv(v)*a(k)(v)+rdv(v)*∑j➔a(j)(v)*a(k-j)(v){j=1..k-1}", context);

    // g(k)(v) : k=0 → q(v); k≥1 → 2·r(v)·a(k)(v)
    ComplexFunctionSequence.compile("g:k➔v➔when(k=0,q(v),else,2*r(v)*a(k)(v))", context);

    ComplexFunctionSequence.compile("h:k➔v➔(Γ((k-1)*μ+1)/Γ(k*μ+1))*(f(k-1)(v)+∑j➔g(k-2-j)(v)*w(j+1)(v){j=0..k-2})", context);
    // w(k)(v) linear Volterra recurrence
    var w = ComplexPolynomialSequence.express("w:k➔v➔when(k=1,pdv(v)/Γ(μ+1),else,h(k,v))", context);

    return new MuntzPadeFunctional("∂y/∂v",
                                   α,
                                   w);
  }

  /**
   ** Register fractional order μ
   * 
   * @param context
   * @param α
   */
  private void initializeFractionalExponent(Context context, Real α)
  {
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

  }

  @SuppressWarnings("resource")
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
  public void refreshPolynomials(int bits)
  {
    P.evaluate(bits, p);
    Q.evaluate(bits, q);
    R.evaluate(bits, r);
    discriminant(bits, d);
  }

  int bits = 128;

  @Override
  public void invalidateCache()
  {
    refreshPolynomials(bits);
    super.invalidateCache();
  }

  public ComplexPolynomialSequence muntzBasis()
  {
    return a;
  }

  public ComplexPolynomial discriminant(int bits, ComplexPolynomial res)
  {
    return discriminant.evaluate(bits, res);
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