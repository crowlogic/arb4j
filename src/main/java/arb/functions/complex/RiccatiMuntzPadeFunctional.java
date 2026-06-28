package arb.functions.complex;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.ComplexFunctional;
import arb.functions.Function;
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

  private static final class Prototype
  {
    final Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> p;
    final Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> q;
    final Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> r;
    final Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> discriminant;
    final Expression<arb.Integer, ComplexPolynomial, ComplexPolynomialSequence> a;

    Prototype(Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> p,
              Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> q,
              Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> r,
              Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> discriminant,
              Expression<arb.Integer, ComplexPolynomial, ComplexPolynomialSequence> a)
    {
      this.p = p;
      this.q = q;
      this.r = r;
      this.discriminant = discriminant;
      this.a = a;
    }
  }

  private static final Map<String, Prototype> prototypes = new ConcurrentHashMap<>();

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

    // Allocate polynomial variables once, register in context.
    // Guard with getVariable so that if the caller's context already has p, q,
    // or r bound (e.g. a ComplexPolynomial registered upstream), we reuse the
    // existing instance rather than throwing CompilerException on re-registration.
    // refreshPolynomials will immediately overwrite the content in either case.
    context.registerVariable(p = ComplexPolynomial.named("p"));

    context.registerVariable(q = ComplexPolynomial.named("q"));

    context.registerVariable(r = ComplexPolynomial.named("r"));

    // Discriminant: q(v)² − 4·p(v)·r(v)
    discriminant = ComplexPolynomialNullaryFunction.express("D:Q()² − 4·P()·R()", context);

    // Declare the Müntz coefficient sequence
    ComplexFunctionSequence.declare("a", context);

    // Compile the full recurrence. p(v), q(v), r(v) use the
    // variable-as-function call bridge: p, q, r are ComplexPolynomial
    // variables registered in context whose runtime class implements
    // ComplexFunction
    a = ComplexPolynomialSequence.express("a:k➔v➔when(k=1,p(v)/Γ(μ+1),else,(Γ((k-1)*μ+1)/Γ(k*μ+1))*(q(v)*a(k-1)(v)+r(v)*∑j➔a(j)(v)*a(k-1-j)(v){j=1..k-2}))",
                                          context);

    // Issue #1014/#1015: prime the polynomial coefficient variables p, q, r
    // by evaluating the user-supplied nullary functions P, Q, R into them so
    // the recurrence has live operands on first use. Without this, the
    // expression body's references to p, q, r see the freshly-allocated
    // (length-0) polynomials registered above and the entire aₖ(v) sequence
    // evaluates to the zero polynomial. invalidateCache() repeats this whenever
    // the caller signals a parameter change, but the very first evaluate must
    // also see populated p, q, r — hence the eager refresh at construction.
    refreshPolynomials(bits);
  }

  private static Prototype prototype(String pExpr, String qExpr, String rExpr)
  {
    return prototypes.computeIfAbsent(pExpr + "\u0000" + qExpr + "\u0000" + rExpr,
                                      ignored ->
                                      {
                                        Context prototypeContext = new Context().disableLommelPolynomials();
                                        prototypeContext.registerVariable(ComplexPolynomial.named("p"));
                                        prototypeContext.registerVariable(ComplexPolynomial.named("q"));
                                        prototypeContext.registerVariable(ComplexPolynomial.named("r"));
                                        Real μ = new Real();
                                        μ.setName("μ");
                                        prototypeContext.registerVariable(μ);

                                        Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> pExpression =
                                            (Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction>) Function.parseAndRegister(pExpr,
                                                                                                                                                                        prototypeContext,
                                                                                                                                                                        Object.class,
                                                                                                                                                                        ComplexPolynomial.class,
                                                                                                                                                                        ComplexPolynomialNullaryFunction.class,
                                                                                                                                                                        "P",
                                                                                                                                                                        true);
                                        pExpression.compile();

                                        Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> qExpression =
                                            (Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction>) Function.parseAndRegister(qExpr,
                                                                                                                                                                        prototypeContext,
                                                                                                                                                                        Object.class,
                                                                                                                                                                        ComplexPolynomial.class,
                                                                                                                                                                        ComplexPolynomialNullaryFunction.class,
                                                                                                                                                                        "Q",
                                                                                                                                                                        true);
                                        qExpression.compile();

                                        Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> rExpression =
                                            (Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction>) Function.parseAndRegister(rExpr,
                                                                                                                                                                        prototypeContext,
                                                                                                                                                                        Object.class,
                                                                                                                                                                        ComplexPolynomial.class,
                                                                                                                                                                        ComplexPolynomialNullaryFunction.class,
                                                                                                                                                                        "R",
                                                                                                                                                                        true);
                                        rExpression.compile();

                                        ComplexFunctionSequence.declare("a", prototypeContext);
                                        Expression<arb.Integer, ComplexPolynomial, ComplexPolynomialSequence> aExpression =
                                            (Expression<arb.Integer, ComplexPolynomial, ComplexPolynomialSequence>) Function.parseAndRegister("a:k➔v➔when(k=1,p(v)/Γ(μ+1),else,(Γ((k-1)*μ+1)/Γ(k*μ+1))*(q(v)*a(k-1)(v)+r(v)*∑j➔a(j)(v)*a(k-1-j)(v){j=1..k-2}))",
                                                                                                                                                                        prototypeContext,
                                                                                                                                                                        arb.Integer.class,
                                                                                                                                                                        ComplexPolynomial.class,
                                                                                                                                                                        ComplexPolynomialSequence.class,
                                                                                                                                                                        "a",
                                                                                                                                                                        true);
                                        aExpression.compile();

                                        Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> discriminantExpression =
                                            (Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction>) Function.parseAndRegister("D:Q()² − 4·P()·R()",
                                                                                                                                                                        prototypeContext,
                                                                                                                                                                        Object.class,
                                                                                                                                                                        ComplexPolynomial.class,
                                                                                                                                                                        ComplexPolynomialNullaryFunction.class,
                                                                                                                                                                        "D",
                                                                                                                                                                        true);
                                        discriminantExpression.compile();

                                        return new Prototype(pExpression, qExpression, rExpression, discriminantExpression, aExpression);
                                      });
  }

  private static <D, C, F extends Function<? extends D, ? extends C>> F instantiatePrototype(Expression<D, C, F> expression, Context context)
  {
    F instance = expression.instantiate();
    context.injectReferences(instance);
    return instance;
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
  // Settable seed coefficients ṗ=∂p/∂var, q̇=∂q/∂var, ṙ=∂r/∂var, and the linear
  // Volterra recurrence for ∂a/∂var built once over them. The recurrence is the
  // same for every variable; only the three seeds change, so they are refreshed
  // per variable exactly the way p, q, r are refreshed from P, Q, R.
  private ComplexPolynomial         pdv, qdv, rdv;
  private ComplexPolynomialSequence dyByVar;
  // ∂P/∂var, ∂Q/∂var, ∂R/∂var are fixed expressions per variable — only the
  // values they evaluate to change as parameters change. Compile each once and
  // cache it; recompiling per call loads a fresh class every time and exhausts
  // the heap under a calibration that re-seeds thousands of times.
  private final Map<String, ComplexPolynomialNullaryFunction> dP = new HashMap<>();
  private final Map<String, ComplexPolynomialNullaryFunction> dQ = new HashMap<>();
  private final Map<String, ComplexPolynomialNullaryFunction> dR = new HashMap<>();

  private void ensureDerivativeRecurrence()
  {
    if (dyByVar != null)
      return;
    context.registerVariable(pdv = ComplexPolynomial.named("pdv"));
    context.registerVariable(qdv = ComplexPolynomial.named("qdv"));
    context.registerVariable(rdv = ComplexPolynomial.named("rdv"));
    // ∂a/∂var is its own self-referential Müntz sequence, the linearisation of
    // the a-recurrence: da₁ = ṗ/Γ(μ+1), and for k≥2
    //   daₖ = γₖ( q̇·aₖ₋₁ + q·daₖ₋₁ + ṙ·Σ aⱼaₖ₋₁₋ⱼ + r·Σ(daⱼ·aₖ₋₁₋ⱼ + aⱼ·daₖ₋₁₋ⱼ) ),
    // γₖ = Γ((k-1)μ+1)/Γ(kμ+1). Same shape as a; expressed once, self-reference
    // resolved by the compiler exactly as for a.
    dyByVar = ComplexPolynomialSequence.express("da:k➔v➔when(k=1,pdv(v)/Γ(μ+1),else,(Γ((k-1)*μ+1)/Γ(k*μ+1))*(qdv(v)*a(k-1)(v)+q(v)*da(k-1)(v)+rdv(v)*∑j➔a(j)(v)*a(k-1-j)(v){j=1..k-2}+r(v)*∑j➔(da(j)(v)*a(k-1-j)(v)+a(j)(v)*da(k-1-j)(v)){j=1..k-2}))",
                                                context);
  }

  /**
   * The Müntz sequence ∂a(k,·)/∂var for var ∈ {v, λ, ν, ρ}, by differentiating
   * the Riccati recurrence. The linear Volterra recurrence is identical to the
   * v-derivative; only the seed coefficients ∂p/∂var, ∂q/∂var, ∂r/∂var differ,
   * and those are obtained automatically by differentiating the coefficient
   * expressions P, Q, R with respect to var. (μ is excluded: it also enters the
   * Γ-ratios, contributing digamma terms.)
   */
  public ComplexPolynomialSequence parameterDerivative(String var, int bits)
  {
    ensureDerivativeRecurrence();
    dP.computeIfAbsent(var, v -> P.derivative(v)).evaluate(bits, pdv);
    dQ.computeIfAbsent(var, v -> Q.derivative(v)).evaluate(bits, qdv);
    dR.computeIfAbsent(var, v -> R.derivative(v)).evaluate(bits, rdv);
    dyByVar.invalidateCache();
    return dyByVar;
  }

  private ComplexFunctional partialDerivativeWithRespectToV()
  {
    return new MuntzPadeFunctional("∂y/∂v", α, parameterDerivative("v", bits));
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

  // Use the given Context's own lazily-created ExpressionClassLoader; never
  // point context.classLoader at a shared/static loader. Context↔ClassLoader is
  // 1:1, so aliasing one loader across distinct Contexts merges their class
  // space and injected native references — unsound once any is closed (#1073).
  private RiccatiMuntzPadeFunctional(Context context, Real μ, Prototype prototype)
  {
    this.context = context.disableLommelPolynomials();
    initializeFractionalExponent(context, μ);

    // Allocate polynomial variables once, register in context.
    context.registerVariable(p = ComplexPolynomial.named("p"));
    context.registerVariable(q = ComplexPolynomial.named("q"));
    context.registerVariable(r = ComplexPolynomial.named("r"));

    this.P = instantiatePrototype(prototype.p, context);
    this.Q = instantiatePrototype(prototype.q, context);
    this.R = instantiatePrototype(prototype.r, context);
    this.discriminant = instantiatePrototype(prototype.discriminant, context);
    this.a = instantiatePrototype(prototype.a, context);

    refreshPolynomials(bits);
  }

  public RiccatiMuntzPadeFunctional(Context context, Real μ, String pExpr, String qExpr, String rExpr)
  {
    this(context, μ, prototype(pExpr, qExpr, rExpr));
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
