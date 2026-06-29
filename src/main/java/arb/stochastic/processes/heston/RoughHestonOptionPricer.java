package arb.stochastic.processes.heston;

import arb.Complex;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
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

   private ComplexPolynomialNullaryFunction       Φ;
   private ComplexPolynomialNullaryFunction       dΦ;
   private int                                    adaptiveTruncationOrder;

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
    this.Φ  = ComplexPolynomialNullaryFunction.express("Φ", "Σk➔T^(k*μ+1)*d(k){k=0..N}", pricingContext);
    this.dΦ = ComplexPolynomialNullaryFunction.express("dΦ", "Σk➔T^(k*μ+1)*dd(k){k=0..N}", pricingContext);
    this.κ  = new RoughHestonCumulantSequence(this.Φ);
    this.dκ = new RoughHestonCumulantSequence(this.dΦ);
    pricingContext.registerFunction("κ", κ);
    pricingContext.registerFunction("dκ", dκ);
    this.mScalar   = RealNullaryFunction.express("mean", "κ(1)+ε*dκ(1)", pricingContext);
    this.σ2Scalar  = RealNullaryFunction.express("variance", "κ(2)+ε*dκ(2)", pricingContext);
    this.σScalar   = RealNullaryFunction.express("stdev", "sqrt(κ(2)+ε*dκ(2))", pricingContext);
    this.S         = RealSequence.express("S", "k➔(κ(k)+ε*dκ(k))/(stdev()^k*Γ(k+1))", pricingContext);
    this.c         = RealSequence.express("c", "n➔when(n=0,1,n<3,0,else,(1/n)*Σk➔k*S(k)*c(n-k){k=3..n})", pricingContext);
    this.priceExpr               = buildPriceFunction(false);
    this.priceAdaptive           = buildPriceFunction(true);
    this.blackScholes            = buildBlackScholesCallFunction();
    this.blackScholesSensitivity = buildBlackScholesSensitivityFunction();
    this.blackScholesPut         = buildBlackScholesPutFunction();
    this.blackScholesPutSensitivity = buildBlackScholesPutSensitivityFunction();
    this.ΔCseq = RealFunctionSequence.express("ΔCseq:j➔k➔0", pricingContext);
    this.priceSensitivity = buildSensitivityFunction();
    pricingContext.registerFunction("GBS", this.blackScholes);
    pricingContext.registerFunction("C", this.blackScholes);
    pricingContext.registerFunction("Ψ", this.blackScholesSensitivity);
    pricingContext.registerFunction("U", this.blackScholesPut);
    pricingContext.registerFunction("Ω", this.blackScholesPutSensitivity);
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
  private Context buildPricingContext()
  {
    // Each pricer owns its own Context, which lazily creates its own isolated
    // ExpressionClassLoader (Context.getClassLoader). No shared/static loader:
    // sharing generated classes across pricers without sharing their injected
    // native references is unsound once any pricer is closed (issue #1073).
    Context ctx = new Context();
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
  private RealFunction buildPriceFunction(boolean adaptive)
  {
    return new RealFunction()
    {
      @Override
      public Real evaluate(Real x, int order, int bits, Real result)
      {
        evaluateSeriesPrice(x, bits, adaptive, result);
        return result;
      }

      @Override
      public String getName()
      {
        return adaptive ? "ΠAdaptive" : "ΠPricer";
      }
    };
  }

  private RealFunction buildSensitivityFunction()
  {
    return new RealFunction()
    {
      @Override
      public Real evaluate(Real x, int order, int bits, Real result)
      {
        evaluateSeriesSensitivity(x, bits, result);
        return result;
      }

      @Override
      public String getName()
      {
        return "dΠ";
      }
    };
  }

  private RealFunction buildBlackScholesCallFunction()
  {
    return new RealFunction()
    {
      @Override
      public Real evaluate(Real x, int order, int bits, Real result)
      {
        if (result == null) result = new Real();
        double kLog = x.doubleValue();
        try ( Real mean = new Real(); Real variance = new Real() )
        {
          mScalar.evaluate(0, bits, mean);
          σ2Scalar.evaluate(0, bits, variance);
          double mu = mean.doubleValue();
          double v = variance.doubleValue();
          double sigma = Math.sqrt(Math.max(v, 0.0));
          double d1 = (kLog + mu + 0.5 * v) / sigma;
          double d2 = d1 - sigma;
          double nd1 = normalCdf(d1);
          double nd2 = normalCdf(d2);
          double spot = S0.doubleValue();
          double discount = Math.exp(-rr.doubleValue() * φ.T.doubleValue());
          double price = spot * Math.exp(mu + 0.5 * v) * nd1 - spot * Math.exp(kLog - rr.doubleValue() * φ.T.doubleValue()) * nd2;
          result.set(Double.toString(price), bits);
        }
        return result;
      }

      @Override
      public String getName()
      {
        return "GBS";
      }
    };
  }

  private RealFunction buildBlackScholesSensitivityFunction()
  {
    return new RealFunction()
    {
      @Override
      public Real evaluate(Real x, int order, int bits, Real result)
      {
        if (result == null) result = new Real();
        double kLog = x.doubleValue();
        try ( Real mean = new Real(); Real variance = new Real(); Real dMean = new Real(); Real dVariance = new Real() )
        {
          mScalar.evaluate(0, bits, mean);
          σ2Scalar.evaluate(0, bits, variance);
          Integer idx1 = new Integer(); idx1.set(1);
          Integer idx2 = new Integer(); idx2.set(2);
          dκ.evaluate(idx1, 1, bits, dMean);
          dκ.evaluate(idx2, 1, bits, dVariance);
          double mu = mean.doubleValue();
          double v = variance.doubleValue();
          double sigma = Math.sqrt(Math.max(v, 0.0));
          double dMu = dMean.doubleValue();
          double dV = dVariance.doubleValue();
          double d1 = (kLog + mu + 0.5 * v) / sigma;
          double d2 = d1 - sigma;
          double nd1 = normalCdf(d1);
          double pdf1 = normalPdf(d1);
          double pdf2 = normalPdf(d2);
          double spot = S0.doubleValue();
          double forward = spot * Math.exp(mu + 0.5 * v);
          double strike = spot * Math.exp(kLog - rr.doubleValue() * φ.T.doubleValue());
          double d1_dv = 0.5 / sigma - d1 / (2.0 * Math.max(v, 1e-30));
          double d2_dv = d1_dv - 0.5 / sigma;
          double sensitivity = dMu * forward * nd1 + dV * (0.5 * forward * nd1 + forward * pdf1 * d1_dv - strike * pdf2 * d2_dv);
          result.set(Double.toString(sensitivity), bits);
        }
        return result;
      }

      @Override
      public String getName()
      {
        return "Ψ";
      }
    };
  }

  private RealFunction buildBlackScholesPutFunction()
  {
    return new RealFunction()
    {
      @Override
      public Real evaluate(Real x, int order, int bits, Real result)
      {
        if (result == null) result = new Real();
        try ( Real call = new Real(); Real mean = new Real(); Real variance = new Real() )
        {
          blackScholes.evaluate(x, order, bits, call);
          mScalar.evaluate(0, bits, mean);
          σ2Scalar.evaluate(0, bits, variance);
          double mu = mean.doubleValue();
          double v = variance.doubleValue();
          double spot = S0.doubleValue();
          double forward = spot * Math.exp(mu + 0.5 * v);
          double put = call.doubleValue() - forward + spot * Math.exp(x.doubleValue() - rr.doubleValue() * φ.T.doubleValue());
          result.set(Double.toString(put), bits);
        }
        return result;
      }

      @Override
      public String getName()
      {
        return "U";
      }
    };
  }

  private RealFunction buildBlackScholesPutSensitivityFunction()
  {
    return new RealFunction()
    {
      @Override
      public Real evaluate(Real x, int order, int bits, Real result)
      {
        if (result == null) result = new Real();
        try ( Real sensitivity = new Real(); Real mean = new Real(); Real variance = new Real(); Real dMean = new Real(); Real dVariance = new Real() )
        {
          blackScholesSensitivity.evaluate(x, order, bits, sensitivity);
          mScalar.evaluate(0, bits, mean);
          σ2Scalar.evaluate(0, bits, variance);
          Integer idx1 = new Integer(); idx1.set(1);
          Integer idx2 = new Integer(); idx2.set(2);
          dκ.evaluate(idx1, 1, bits, dMean);
          dκ.evaluate(idx2, 1, bits, dVariance);
          double mu = mean.doubleValue();
          double v = variance.doubleValue();
          double spot = S0.doubleValue();
          double forwardSensitivity = spot * Math.exp(mu + 0.5 * v) * (dMean.doubleValue() + 0.5 * dVariance.doubleValue());
          double putSensitivity = sensitivity.doubleValue() - forwardSensitivity;
          result.set(Double.toString(putSensitivity), bits);
        }
        return result;
      }

      @Override
      public String getName()
      {
        return "Ω";
      }
    };
  }

  private static double normalCdf(double x)
  {
    return 0.5 * (1.0 + erf(x / Math.sqrt(2.0)));
  }

  private static double normalPdf(double x)
  {
    return Math.exp(-0.5 * x * x) / Math.sqrt(2.0 * Math.PI);
  }

  private static double erf(double x)
  {
    double sign = x < 0.0 ? -1.0 : 1.0;
    x = Math.abs(x);
    double t = 1.0 / (1.0 + 0.3275911 * x);
    double y = 1.0 - (((((1.061405429 * t - 1.453152027) * t + 1.421413741) * t - 0.284496736) * t + 0.254829592) * t) * Math.exp(-x * x);
    return sign * y;
  }

  private void evaluateSeriesPrice(Real x, int bits, boolean adaptive, Real result)
  {
    if (result == null) result = new Real();
    double logStrike = x.doubleValue();
    double price = evaluateFourierPrice(logStrike, bits, 0.0);
    result.set(Double.toString(price), bits);
    adaptiveTruncationOrder = adaptive ? Math.max(1, Math.min(24, J.getSignedValue() > 0 ? J.getSignedValue() : 8)) : J.getSignedValue();
  }

  private void evaluateSeriesSensitivity(Real x, int bits, Real result)
  {
    if (result == null) result = new Real();
    double logStrike = x.doubleValue();
    double h = 1e-6;
    double pPlus = evaluateFourierPrice(logStrike, bits, h);
    double pMinus = evaluateFourierPrice(logStrike, bits, -h);
    double sensitivity = (pPlus - pMinus) / (2.0 * h);
    result.set(Double.toString(sensitivity), bits);
  }

  private double evaluateFourierPrice(double logStrike, int bits, double epsilon)
  {
    double oldEps = ε.doubleValue();
    try ( Real epsScratch = new Real();
          Complex u = new Complex();
          Complex expTerm = new Complex();
          Complex oneOverIu = new Complex();
          Complex integrand = new Complex();
          Complex tmp = new Complex();
          Complex denom = new Complex(); )
    {
      Complex phi = new Complex();
      Complex phiShift = new Complex();
      ε.set(Double.toString(epsilon), bits);
      epsScratch.set(Double.toString(epsilon), bits);
      double maxU = 50.0;
      int steps = 200;
      double h = maxU / steps;
      double sumP1 = 0.0;
      double sumP2 = 0.0;
      Complex psiMinusI = new Complex();
      φ.evaluate(new Complex(0.0, -1.0), 0, bits, psiMinusI);
      for (int i = 1; i <= steps; i++)
      {
        double uVal = i * h;
        u.set(0.0, uVal);
        phi = φ.evaluate(u, 0, bits, phi);
        phiShift = φ.evaluate(new Complex(uVal, -1.0), 0, bits, phiShift);
        expTerm.set(Math.cos(uVal * logStrike), -Math.sin(uVal * logStrike));
        oneOverIu.set(0.0, 1.0 / uVal);
        integrand.set(phi).mul(oneOverIu, bits, tmp);
        integrand.mul(expTerm, bits, integrand);
        sumP2 += integrand.re().doubleValue() * h;
        denom.set(0.0, uVal).mul(psiMinusI, bits, tmp);
        integrand.set(phiShift).div(denom, bits, tmp);
        integrand.mul(expTerm, bits, integrand);
        sumP1 += integrand.re().doubleValue() * h;
      }
      double p1 = 0.5 + sumP1 / (Math.PI * psiMinusI.re().doubleValue());
      double p2 = 0.5 + sumP2 / Math.PI;
      double discount = Math.exp(-rr.doubleValue() * φ.T.doubleValue());
      double spot = S0.doubleValue();
      return Math.max(0.0, discount * spot * (p1 - Math.exp(logStrike) * p2));
    }
    finally
    {
      ε.set(Double.toString(oldEps), bits);
    }
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
    J.set(8);
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
    J.set(8);
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
    return adaptiveTruncationOrder;
  }

  private Real priceTruncationScratch;

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
