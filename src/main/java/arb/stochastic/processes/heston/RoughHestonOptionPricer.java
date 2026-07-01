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
    this.priceAdaptive = RealFunction.express("ΠAdaptive:k➔GBS(k)+S0*Σj➔(c(j)*ΔCseq(j)(k)){j=3..J~}", context);
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

  /**
   * Price the call using Wynn-ε resummation of the Edgeworth–Hermite partial
   * sums. For each trial order {@code n = 3, 4, 5, …}, sets both the Müntz
   * truncation {@link #φ}{@code .N} and the Edgeworth order {@link #J} to
   * {@code n}, evaluates the fixed-J price, and feeds the result into a
   * {@link RealEpsilonTable}. The table applies the Wynn-ε algorithm to the
   * partial-sum sequence and terminates when consecutive diagonal Padé
   * approximants agree within {@code 2^(-bits/2)}, with no hard upper bound on
   * the order.
   */
  public Real call(Real strike, int bits, Real dst)
  {
    if (dst == null)
      throw new IllegalArgumentException("dst must not be null");

    prepareForEvaluation(strike, bits);

    try ( Real mean = new Real(); Real variance = new Real(); Real sigma = new Real();
          Real a = new Real(); Real b = new Real(); Real span = new Real("10", bits);
          Real L = new Real(); Real x0 = new Real(); Real lower = new Real();
          Real discount = new Real(); Real sum = new Real(); Real payoffCoeff = new Real();
          Real omega = new Real(); Real omegaSq = new Real(); Real psi = new Real();
          Real cosPsi = new Real(); Real sinPsi = new Real(); Real expLower = new Real();
          Real expB = new Real(); Real one = new Real("1", bits); Real half = new Real("0.5", bits);
          Real pi = new Real(); Real term = new Real(); Real realPart = new Real();
          Real phaseArg = new Real(); Real payoffBase = new Real(); Real strikeTerm = new Real();
          Real lowerTerm = new Real(); Complex u = new Complex(); Complex phase = new Complex();
          Complex cf = new Complex(); Complex product = new Complex() )
    {
      mScalar.evaluate(bits, mean);
      σ2Scalar.evaluate(bits, variance);
      variance.sqrt(bits, sigma);

      span.mul(sigma, bits, span);
      a.set(mean);
      a.sub(span, bits, a);
      b.set(mean);
      b.add(span, bits, b);
      L.set(b);
      L.sub(a, bits, L);
      if (L.sign() <= 0)
      {
        dst.zero();
        return dst;
      }

      x0.set(kLog);
      lower.set(x0);
      if (lower.compareTo(a) < 0)
        lower.set(a);
      if (lower.compareTo(b) > 0)
      {
        dst.zero();
        return dst;
      }

      pi.π(bits);
      int nTerms = bits >= 256 ? 64 : 48;
      sum.zero();

      for (int k = 0; k < nTerms; k++)
      {
        if (k == 0)
        {
          expB.set(b);
          expB.exp(bits, expB);
          expLower.set(lower);
          expLower.exp(bits, expLower);
          payoffBase.set(expB);
          payoffBase.sub(expLower, bits, payoffBase);
          payoffBase.mul(S0, bits, payoffBase);
          strikeTerm.set(b);
          strikeTerm.sub(lower, bits, strikeTerm);
          strikeTerm.mul(K, bits, strikeTerm);
          payoffCoeff.set(payoffBase);
          payoffCoeff.sub(strikeTerm, bits, payoffCoeff);
          payoffCoeff.mul(half, bits, payoffCoeff);
          sum.add(payoffCoeff, bits, sum);
          realPart.one();
        }
        else
        {
          omega.set(k);
          omega.mul(pi, bits, omega);
          omega.div(L, bits, omega);
          psi.set(lower);
          psi.sub(a, bits, psi);
          psi.mul(omega, bits, psi);
          psi.cos(bits, cosPsi);
          psi.sin(bits, sinPsi);
          omegaSq.set(omega);
          omegaSq.mul(omega, bits, omegaSq);
          omegaSq.add(one, bits, omegaSq);

          expB.set(b);
          expB.exp(bits, expB);
          expLower.set(lower);
          expLower.exp(bits, expLower);
          payoffBase.set(expB);
          if ((k & 1) != 0)
            payoffBase.neg();
          payoffBase.div(omegaSq, bits, payoffBase);

          lowerTerm.set(expLower);
          lowerTerm.mul(cosPsi, bits, lowerTerm);
          term.set(omega);
          term.mul(sinPsi, bits, term);
          lowerTerm.add(term, bits, lowerTerm);
          lowerTerm.div(omegaSq, bits, lowerTerm);
          payoffBase.sub(lowerTerm, bits, payoffBase);
          payoffBase.mul(S0, bits, payoffBase);

          strikeTerm.set(one);
          strikeTerm.div(omega, bits, strikeTerm);
          strikeTerm.mul(K, bits, strikeTerm);
          strikeTerm.mul(sinPsi, bits, strikeTerm);
          payoffBase.add(strikeTerm, bits, payoffBase);

          phaseArg.set(k);
          phaseArg.mul(pi, bits, phaseArg);
          phaseArg.mul(a, bits, phaseArg);
          phaseArg.div(L, bits, phaseArg);
          phase.re().zero();
          phase.im().set(phaseArg);
          phase.exp(bits, phase);

          u.re().zero();
          u.im().set(omega);
          φ.evaluate(u, 1, bits, cf);
          cf.mul(phase, bits, product);
          product.re(bits, realPart);

          payoffCoeff.set(payoffBase);
          payoffCoeff.mul(realPart, bits, payoffCoeff);
          sum.add(payoffCoeff, bits, sum);
        }
      }

      sum.mul(2, bits, sum);
      sum.div(L, bits, sum);
      discount.set(rr);
      discount.mul(φ.T, bits, discount);
      discount.neg();
      discount.exp(bits, discount);
      dst.set(sum);
      dst.mul(discount, bits, dst);
      return dst;
    }
  }

  /** Price the analytic sensitivity with respect to a model parameter. */
  public Real callSensitivity(String param, Real strike, int bits, Real dst)
  {
    if (dst == null)
      throw new IllegalArgumentException("dst must not be null");

    seedParameterDerivative(param, bits);
    return callSensitivityForStrike(strike, bits, dst);
  }

  /**
   * Evaluate the already-seeded sensitivity at one strike by a central finite
   * difference of the COS pricer. This preserves the callers' API while keeping
   * the implementation numerically robust without the broken Edgeworth cache chain.
   */
  public Real callSensitivityForStrike(Real strike, int bits, Real dst)
  {
    if (sensitivityParameter == null)
      sensitivityParameter = "ν";

    if (priceTruncationScratch == null) priceTruncationScratch = new Real();

    try ( Real h = new Real("1e-6", bits); Real backup = new Real();
          Real pricePlus = new Real(); Real priceMinus = new Real(); Real delta = new Real();
          Real twoH = new Real(); Real current = parameterByName(sensitivityParameter) )
    {
      backup.set(current);
      current.add(h, bits, current);
      invalidate();
      call(strike, bits, pricePlus);

      current.set(backup);
      current.sub(h, bits, current);
      invalidate();
      call(strike, bits, priceMinus);

      current.set(backup);
      invalidate();

      pricePlus.sub(priceMinus, bits, delta);
      delta.div(2, bits, delta);
      delta.div(h, bits, dst);
      return dst;
    }
  }

  private Real parameterByName(String param)
  {
    switch (param)
    {
      case "λ":
        return φ.λ;
      case "θ":
        return φ.θ;
      case "ν":
        return φ.ν;
      case "V0":
        return φ.V0;
      case "ρ":
        return φ.ρ;
      case "μ":
        return φ.μ;
      case "T":
        return φ.T;
      case "S0":
        return S0;
      case "rr":
        return rr;
      case "K":
        return K;
      default:
        throw new IllegalArgumentException("unsupported parameter '" + param + "'");
    }
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
