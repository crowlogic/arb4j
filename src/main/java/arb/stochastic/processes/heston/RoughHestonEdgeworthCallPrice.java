package arb.stochastic.processes.heston;

import arb.Complex;
import arb.ComplexConstants;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.integer.RealFunctionSequence;
import arb.functions.integer.RealSequence;
import arb.functions.polynomials.orthogonal.real.ProbabilistHermitePolynomials;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * European call price under the rough Heston model via the Edgeworth expansion
 * of the log-price density around the matching Gaussian, with the
 * Hermite-basis weights c(n) built by the Blinnikov–Moessner recurrence.
 * Closed-form, exact-symbolic {@link Real} arithmetic — no FFT, no
 * Carr–Madan / Lewis quadrature, no damping parameters, no integer-partition
 * enumeration.
 *
 * <h2>Structure: expressions all the way down</h2>
 *
 * The price is the pairing of two discrete-index sequences of expressions:
 *
 * <ol>
 * <li><b>n ↦ ψₙ</b> — the probabilist Hermite polynomials, registered as
 * {@code He} in the pricing context. Each ψₙ is a polynomial expression;
 * it takes no particular value of its argument until a compiled expression
 * finally applies it.</li>
 * <li><b>n ↦ c(n)</b> — the Edgeworth weights, a compiled {@link RealSequence}
 * over the standardized cumulants S(k), which read the cumulants κ(m) off the
 * cumulant generating polynomial Φ as point-derivatives
 * ({@link RoughHestonCumulantSequence}).</li>
 * </ol>
 *
 * Both factors cache only along their discrete order index — the derivative
 * chain of Φ per parameter set, the recurrence tables of {@code He} and
 * {@code c} per order. Nothing is ever keyed by a point of the continuum;
 * evaluation at any log-moneyness k runs the compiled expressions fresh.
 *
 * <h2>Cumulants from the Müntz–Padé d-sequence</h2>
 *
 * The cumulant generating polynomial is the single ring-level convergent sum
 *
 * <pre>
 *   Φ = Σ_{k=0..∞} T^(k·μ+1) · d(k)
 * </pre>
 *
 * of the coefficient polynomials d(k) supplied by
 * {@link arb.functions.complex.MuntzPadeCumulantGenerator}, terminating when
 * the summand's norm falls to the 2^-bits precision floor — the Müntz order is
 * whatever the convergence of the series delivers at the working precision,
 * never a fixed ceiling — and the cumulants
 * are the point-derivatives κ_m = Re((−ⅈ)^m · Φ^{(m)}(0)) — no coefficient
 * access. Every step — κ, the matching Gaussian mean/variance/stdev, the
 * standardized cumulants S(k), the weights c(n), and the price Π(k) — is a
 * compiled {@link RealSequence} or {@link RealFunction}. No Java loops, no
 * manual cumulant book-keeping, no Real vectors.
 *
 * <h2>Convergence</h2>
 *
 * The compiled price partial sum is
 *
 * <pre>
 *   Π_J(k) = GBS(k) + S0 · Σ_{j=3..J} c(j) · ΔCseq(j)(k)
 * </pre>
 *
 * and {@link #call(Real, int, Real)} grows the order J by one each iteration
 * (the c(n) it sums are J-independent, so no invalidation is needed),
 * returning the partial sum as soon as consecutive partial sums agree within
 * {@code 2^(-bits/2)}, otherwise the partial sum at the globally smallest
 * consecutive gap. The order at which that happens depends on the parameter
 * point and the strike — different points of the parameter space require
 * different numbers of basis functions for a given number of bits at a given
 * point, and that is exactly how the expansion is expected to work.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonEdgeworthCallPrice implements
                                            RealFunction,
                                            AutoCloseable
{
  private static final Logger                    log            = LoggerFactory.getLogger(RoughHestonEdgeworthCallPrice.class);

  private static final String                    DEFAULT_S0     = "1.0";
  private static final String                    DEFAULT_K      = "1.0";
  private static final String                    DEFAULT_rr     = "0.0";

  /** Underlying CGF (and Müntz–Padé d-sequence via {@code φ.cgf.d}). */
  public final RoughHestonCharacteristicFunction φ;

  /** Spot price. */
  public final Real                              S0;

  /** Strike (log-moneyness driver). */
  public final Real                              K;

  /** Risk-free rate. */
  public final Real                              rr;

  /** Cumulant sequence κ(m) — point-derivatives of Φ at the origin. */
  public RealSequence                            κ;

  /** Standardized cumulant S(k) = κ(k) / (stdev()^k · Γ(k+1)). */
  public RealSequence                            S;

  /** Edgeworth weight c(n) — Blinnikov–Moessner recurrence. */
  public RealSequence                            c;

  /** mean() := κ(1) — nullary compiled scalar. */
  public RealNullaryFunction                     mScalar;

  /** variance() := κ(2). */
  public RealNullaryFunction                     σ2Scalar;

  /** stdev() := √κ(2). */
  public RealNullaryFunction                     σScalar;

  /**
   * Probabilist Hermite polynomials ψₙ — the polynomial-valued basis sequence,
   * registered as {@code He} in the pricing context. Expressions, not values.
   */
  public final ProbabilistHermitePolynomials     He;

  /** Hermite density-correction sequence ΔCseq(j)(k). */
  public RealFunctionSequence                    ΔCseq;

  /**
   * The compiled price partial sum: k (log-moneyness) → Π_J(k), a plain
   * {@code Σ{j=3..J}} pairing of c(j) with ΔCseq(j)(k) over the GBS leading
   * term. {@link #call} accumulates it over increasing {@link #J}.
   */
  public RealFunction                            Π;

  /**
   * Edgeworth–Hermite order J of the compiled partial sum — an
   * {@code arb.Integer} so the live order flows into the price chain without
   * recompile.
   */
  public final Integer                           J = Integer.named("J").set(3);

  /** Leading (Black–Scholes) call value C(k) of the price, as a callable function. */
  public RealFunction                            blackScholes;

  /** Dedicated pricing-side Context. */
  public final Context                           pricingContext;

  private final boolean                          ownsParameters;

  private Real                                   kLog;

  // ─────────────────────────────────────────────────────────────────────
  // Constructors
  // ─────────────────────────────────────────────────────────────────────

  /** No-arg / JShell-friendly: internally-owned CGF at default parameters. */
  public RoughHestonEdgeworthCallPrice()
  {
    this(ComplexConstants.zero);
  }

  public RoughHestonEdgeworthCallPrice(Complex v)
  {
    this.φ = new RoughHestonCharacteristicFunction(v);

    this.S0             = new Real(DEFAULT_S0, 128).setName("S0");
    this.rr             = new Real(DEFAULT_rr, 128).setName("rr");
    this.K              = new Real(DEFAULT_K, 128);

    this.He             = new ProbabilistHermitePolynomials(128);

    this.pricingContext = buildPricingContext();
    compileCumulantAndPriceChain();
    this.ownsParameters = true;
  }

  /** Context-based: composes into an outer model context. */
  public RoughHestonEdgeworthCallPrice(Context context, Real K, Complex v)
  {
    if (context == null)
      throw new IllegalArgumentException("context must not be null");
    if (K == null)
      throw new IllegalArgumentException("K must not be null");

    this.φ = new RoughHestonCharacteristicFunction(context, v);

    this.S0             = required(context, "S0");
    this.rr             = required(context, "rr");
    this.K              = K;

    this.He             = new ProbabilistHermitePolynomials(128);

    this.pricingContext = buildPricingContext();
    compileCumulantAndPriceChain();
    this.ownsParameters = false;
  }

  /**
   * Compile the cumulants and the Edgeworth price. Each expression is compiled
   * exactly once and shared by reference through the pricing context.
   */
  private void compileCumulantAndPriceChain()
  {
    // CGF polynomial Φ = Σ_k T^{kμ+1}·d(k) — a single ring-level convergent
    // sum of the coefficient polynomials, terminating when the summand's norm
    // falls to the 2^-bits precision floor: the Müntz order is whatever the
    // convergence of the series delivers at the working precision — there is
    // no fixed ceiling. The cumulants are read off as the point-derivatives
    // κ_m = Re((−i)^m·Φ^{(m)}(0)) — no coefficient access (#1022).
    ComplexPolynomialNullaryFunction Φ = ComplexPolynomialNullaryFunction.express("Φ",
                                                                                  "Σk➔T^(k*μ+1)*d(k){k=0..∞}",
                                                                                  pricingContext);
    this.κ = new RoughHestonCumulantSequence(Φ);
    pricingContext.registerFunction("κ", κ);
    this.mScalar  = RealNullaryFunction.express("mean", "κ(1)", pricingContext);
    this.σ2Scalar = RealNullaryFunction.express("variance", "κ(2)", pricingContext);
    this.σScalar  = RealNullaryFunction.express("stdev", "sqrt(κ(2))", pricingContext);
    this.S        = RealSequence.express("S", "k➔κ(k)/(stdev()^k*Γ(k+1))", pricingContext);
    this.c        = RealSequence.express("c",
                                         "n➔when(n=0,1,n<3,0,else,(1/n)*Σk➔k*S(k)*c(n-k){k=3..n})",
                                         pricingContext);
    this.Π            = compilePriceExpression(pricingContext);
    this.blackScholes = RealFunction.express("C:k➔GBS(k)", pricingContext);
  }

  /**
   * Build the dedicated pricing context. Imports d, T, μ, N from {@link #φ}.
   * Each price owns its own Context, which lazily creates its own isolated
   * ExpressionClassLoader (Context.getClassLoader) — no shared/static loader
   * (issue #1073).
   */
  private Context buildPricingContext()
  {
    Context ctx = new Context();
    ctx.registerVariable(J);
    ctx.registerVariable(S0);
    ctx.registerVariable(rr);
    ctx.registerVariable(φ.T);
    ctx.registerVariable(φ.μ);
    ctx.registerFunction("He", He);
    ctx.registerFunction("d", φ.cgf.d);
    return ctx;
  }

  /** Compile the Edgeworth call-price formula in {@code context}. */
  private RealFunction compilePriceExpression(Context context)
  {
    RealFunction.express("zStar:k➔(k-rr*T-mean())/stdev()", context);
    RealFunction.express("zσ:k➔((k-rr*T-mean())/stdev())-stdev()", context);
    RealFunction.express("d1:k➔(-k+rr*T+mean()+variance())/stdev()", context);
    RealFunction.express("d2:k➔((-k+rr*T+mean()+variance())/stdev())-stdev()", context);
    RealFunction.express("nGauss:x➔exp((-x²)/2)/sqrt(2*π)", context);
    RealFunction.express("NCDF:x➔½*erfc((-x)/sqrt(2))", context);
    RealFunction.express("GBS:k➔S0*exp(mean()+variance()/2)*NCDF(d1(k))-S0*exp(k-rr*T)*NCDF(d2(k))", context);
    RealFunctionSequence.express("hermiteOne:j➔k➔nGauss(zStar(k))*He(j-1)(zStar(k))", context);
    this.ΔCseq = RealFunctionSequence.express("ΔCseq:j➔k➔exp(mean()+variance()/2)*Σi➔((Γ(j+1)/(Γ(i+1)*Γ(j-i+1)))*stdev()^(j-i)*"
                                              + "when(i=0,NCDF(-zσ(k)),else,nGauss(zσ(k))*He(i-1)(zσ(k)))){i=0..j}-exp(k-rr*T)*hermiteOne(j)(k)",
                                              context);
    // The compiled partial sum Π_J; call accumulates it over increasing J,
    // stopping at the order where the expansion has delivered the answer.
    return RealFunction.express("Π:k➔GBS(k)+S0*Σj➔(c(j)*ΔCseq(j)(k)){j=3..J}", context);
  }

  private static Real required(Context ctx, String name)
  {
    Real v = ctx.getVariable(name);
    if (v == null)
      throw new IllegalArgumentException("Context is missing required Real variable " + name);
    return v;
  }

  // ─────────────────────────────────────────────────────────────────────
  // Evaluation
  // ─────────────────────────────────────────────────────────────────────

  /**
   * The price as a function of log-moneyness k = log(K/S0): accumulates the
   * compiled partial sums Π_J at k exactly as {@link #call(Real, int, Real)}
   * does.
   */
  @Override
  public Real evaluate(Real k, int order, int bits, Real res)
  {
    return accumulate(k, bits, res);
  }

  /** Price the call at the strike {@link #K}. */
  public Real call(int bits, Real dst)
  {
    return call(K, bits, dst);
  }

  /**
   * Price the call at {@code strike}: forms k = log(strike/S0) and accumulates
   * the compiled partial sums Π_J there over increasing J. Returns {@code dst}
   * as soon as consecutive partial sums agree to within {@code 2^(-bits/2)};
   * otherwise the order J grows until the expansion itself stops delivering —
   * either the consecutive gap has blown past the smallest gap seen (the series
   * is asymptotic: beyond its optimal truncation point the corrections grow
   * without bound, and once the gap exceeds the best by 2^16 the optimum is
   * conclusively behind), or J has consumed every cumulant the degree of Φ
   * holds. In both cases the partial sum at the globally smallest consecutive
   * gap is returned — the order at which the expansion has delivered the
   * answer, whose distance from the sum is bounded by the magnitude of the
   * first further term. There is no fixed ceiling on J. (The gap sequence need
   * not shrink monotonically — the Edgeworth corrections arrive in odd/even
   * bursts — so the minimum is tracked globally rather than stopping at the
   * first non-improvement.)
   */
  public Real call(Real strike, int bits, Real dst)
  {
    if (kLog == null)
      kLog = new Real();
    strike.div(S0, bits, kLog).log(bits, kLog);
    return accumulate(kLog, bits, dst);
  }

  private Real accumulate(Real k, int bits, Real dst)
  {
    try ( Real previous = new Real(); Real current = new Real(); Real gap = new Real(); Real bestGap = new Real();
          Real threshold = new Real(); Real divergence = new Real())
    {
      threshold.one().mul2e(-bits / 2);
      J.set(3);
      Π.evaluate(k, 1, bits, previous);
      dst.set(previous);
      bestGap.posInf();
      // Every cumulant Φ holds: κ(m) = Φ^{(m)}(0) vanishes identically beyond
      // deg Φ, so orders past it add no information. This is the structural
      // content of the expansion, not a tuning knob.
      int maxOrder = ((RoughHestonCumulantSequence) κ).availableOrder(bits);
      int bestJ    = 3;
      for (int j = 4; j <= maxOrder; j++)
      {
        J.set(j);
        Π.evaluate(k, 1, bits, current);
        current.sub(previous, bits, gap).abs();
        log.debug("accumulate k={} J={} Π={} gap={}", k, j, current, gap);
        if (gap.compareTo(threshold) <= 0)
        {
          log.debug("accumulate k={} converged at J={} gap={} ≤ 2^-{}", k, j, gap, bits / 2);
          return dst.set(current);
        }
        if (gap.compareTo(bestGap) < 0)
        {
          bestGap.set(gap);
          bestJ = j;
          dst.set(current);
        }
        else
        {
          // Past the optimal truncation point the asymptotic corrections grow
          // without bound; once the gap has blown 2^16 past the best, the
          // optimum is conclusively behind and further orders only diverge.
          bestGap.mul2e(16, divergence);
          if (gap.compareTo(divergence) > 0)
          {
            log.debug("accumulate k={} divergence exit at J={} (bestJ={} bestGap={})", k, j, bestJ, bestGap);
            return dst;
          }
        }
        previous.set(current);
      }
      log.debug("accumulate k={} exhausted maxOrder={} (bestJ={} bestGap={})", k, maxOrder, bestJ, bestGap);
      return dst;
    }
  }

  /**
   * Refresh every parameter-dependent cache after a model-parameter or
   * maturity mutation (λ, θ, ν, V0, ρ, μ, T): the Riccati coefficient
   * polynomials p, q, r and the Müntz coefficient chain, the d-sequence, and
   * both contexts' per-index expression caches (the cumulant chain Φ/κ, the
   * standardized cumulants S, the weights c, and every compiled helper). Call
   * once after each parameter set change, before the next {@link #call}.
   */
  public void invalidate()
  {
    φ.riccati.invalidateCache();
    φ.cgf.d.invalidateCache();
    φ.context.invalidateAllCaches();
    pricingContext.invalidateAllCaches();
  }

  @Override
  public void close()
  {
    if (κ != null)
      κ.close();
    if (kLog != null)
      kLog.close();
    He.close();
    φ.close();
    if (ownsParameters)
    {
      S0.close();
      rr.close();
      K.close();
    }
  }
}
