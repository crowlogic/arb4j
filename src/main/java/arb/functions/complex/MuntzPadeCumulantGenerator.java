package arb.functions.complex;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.*;

/**
 * General Müntz-lattice cumulant generating function (CGF) built from a
 * fractional Riccati solution.
 *
 * <h2>Mathematical setting</h2>
 *
 * Given a fractional Riccati equation
 *
 * <pre>
 *   D^μ h(v,t) = P(v) + Q(v) h(v,t) + R h(v,t)²,    I^{1−μ} h(v,0) = 0,
 * </pre>
 *
 * whose Müntz expansion on its disk of convergence is
 *
 * <pre>
 *   h(v,t) = Σ_{k≥1} aₖ(v) t^{kμ},
 * </pre>
 *
 * the cumulant generating function associated with the affine Volterra model
 * driving the Riccati is built from term-by-term Müntz integration. For an
 * application that combines an ordinary and a fractional-order time integral of
 * {@code h}, the result lives on the common lattice {T^{kμ+1}} and takes the
 * form
 *
 * <pre>
 *   Φ(v,T) = Σ_{k≥0} d_k(v) · T^{kμ+1},
 *   d_k(v) = u_k · a_k(v) + w_k · a_{k+1}(v),
 * </pre>
 *
 * where {@code (u_k, w_k)} are application-supplied scalar weights derived from
 * the moment-generating structure of the underlying model (e.g. (θλ,
 * V0)-weighted ordinary and fractional integrals for rough Heston; different
 * weights for other affine Volterra processes), {@code a₀(v) := 0}, and a is
 * the Müntz coefficient sequence produced by a Riccati solver such as
 * {@link RiccatiMuntzPadeFunctional}.
 *
 * <h2>What this class provides</h2>
 *
 * Given (α, a, u, w, N) it compiles
 *
 * <pre>
 *   d : k ➔ v ➔ u(k) · a(k)(v) + w(k) · a(k+1)(v)
 *   Φ : v   ➔ Σk➔d(k)(v) · T^(k*μ+1)  {k = 0..N}
 * </pre>
 *
 * as registered expressions in a shared {@link Context}. Callers evaluate
 * {@code φ(v)} for any {@code v} after registering {@code T} (and N) in the
 * context. {@code N} is an {@code Integer} so the live truncation order flows
 * into the compiled Σ without recompile.
 *
 * <p>
 * Use this class as the general arb4j entry point for any application that
 * needs the cumulant Müntz expansion of an affine Volterra / fractional Riccati
 * system. The rough-Heston application is one instance: pick its (u, w) and the
 * resulting Φ matches Equation (...) of the rough-Heston CGF derivation. Other
 * affine Volterra processes plug in their own weights.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("unchecked")
public class MuntzPadeCumulantGenerator implements
                                        ComplexFunction,
                                        AutoCloseable
{

  /**
   * Fractional Müntz exponent μ ∈ (0, 1). Read from the context as variable
   * {@code μ}.
   */
  public final Real                      μ;

  /** Maturity T > 0. Read from the context as variable {@code T}. */
  public final Real                      T;

  /**
   * Truncation order N for the CGF series. The compiled Σ uses this as its upper
   * bound; mutate via {@link #setN} to change the truncation without recompile.
   */
  public final Integer                   N;

  /** The Müntz coefficient sequence aₖ(v) supplied at construction. */
  public final ComplexPolynomialSequence a;

  /** Ordinary-integral weight sequence uₖ supplied at construction. */
  public final RealSequence              u;

  /** Fractional-integral weight sequence wₖ supplied at construction. */
  public final RealSequence              w;

  /** The Context wiring α, T, N, a, u, w. */
  public final Context                   context;

  /**
   * Compiled consolidated coefficient sequence:
   *
   * <pre>
   *   d : k ➔ v ➔ u(k) · a(k)(v) + w(k) · a(k+1)(v)
   * </pre>
   *
   * with the convention a(0)(v) := 0 enforced via
   * {@code when(k=0, w(0)·a(1)(v), else, …)}.
   */
  public final ComplexPolynomialSequence d;

  /**
   * Compiled cumulant generating function (the closed-form expression):
   *
   * <pre>
   *   Φ(v, T) = Σ_{k=0..N} d(k)(v) · T^(k·μ + 1)
   * </pre>
   *
   * Evaluating this directly resums every term from k=0 to N. Prefer
   * {@link #evaluate} for adaptive growth, which uses {@link #term} to add one
   * term per step instead of resumming.
   */
  public final ComplexFunction           Φ;

  /**
   * Compiled single-term sequence:
   *
   * <pre>
   *   term : k ➔ v ➔ d(k)(v) · T^(k·μ + 1)
   * </pre>
   *
   * Used by {@link #evaluate} for incremental accumulation: at adaptive step n,
   * the running partial sum gets {@code term(n)(v)} added rather than the whole
   * {@code Φ_n} being recomputed.
   */
  public final ComplexFunctionSequence   term;

  /**
   * Build a Müntz-lattice CGF from the Riccati Müntz coefficients and
   * application-supplied lattice weights.
   *
   * @param context the shared expression context. Must already register {@code μ}
   *                (Real, fractional exponent) and {@code T} (Real, maturity).
   *                Sequences {@code a}, {@code u}, {@code w} are registered into
   *                the context by this constructor.
   * @param a       Müntz coefficient sequence k ↦ a_k(v), e.g. the {@code a} from
   *                a {@link RiccatiMuntzPadeFunctional}.
   * @param u       ordinary-integral weight sequence k ↦ u_k (scalars).
   * @param w       fractional-integral weight sequence k ↦ w_k (scalars).
   * @param N0      initial truncation order. Mutate via {@link #setN}.
   */
  public MuntzPadeCumulantGenerator(Context context, ComplexPolynomialSequence a, RealSequence u, RealSequence w, int N0)
  {
    if (context == null)
      throw new IllegalArgumentException("context must not be null");
    this.context = context;
    this.a       = a;
    this.u       = u;
    this.w       = w;

    Real μFromCtx = context.getVariable("μ");
    if (μFromCtx == null)
      throw new IllegalArgumentException("Context must register variable 'μ' before constructing MuntzPadeCumulantGenerator");
    this.μ = μFromCtx;

    Real TFromCtx = context.getVariable("T");
    if (TFromCtx == null)
      throw new IllegalArgumentException("Context must register variable 'T' before constructing MuntzPadeCumulantGenerator");
    this.T = TFromCtx;

    this.N = Integer.named("N");
    this.N.set(N0);
    if (context.getVariable("N") == null)
      context.registerVariable(N);

    if (context.getFunction("a") == null)
      context.registerFunction("a", a);
    if (context.getFunction("u") == null)
      context.registerFunction("u", u);
    if (context.getFunction("w") == null)
      context.registerFunction("w", w);

    // Consolidated coefficient sequence with a(0):=0 enforced via the when().
    // when(k=0, w(0)*a(1)(v), else, u(k)*a(k)(v)+w(k)*a(k+1)(v))
    this.d    = ComplexPolynomialSequence.express("d:k➔v➔when(k=0,w(0)*a(1)(v),else,u(k)*a(k)(v)+w(k)*a(k+1)(v))", context);

    // Single-term sequence for incremental accumulation in adaptive evaluate().
    this.term = ComplexFunctionSequence.express("term:k➔v➔d(k)(v)*T^(k*μ+1)", context);

    // Closed-form (fixed-N) alternative compiled under the name ΦClosed so that
    // the adaptive `this` instance can claim the name `Φ` in the context —
    // letting downstream expressions like φ:v➔exp(Φ(v)) dispatch to the
    // adaptive evaluate().
    this.Φ    = ComplexFunction.express("ΦClosed:v➔Σk➔d(k)(v)*T^(k*μ+1){k=0..N}", context);

    // Register THIS instance under Φ so downstream compiled expressions that
    // reference Φ(v) hit the adaptive incremental evaluate().
    context.registerFunction("Φ", this);
  }

  private final Real              threshold = new Real();
  private final Real              addMag    = new Real();
  private final Real              bestMag   = new Real();
  private final Real              expo      = new Real();
  private final Real              tpow      = new Real();
  private final Complex           sum       = new Complex();
  private final Complex           addition  = new Complex();
  private final Complex           best      = new Complex();
  private final ComplexPolynomial dk        = new ComplexPolynomial();
  private final Integer           kIdx      = new Integer();

  @Override
  public Complex evaluate(Complex v, int order, int bits, Complex res)
  {
    threshold.one().mul2e(-bits / 2, threshold);
    bestMag.posInf();
    sum.zero();

    for (int n = 0; true; n++)
    {
      kIdx.set(n);
      d.evaluate(kIdx, 1, bits, dk);
      dk.evaluate(v, 1, bits, addition);
      μ.mul(n, bits, expo).add(1, bits, expo);
      T.pow(expo, bits, tpow);
      addition.mul(tpow, bits, addition);
      sum.add(addition, bits, sum);
      addition.abs(bits, addMag);

      if (n == 0)
      {
        best.set(sum);
        continue;
      }
      if (addMag.compareTo(threshold) <= 0)
      {
        return res.set(sum);
      }
      if (addMag.compareTo(bestMag) < 0)
      {
        bestMag.set(addMag);
        best.set(sum);
      }
      else
      {
        return res.set(best);
      }
    }
  }

  @Override
  public Class<Complex> domainType()
  {
    return Complex.class;
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public void close()
  {
    if (Φ != null)
      Φ.close();
    if (d != null)
      d.close();
    if (N != null)
      N.close();
    threshold.close();
    addMag.close();
    bestMag.close();
    expo.close();
    tpow.close();
    sum.close();
    addition.close();
    best.close();
    dk.close();
    kIdx.close();
  }
}
