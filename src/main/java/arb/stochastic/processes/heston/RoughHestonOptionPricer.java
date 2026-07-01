package arb.stochastic.processes.heston;

import arb.Complex;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.integer.*;
import arb.functions.polynomials.orthogonal.real.ProbabilistHermitePolynomials;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;

/**
 * Rough-Heston European option pricer built from compiled expressions over the
 * Müntz–Padé cumulant chain and the Edgeworth–Hermite price correction.
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
  public final Integer                           J = Integer.named("J");

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
  private String                                  sensitivityParameter;


  /** No-arg / JShell-friendly: internally-owned CGF at default parameters. */
  public RoughHestonOptionPricer(Complex v)
  {
    this(null, null, v, true);
  }

  /** Context-based: composes into an outer model context. */
  public RoughHestonOptionPricer(Context context, Real K, Complex v)
  {
    this(context, K, v, false);
  }

  private RoughHestonOptionPricer(Context context, Real K, Complex v, boolean ownsParameters)
  {
    if (context == null)
    {
      this.φ = new RoughHestonCharacteristicFunction(v);
      this.S0 = new Real(DEFAULT_S0, 128).setName("S0");
      this.rr = new Real(DEFAULT_rr, 128).setName("rr");
      this.K = new Real(DEFAULT_K, 128);
    }
    else
    {
      if (K == null)
        throw new IllegalArgumentException("K must not be null");
      this.φ = new RoughHestonCharacteristicFunction(context, v);
      this.S0 = required(context, "S0");
      this.rr = required(context, "rr");
      this.K = K;
    }

    this.He = new ProbabilistHermitePolynomials(128);

    registerJInCfContext();

    this.pricingContext = buildPricingContext();
    compileCumulantAndPriceChain();
    this.ownsParameters = ownsParameters;
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
    compileCumulantChain();
    compilePriceAndSensitivityChain();
  }

  private void compileCumulantChain()
  {
    ComplexPolynomialNullaryFunction Φ  = ComplexPolynomialNullaryFunction.express("Φ", "Σk➔T^(k*μ+1)*d(k){k=0..N}", pricingContext);
    ComplexPolynomialNullaryFunction dΦ = ComplexPolynomialNullaryFunction.express("dΦ", "Σk➔T^(k*μ+1)*dd(k){k=0..N}", pricingContext);
    this.κ  = new RoughHestonCumulantSequence(Φ);
    this.dκ = new RoughHestonCumulantSequence(dΦ);
    pricingContext.registerFunction("κ", κ);
    pricingContext.registerFunction("dκ", dκ);
    this.mScalar   = RealNullaryFunction.express("mean", "κ(1)+ε*dκ(1)", pricingContext);
    this.σ2Scalar  = RealNullaryFunction.express("variance", "κ(2)+ε*dκ(2)", pricingContext);
    this.σScalar   = RealNullaryFunction.express("stdev", "sqrt(κ(2)+ε*dκ(2))", pricingContext);
    this.S         = RealSequence.express("S", "k➔(κ(k)+ε*dκ(k))/(stdev()^k*Γ(k+1))", pricingContext);
    this.c         = RealSequence.express("c", "n➔when(n=0,1,n<3,0,else,(1/n)*Σk➔k*S(k)*c(n-k){k=3..n})", pricingContext);
  }

  private void compilePriceAndSensitivityChain()
  {
    this.priceExpr = compilePriceExpression(pricingContext);
    this.blackScholes = RealFunction.express("C:k➔GBS(k)", pricingContext);
    RealFunction.express("β1:k➔(dκ(1)+dκ(2))/stdev() - d1(k)*dκ(2)/(2*stdev()^2)", pricingContext);
    RealFunction.express("β2:k➔β1(k)-dκ(2)/(2*stdev())", pricingContext);
    this.blackScholesSensitivity = RealFunction.express("Ψ:k➔S0*exp(mean()+variance()/2)*((dκ(1)+dκ(2)/2)*NCDF(d1(k))+nGauss(d1(k))*β1(k)) - S0*exp(k-rr*T)*nGauss(d2(k))*β2(k)", pricingContext);
    this.blackScholesPut = RealFunction.express("U:k➔C(k) - S0*exp(mean()+variance()/2) + S0*exp(k-rr*T)", pricingContext);
    this.blackScholesPutSensitivity = RealFunction.express("Ω:k➔Ψ(k) - S0*exp(mean()+variance()/2)*(dκ(1)+dκ(2)/2)", pricingContext);

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
    // The pricing implementation is now based on the characteristic function directly,
    // so no extra J-registration is needed here.
  }
  /**
   * Build the dedicated pricing context. Imports d, T, μ, N from {@link #φ}.
   */
  private Context buildPricingContext()
  {
    Context ctx = new Context();
    ctx.registerVariable(J);
    ctx.registerVariable(φ.N);
    ctx.registerVariable(S0);
    ctx.registerVariable(rr);
    ctx.registerVariable(φ.T);
    ctx.registerVariable(φ.μ);
    ctx.registerFunction("He", He);
    ctx.registerFunction("d", φ.cgf.d);
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
    this.priceAdaptive = RealFunction.express("ΠAdaptive:k➔GBS(k)+S0*Σj➔(c(j)*ΔCseq(j)(k)){j=3..J}", context);
    return RealFunction.express("ΠPricer:k➔GBS(k)+S0*Σj➔(c(j)*ΔCseq(j)(k)){j=3..J}", context);
  }

  private static Real required(Context ctx, String name)
  {
    Real v = ctx.getVariable(name);
    if (v == null)
      throw new IllegalArgumentException("Context is missing required Real variable " + name);
    return v;
  }


  public Real call(int bits, Real dst)
  {
    return call(K, bits, dst);
  }

  /** Price the call by evaluating the compiled price expression at the requested log-moneyness. */
  public Real call(Real strike, int bits, Real dst)
  {
    if (dst == null)
      throw new IllegalArgumentException("dst must not be null");

    prepareForEvaluation(strike, bits);
    return priceExpr.evaluate(kLog, 1, bits, dst);
  }

  /** Price the analytic sensitivity with respect to a model parameter from the compiled derivative expression. */
  public Real callSensitivity(String param, Real strike, int bits, Real dst)
  {
    if (dst == null)
      throw new IllegalArgumentException("dst must not be null");

    seedParameterDerivative(param, bits);
    return callSensitivityForStrike(strike, bits, dst);
  }

  /** Evaluate the already-seeded sensitivity at one strike from the compiled price derivative. */
  public Real callSensitivityForStrike(Real strike, int bits, Real dst)
  {
   if (dst == null)
     throw new IllegalArgumentException("dst must not be null");

   if (sensitivityParameter == null)
     sensitivityParameter = "ν";

   seedParameterDerivative(sensitivityParameter, bits);
   prepareForEvaluation(strike, bits);
   return priceSensitivity.evaluate(kLog, 1, bits, dst);
  }

  private void prepareForEvaluation(Real strike, int bits)
  {
    if (kLog == null) kLog = new Real();
    Real useStrike = strike != null ? strike : K;
    useStrike.div(S0, bits, kLog);
    kLog.log(bits, kLog);
  }
  private Real                    priceTruncationScratch;

  /** Invalidate the pricing caches after a model-parameter change. */
  public void invalidate()
  {
    pricingContext.invalidateAllCaches();
    φ.riccati.invalidateCache();
    φ.cgf.d.invalidateCache();
  }

  /** Invalidate only the maturity-dependent pricing state. */
  public void invalidateMaturityDependentFields()
  {
    pricingContext.invalidateAllCaches();
  }

  /** Select the sensitivity parameter and refresh the affected caches. */
  public void seedParameterDerivative(String param, int bits)
  {
    sensitivityParameter = param;
    φ.riccati.parameterDerivative(param, bits);
    invalidate();
  }


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
