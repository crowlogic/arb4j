package arb.stochastic.processes.heston;

import arb.Complex;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.ExpressionClassLoader;
import arb.functions.ConvergentSeriesAccumulator;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.RealFunctionSequence;
import arb.functions.integer.RealSequence;
import arb.functions.polynomials.orthogonal.real.ProbabilistHermitePolynomials;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;

/**
 * European call/put option pricer under the rough Heston model via a full
 * Edgeworth expansion of the log-price density around the matching Gaussian,
 * with the Hermite-basis weights c_n built by the Blinnikov–Moessner
 * recurrence. Closed-form, exact-symbolic Real arithmetic — no FFT, no
 * Carr–Madan / Lewis quadrature, no damping parameters, no integer-partition
 * enumeration.
 *
 * <h2>Cumulants from the Müntz–Padé d-sequence</h2>
 *
 * The log-characteristic-function Φ_N(v, T) = log φ_N(v, T) is a polynomial
 * in v supplied by {@link arb.functions.complex.MuntzPadeCumulantGenerator}
 * as the truncated Σ
 *
 * <pre>
 *   Φ_N(v, T) = Σ_{k=0..N} d_k(v) · T^(k·μ + 1)
 * </pre>
 *
 * where d_k(v) is the cgf's Müntz coefficient polynomial in v at order k.
 * The cumulants are read off Φ via the polynomial coefficient identity
 *
 * <pre>
 *   κ_j(T) = j! · Re( (-ⅈ)^j · Φ_j(T) )
 *          = j! · Re( exp(-ⅈ·j·π/2) · Σ_{k=0..N} (T^(k·μ+1) · d(k))[j] )
 * </pre>
 *
 * applied via compiled arb4j expressions registered in {@link #pricingContext}.
 * Every step — κ, the matching Gaussian m/σ²/σ, the standardized cumulants
 * S(k), the Edgeworth coefficients c(n), and the final price expression
 * ΠPricer(k) — is a compiled RealSequence or RealFunction. No Java loops,
 * no manual cumulant book-keeping, no Real vectors.
 *
 * <h2>Adaptive truncation</h2>
 *
 * {@link #call(Real, int, Real)} increments the Edgeworth order by one each
 * iteration (a(k) and d(k) are independent of N for fixed Fourier variable and
 * cached across iterations, so the marginal cost of growing the order by 1 is
 * just the new term plus the κ/S/c re-summation), accumulating the Edgeworth
 * partial sums directly. The scan stops when consecutive partial sums agree
 * within {@code 2^(-bits/2)} or the gap between them stops shrinking (the
 * asymptotic series' optimal truncation / precision floor), returning the
 * partial sum at that point.
 *
 * @author ©2025 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne for © terms
 * @see TheArb4jLibrary
 */
public class RoughHestonOptionPricer implements
                                      AutoCloseable
{
  private static final String                    DEFAULT_S0 = "1.0";
  private static final String                    DEFAULT_K  = "1.0";
  private static final String                    DEFAULT_rr = "0.0";
  private static final int                       SEED_N     = 8;

  /** Müntz order used for cumulant accumulation in {@link #call}. The Müntz
   *  coefficients a_k are order-invariant, so this is set well past cumulant
   *  convergence for the rough-Heston regime; the Edgeworth order J is what is
   *  adaptively (optimally) truncated, not N. */
  private static final int                       CUMULANT_ORDER = 48;

  /** Underlying CGF (and Müntz–Padé d-sequence via {@code φ.cgf.d}). */
  public final RoughHestonCharacteristicFunction φ;

  /** Spot price. */
  public final Real                              S0;

  /** Strike (log-moneyness driver). */
  public final Real                              K;

  /** Risk-free rate. */
  public final Real                              rr;

  /** Cumulant sequence κ(m) — compiled RealSequence. */
  public RealSequence                            κ;

  /** Parameter-derivative cumulant dκ(m) = ∂κ(m)/∂param, ∂a/∂param fed through the
   *  identical d→κ maps. The active parameter is selected by seeding ∂a/∂param via
   *  {@link RoughHestonRiccatiMuntzPadeFunctional#parameterDerivative}. */
  public RealSequence                            dκ;

  /** ε-perturbation knob (0 for forward pricing). The cumulants the price reads
   *  are κ(m)+ε·dκ(m), so ∂(price)/∂ε at ε=0 is ∂(price)/∂param by the chain rule. */
  public Real                                    ε;

  /** Standardized cumulant S(k) = κε(k) / (stdev()^k · Γ(k+1)). */
  public RealSequence                            S;

  /** Edgeworth correction coefficient c(n) — Blinnikov–Moessner recurrence. */
  public RealSequence                            c;

  /** mean() := κε(1) — nullary compiled scalar. */
  public RealNullaryFunction                     mScalar;

  /** variance() := κε(2). */
  public RealNullaryFunction                     σ2Scalar;

  /** stdev() := √κε(2). */
  public RealNullaryFunction                     σScalar;

  /** Probabilist Hermite polynomials, registered as {@code He} in pricing context. */
  public final ProbabilistHermitePolynomials     He;

  /** Compiled raw J-truncated Edgeworth partial sum: k (log-moneyness) → Π_J(k),
   *  a plain {@code Σ{j=3..J}} (no optimal truncation), so its ε-derivative is
   *  exactly {@link #priceSensitivity} term-for-term. {@link #call} prices via the
   *  optimally-truncated {@link #priceAdaptive}; this raw form drives the
   *  term-by-term sensitivity validation. */
  public RealFunction                            priceExpr;

  /** Optimally-truncated production price: k → Π(k), a {@code Σ{j=3..J~}} whose ~
   *  accumulator stops at the asymptotic series' smallest-term order J_Π and
   *  records it. {@link #call} and the sensitivity-truncation alignment use this. */
  public RealFunction                            priceAdaptive;

  /** Hermite density-correction sequence ΔCseq(j)(k); captured for its ε-derivative. */
  public RealFunctionSequence                    ΔCseq;

  /** Analytic ∂Π_J/∂param: the Edgeworth-Hermite price partial sum's parameter
   *  sensitivity at Hermite order J = leading Ψ plus Σⱼ(dc·ΔCseq + c·∂ΔCseq/∂ε),
   *  the term whose accumulation over J is the analytic ∂(price)/∂param. */
  public RealFunction                            priceSensitivity;

  /** Edgeworth–Hermite truncation order J — the adaptively (optimally) truncated
   *  density-correction order. An {@code arb.Integer} so the live order flows into
   *  the price chain without recompile; registered in {@link #φ}'s context. */
  public final Integer                           J = Integer.named("J").set(SEED_N);

  /** Leading (Black–Scholes) call value C(k) of the price, as a callable function. */
  public RealFunction                            blackScholes;

  /** Analytic Ċ(k) = ∂C/∂param: the leading-term sensitivity, built by the chain
   *  rule through mean=κ(1), variance=κ(2), standard deviation with the exact dκ.
   *  The active parameter is selected by {@link #seedParameterDerivative}. */
  public RealFunction                            blackScholesSensitivity;

  /** Put value P(k) = C(k) − S0·forward + K·e^{−rT} (put–call parity). */
  public RealFunction                            blackScholesPut;

  /** Analytic Ṗ(k) = ∂P/∂param: ∂C/∂param − S0·forward·(∂mean+∂variance/2). */
  public RealFunction                            blackScholesPutSensitivity;

  /** Dedicated pricing-side Context. */
  public final Context                           pricingContext;

  private final boolean                          ownsParameters;

  private Real                                   kLog;

  // ─────────────────────────────────────────────────────────────────────
  // Constructors
  // ─────────────────────────────────────────────────────────────────────

  /** No-arg / JShell-friendly: internally-owned CGF at default parameters. */
  public RoughHestonOptionPricer(Complex v)
  {
    this.φ              = new RoughHestonCharacteristicFunction(v);
    this.φ.N.set(SEED_N);

    this.S0             = new Real(DEFAULT_S0, 128).setName("S0");
    this.rr             = new Real(DEFAULT_rr, 128).setName("rr");
    this.K              = new Real(DEFAULT_K,  128);

    this.He             = new ProbabilistHermitePolynomials(128);

    registerJInCfContext();

    this.pricingContext = buildPricingContext();
    compileCumulantAndPriceChain();
    this.ownsParameters = true;
  }

  /** Context-based: composes into an outer model context. */
  public RoughHestonOptionPricer(Context context, Real K, Complex v)
  {
    if (context == null)
      throw new IllegalArgumentException("context must not be null");
    if (K == null)
      throw new IllegalArgumentException("K must not be null");

    this.φ              = new RoughHestonCharacteristicFunction(context, v);
    this.φ.N.set(SEED_N);

    this.S0             = required(context, "S0");
    this.rr             = required(context, "rr");
    this.K              = K;

    this.He             = new ProbabilistHermitePolynomials(128);

    registerJInCfContext();

    this.pricingContext = buildPricingContext();
    compileCumulantAndPriceChain();
    this.ownsParameters = false;
  }

  /**
   * Compile the cumulants and the Edgeworth price over the ε-perturbed cumulants
   * κε(m) = κ(m) + ε·dκ(m). At ε=0 this is the forward price; ∂(price)/∂ε at ε=0
   * is ∂(price)/∂param by the chain rule, with the active parameter selected by
   * seeding ∂a/∂param into dd via {@link RoughHestonRiccatiMuntzPadeFunctional#parameterDerivative}.
   * The mean/variance/stdev/S read κε, so every downstream quantity (c, GBS, the
   * Hermite corrections, the price) carries the perturbation automatically and
   * the compiler differentiates them with respect to ε with no hand-written chain rule.
   */
  private void compileCumulantAndPriceChain()
  {
    // CGF polynomials Φ = Σ_k T^{kμ+1}·d(k) and its parameter-derivative
    // ∂Φ = Σ_k T^{kμ+1}·dd(k), each a single ring-level sum of the coefficient
    // polynomials. The cumulants and their sensitivities are read off as the
    // point-derivatives κ_m = Re((−i)^m·Φ^{(m)}(0)) — no coefficient access (#1022).
    ComplexPolynomialNullaryFunction Φ  = ComplexPolynomialNullaryFunction.express("Φ", "Σk➔T^(k*μ+1)*d(k){k=0..N}", pricingContext);
    ComplexPolynomialNullaryFunction dΦ = ComplexPolynomialNullaryFunction.express("dΦ", "Σk➔T^(k*μ+1)*dd(k){k=0..N}", pricingContext);
    this.κ  = new RoughHestonCumulantSequence(Φ);
    this.dκ = new RoughHestonCumulantSequence(dΦ);
    pricingContext.registerFunction("κ", κ);
    pricingContext.registerFunction("dκ", dκ);
    // The cumulants the whole price chain reads are κε(m) = κ(m) + ε·dκ(m). At
    // ε=0 this is the forward price; ∂(anything built on these)/∂ε at ε=0 is its
    // ∂/∂param by the chain rule, the active parameter chosen by seeding dκ. The
    // compiler then differentiates GBS, ΔCseq, the price — everything except the
    // self-referential c — automatically; c gets the hand-written dc recurrence.
    this.mScalar   = RealNullaryFunction.express("mean", "κ(1)+ε*dκ(1)", pricingContext);
    this.σ2Scalar  = RealNullaryFunction.express("variance", "κ(2)+ε*dκ(2)", pricingContext);
    this.σScalar   = RealNullaryFunction.express("stdev", "sqrt(κ(2)+ε*dκ(2))", pricingContext);
    this.S         = RealSequence.express("S", "k➔(κ(k)+ε*dκ(k))/(stdev()^k*Γ(k+1))", pricingContext);
    this.c         = RealSequence.express("c", "n➔when(n=0,1,n<3,0,else,(1/n)*Σk➔k*S(k)*c(n-k){k=3..n})", pricingContext);
    this.priceExpr               = compilePriceExpression(pricingContext);
    this.blackScholes            = RealFunction.express("C:k➔GBS(k)", pricingContext);
    // Ψ = ∂C/∂param by the chain rule through mean=κ(1), variance=κ(2), σ=√κ(2)
    // with the exact cumulant derivatives dκ; ∂d1/∂param and ∂d2/∂param inlined.
    RealFunction.express("β1:k➔(dκ(1)+dκ(2))/stdev() - d1(k)*dκ(2)/(2*stdev()^2)", pricingContext);
    RealFunction.express("β2:k➔β1(k)-dκ(2)/(2*stdev())", pricingContext);
    this.blackScholesSensitivity = RealFunction.express("Ψ:k➔S0*exp(mean()+variance()/2)*((dκ(1)+dκ(2)/2)*NCDF(d1(k))+nGauss(d1(k))*β1(k)) - S0*exp(k-rr*T)*nGauss(d2(k))*β2(k)", pricingContext);
    this.blackScholesPut            = RealFunction.express("U:k➔C(k) - S0*exp(mean()+variance()/2) + S0*exp(k-rr*T)", pricingContext);
    this.blackScholesPutSensitivity = RealFunction.express("Ω:k➔Ψ(k) - S0*exp(mean()+variance()/2)*(dκ(1)+dκ(2)/2)", pricingContext);

    // Analytic sensitivity of the Edgeworth-Hermite price partial sum Π_J = the
    // hand-written ε-derivative of each piece (the AST differentiator cannot
    // propagate ε through the nullary mean()/variance()/stdev()). With κε in the
    // chain, ∂GBS/∂ε = Ψ. The cumulant standardisation derivatives dstdev, dS and
    // the self-referential Blinnikov–Moessner dc are the linearised recurrences;
    // the Hermite-correction derivative uses ∂zStar/∂ε = dzStar, ∂zσ/∂ε = dzσ, and
    // the probabilist-Hermite identity −x·Heₙ+n·Heₙ₋₁ = −Heₙ₊₁ which collapses
    // ∂(nGauss(z)·Heₙ(z))/∂ε to −nGauss(z)·Heₙ₊₁(z)·dz. dΠ's accumulation
    // over J is the analytic ∂(price)/∂param.
    RealNullaryFunction.express("dstdev", "dκ(2)/(2*stdev())", pricingContext);
    RealSequence.express("dS", "k➔dκ(k)/(stdev()^k*Γ(k+1)) - S(k)*k*dstdev()/stdev()", pricingContext);
    RealSequence.express("dc", "n➔when(n<3,0,else,(1/n)*Σk➔k*(dS(k)*c(n-k)+S(k)*dc(n-k)){k=3..n})", pricingContext);
    RealFunction.express("dzStar:k➔-dκ(1)/stdev() - (k-rr*T-mean())*dstdev()/stdev()^2", pricingContext);
    RealFunction.express("dzσ:k➔dzStar(k)-dstdev()", pricingContext);
    RealFunctionSequence.express("dhermiteOne:j➔k➔-nGauss(zStar(k))*He(j)(zStar(k))*dzStar(k)", pricingContext);
    RealFunctionSequence.express("dΔA:j➔k➔Σi➔(Γ(j+1)/(Γ(i+1)*Γ(j-i+1)))*("
                  + "(j-i)*stdev()^(j-i-1)*dstdev()*when(i=0,NCDF(-zσ(k)),else,nGauss(zσ(k))*He(i-1)(zσ(k)))"
                  + " - stdev()^(j-i)*nGauss(zσ(k))*He(i)(zσ(k))*dzσ(k)){i=0..j}",
                                 pricingContext);
    RealFunctionSequence.express("dΔCseq:j➔k➔(dκ(1)+dκ(2)/2)*(ΔCseq(j)(k)+exp(k-rr*T)*hermiteOne(j)(k))"
                  + " + exp(mean()+variance()/2)*dΔA(j)(k) - exp(k-rr*T)*dhermiteOne(j)(k)",
                                 pricingContext);
    this.priceSensitivity = RealFunction.express("dΠ:k➔Ψ(k)+S0*Σj➔(dc(j)*ΔCseq(j)(k)+c(j)*dΔCseq(j)(k)){j=3..J}", pricingContext);
  }

  /** Register J in the CF context so compiled expressions can see it. */
  private void registerJInCfContext()
  {
    if (φ.context.getVariable("J") == null)
      φ.context.registerVariable(J);
  }

  /**
   * Build the dedicated pricing context. Imports d, T, μ, N from {@link #φ}.
   */
  // The pricing-chain expressions (Φ, κ, mean, S, c, the GBS/Edgeworth price and
  // their ε-derivatives) are byte-for-byte identical for every pricer — they
  // reference d, T, μ, He and the parameters by name, never by value — so their
  // classes are generated once and reused: compile once, instantiate many. Each
  // pricer still gets fresh instances and its own variables via express() /
  // injectReferences; only the parse/generate/verify/JIT is shared.
  private static ExpressionClassLoader sharedPricingClasses;

  private static synchronized ExpressionClassLoader sharedPricingClasses(Context first)
  {
    if (sharedPricingClasses == null)
      sharedPricingClasses = new ExpressionClassLoader(first);
    return sharedPricingClasses;
  }

  private Context buildPricingContext()
  {
    Context ctx = new Context();
    ctx.classLoader = sharedPricingClasses(ctx);
    ctx.registerVariable(J);
    ctx.registerVariable(φ.N);
    ctx.registerVariable(S0);
    ctx.registerVariable(rr);
    ctx.registerVariable(φ.T);
    ctx.registerVariable(φ.μ);
    ctx.registerFunction("He", He);
    ctx.registerFunction("d", φ.cgf.d);
    // Sensitivity machinery. da = ∂a/∂param is the linearisation of the Müntz
    // recurrence over the coefficient-polynomial derivatives; dd = ∂d/∂param is
    // the identical d definition with a → da. The active parameter is chosen by
    // re-seeding da via φ.riccati.parameterDerivative(param). ε perturbs the
    // cumulants the price reads (κ→κ+ε·dκ), so ∂price/∂ε|₀ = ∂price/∂param.
    φ.riccati.parameterDerivative("ν", 128);
    ctx.registerFunction("dd",
                         ComplexPolynomialSequence.express("dd:k➔v➔when(k=0,w(0)*da(1)(v),else,u(k)*da(k)(v)+w(k)*da(k+1)(v))", φ.context));
    this.ε = new Real("0", 128).setName("ε");
    ctx.registerVariable(ε);
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
    // Optimally-truncated production price (used by call): the ~ accumulator
    // stops the asymptotic Edgeworth–Hermite series at its smallest-term order
    // J_Π and records it, so the parameter sensitivity can be summed to the SAME
    // order the price was truncated at.
    this.priceAdaptive = RealFunction.express("ΠAdaptive:k➔GBS(k)+S0*Σj➔(c(j)*ΔCseq(j)(k)){j=3..J~}", context);
    // Raw J-truncated partial sum (plain Σ{j=3..J}, no optimal truncation): its
    // ε-derivative is dΠ term-for-term, so callSensitivity sums dΠ to the J_Π
    // read off priceAdaptive.
    return RealFunction.express("ΠPricer:k➔GBS(k)+S0*Σj➔(c(j)*ΔCseq(j)(k)){j=3..J}", context);
  }

  private static Real required(Context ctx, String name)
  {
    Real v = ctx.getVariable(name);
    if (v == null)
      throw new IllegalArgumentException("Context is missing required Real variable " + name);
    return v;
  }

  // ─────────────────────────────────────────────────────────────────────
  // Adaptive call
  // ─────────────────────────────────────────────────────────────────────

  public Real call(int bits, Real dst)
  {
    return call(K, bits, dst);
  }

  /**
   * Adaptively price the call. Two independent controls:
   *
   * <ol>
   * <li><b>Müntz order N</b> (the cumulant accumulation): the Müntz coefficients
   * a_k — and hence the cumulants κ_m — are order-INVARIANT. Growing N only
   * accumulates more terms of the convergent cumulant sum; it never changes an
   * already-computed value, so it is set once to {@link #CUMULANT_ORDER} (well
   * past cumulant convergence for the rough-Heston regime) and never
   * invalidated.</li>
   * <li><b>Edgeworth–Hermite order J</b> (the density correction): the
   * Gram-Charlier/Edgeworth series is <em>asymptotic</em> — we grow J by one,
   * evaluate the partial sum directly, and stop at the optimal truncation:
   * when consecutive partial sums agree within {@code 2^(-bits/2)}, or as soon
   * as the gap between them stops shrinking. Changing J re-evaluates the price
   * expression directly (the c(n) it sums are J-independent), so this needs no
   * invalidation either.</li>
   * </ol>
   *
   * Used as in production: one solver per strike, pure accumulation, zero cache
   * invalidation.
   */
  /**
   * Accumulate the Edgeworth–Hermite partial sums of {@code expr} at the
   * already-formed log-strike {@link #kLog}, truncating optimally: return
   * {@code dst} as soon as consecutive partial sums agree to within
   * {@code 2^(-bits/2)}; otherwise scan every order and return the partial sum
   * at the globally smallest consecutive gap — the asymptotic series' optimal
   * truncation, whose distance from the true sum is bounded by the magnitude
   * of the first omitted term. (The gap sequence need not shrink monotonically
   * — the Edgeworth corrections arrive in odd/even bursts — so the minimum is
   * tracked globally rather than stopping at the first non-improvement.)
   * Evaluation is at exactly the caller-supplied {@code bits}: with no
   * ε-recurrence downstream there is nothing for a ballooning partial-sum
   * magnitude to corrupt, so no working-precision margin is required.
   */
  public Real call(Real strike, int bits, Real dst)
  {
    if (kLog == null) kLog = new Real();
    strike.div(S0, bits, kLog).log(bits, kLog);
    φ.N.set(CUMULANT_ORDER);
    J.set(CUMULANT_ORDER);
    return priceAdaptive.evaluate(kLog, 1, bits, dst);
  }

  /**
   * Analytic ∂(price)/∂param of the call, with respect to {@code param}
   * ∈ {λ, θ, ν, V0, ρ}. The price is the optimally-truncated accumulation of
   * the Edgeworth-Hermite partial sums Π_J; its parameter derivative is the
   * SAME accumulation applied to the analytic derivative partial sums dΠ_J =
   * ∂Π_J/∂param. The active parameter is seeded into the cumulant-derivative
   * machinery; then dΠ_J is accumulated exactly as the price is. No finite
   * differences.
   */
  public Real callSensitivity(String param, Real strike, int bits, Real dst)
  {
    seedParameterDerivative(param, bits);
    return callSensitivityForStrike(strike, bits, dst);
  }

  /**
   * Evaluate the parameter sensitivity at {@code strike} using the
   * already-seeded parameter-derivative coefficients. The seed
   * ({@link #seedParameterDerivative}) selects which parameter is differentiated
   * and is independent of strike, so it is done once and this evaluates the
   * accumulated dΠ for one strike over the already-computed derivative
   * coefficients.
   */
   public Real callSensitivityForStrike(Real strike, int bits, Real dst)
  {
    if (kLog == null) kLog = new Real();
    strike.div(S0, bits, kLog).log(bits, kLog);
    φ.N.set(CUMULANT_ORDER);
    J.set(CUMULANT_ORDER);
    // The Edgeworth–Hermite series is asymptotic, so the price Π self-truncates
    // at its optimal (smallest-term) order J_Π via its ~ accumulator. The finite
    // difference of the price differentiates Π_{J_Π}, so the analytic derivative
    // must sum the SAME number of terms — not its own independently-optimal order.
    // Evaluate the price once to learn J_Π, then sum dΠ (a plain {j=3..J} series)
    // to exactly that order. ε=0 here, so this price evaluation reads only the
    // base cumulants and does not disturb the seeded ∂/∂param chain dΠ reads.
    if (priceTruncationScratch == null) priceTruncationScratch = new Real();
    priceAdaptive.evaluate(kLog, 1, bits, priceTruncationScratch);
    J.set(priceOptimalTruncationOrder());
    return priceSensitivity.evaluate(kLog, 1, bits, dst);
  }

  /**
   * Read the optimal-truncation order J_Π that {@link #priceAdaptive}'s compiled
   * ~ summation settled on in its most recent evaluation. The compiler stores the
   * single Σ…{j=3..J~} accumulator as a public field of the generated class; its
   * {@link ConvergentSeriesAccumulator#truncationOrder} records that order.
   */
  private int priceOptimalTruncationOrder()
  {
    try
    {
      if (priceAccumulatorField == null)
      {
        for (java.lang.reflect.Field f : priceAdaptive.getClass().getFields())
        {
          if (ConvergentSeriesAccumulator.class.equals(f.getType()))
          {
            priceAccumulatorField = f;
            break;
          }
        }
      }
      ConvergentSeriesAccumulator acc = (ConvergentSeriesAccumulator) priceAccumulatorField.get(priceAdaptive);
      return acc.truncationOrder;
    }
    catch (ReflectiveOperationException | NullPointerException e)
    {
      throw new IllegalStateException("adaptive price expression has no ConvergentSeriesAccumulator field to read the truncation order from", e);
    }
  }

  private java.lang.reflect.Field priceAccumulatorField;
  private Real                    priceTruncationScratch;

  /**
   * Invalidate the caches after a model-parameter change (λ/θ/ν/V₀/ρ/μ) so the
   * next {@link #call} recomputes from the new parameters. This is the
   * parameter-change use of invalidation — legitimate and necessary — not the
   * forbidden order-growth use (the a_k are order-invariant; growing N only
   * accumulates terms and must never invalidate).
   */
  public void invalidate()
  {
    // Every function compiled in the pricing context (κ, dκ, mean, variance,
    // stdev, S, c, GBS, d1, d2, C, U, Ψ, Ω, …) hoists the values it reads from
    // its dependencies; a parameter change makes all of them stale, so all of
    // them must be invalidated — not a hand-picked subset. Omitting the price
    // functions left C/U/Ψ/Ω holding a stale mean()/variance(), which is why the
    // put value moved 7.9e-5 off after a parameter change.
    pricingContext.invalidateAllCaches();
    φ.riccati.invalidateCache();
    φ.cgf.d.invalidateCache();
  }

  /**
   * Invalidate the maturity-dependent fields — the cumulant Φ = Σ_k T^{kμ+1}·d_k
   * and everything downstream of it (κ, mean, variance, stdev, S, c, the
   * GBS/Edgeworth price) — while preserving the parameter-invariant Müntz
   * coefficients a_k/d_k (and their parameter-derivatives da_k/dd_k). a_k/d_k
   * depend on the model parameters {λ,θ,ν,V0,ρ,μ} alone, not on the maturity T or
   * the strike K, so when only T or K changes the fractional-Riccati solve must
   * NOT be redone. Use {@link #invalidate()} for a parameter change. The
   * φ.riccati / φ.cgf.d caches live in φ's own context, which {@code
   * pricingContext.invalidateAllCaches()} does not reach, so they survive.
   */
  public void invalidateMaturityDependentFields()
  {
    pricingContext.invalidateAllCaches();
  }

  /**
   * Select the parameter the sensitivity machinery is differentiating with
   * respect to: seed ∂a/∂param into the linearised recurrence and drop the stale
   * caches of everything built over it, so the next evaluation of
   * {@code priceExpr.derivative("ε")} yields ∂(price)/∂param.
   */
  public void seedParameterDerivative(String param, int bits)
  {
    φ.riccati.parameterDerivative(param, bits);
    // Choosing WHICH parameter to differentiate changes only the ε-derivative
    // chain (da, and hence dd/dκ and the ε-jet the price reads) — never the base
    // Müntz coefficients a_k/d_k or the base cumulants κ/Φ, which are
    // parameter-only and already current from the per-point invalidate() that
    // precedes the sensitivity loop. So drop only the pricing-context surface
    // caches (dd, dκ, mean, variance, stdev, S, c, the price/sensitivity); do NOT
    // re-solve the base fractional Riccati via φ.riccati/φ.cgf.d. The
    // non-propagating invalidateLocalCache the flat sweep uses leaves the base
    // a-sequence cache intact, so each Jacobian column reuses one base solve
    // instead of re-solving it per parameter.
    pricingContext.invalidateAllCaches();
  }

  // ─────────────────────────────────────────────────────────────────────
  // Lifecycle
  // ─────────────────────────────────────────────────────────────────────

  @Override
  public void close()
  {
    if (φ != null) φ.close();
    if (κ != null) κ.close();
    if (dκ != null) dκ.close();
    if (ownsParameters)
    {
      if (S0 != null) S0.close();
      if (K  != null) K.close();
      if (rr != null) rr.close();
    }
    if (J  != null) J.close();
    if (kLog != null) kLog.close();
    if (priceTruncationScratch != null) priceTruncationScratch.close();
  }
}
